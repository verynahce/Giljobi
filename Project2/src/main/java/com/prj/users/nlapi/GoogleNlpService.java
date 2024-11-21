package com.prj.users.nlapi;

import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.AnalyzeSyntaxResponse;
import com.google.cloud.language.v1.Token;
import com.google.cloud.language.v1.AnalyzeEntitiesResponse;
import com.google.cloud.language.v1.Entity;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class GoogleNlpService {

    // 텍스트 분석 및 피드백 생성 메서드
	public ResumeFeedback analyzeResumeText(String text) throws IOException {
	    ResumeFeedback feedback = new ResumeFeedback();

	    System.setProperty("GOOGLE_APPLICATION_CREDENTIALS", "D:\\GreenGIt\\TeamProject2\\Project2\\src\\main\\resources\\civic-badge-442423-u4-0ca5b0062e2a.json");

	    try (LanguageServiceClient language = LanguageServiceClient.create()) {
	        Document doc = Document.newBuilder()
	                .setContent(text)
	                .setType(Document.Type.PLAIN_TEXT)
	                .build();

	        // 문법 분석
	        AnalyzeSyntaxResponse syntaxResponse = language.analyzeSyntax(doc);
	        List<String> grammarCorrections = new ArrayList<>();
	        for (Token token : syntaxResponse.getTokensList()) {
	            if (token.getPartOfSpeech().getTag().name().equals("VERB") && token.getLemma().equals("achieve")) {
	                grammarCorrections.add("구체적인 성과 단어 사용 권장: " + token.getText().getContent());
	            }
	        }
	        feedback.setGrammarCorrections(grammarCorrections);

	        // 엔티티 분석
	        AnalyzeEntitiesResponse entitiesResponse = language.analyzeEntities(doc);
	        List<String> keywordSuggestions = new ArrayList<>();
	        for (Entity entity : entitiesResponse.getEntitiesList()) {
	            if (entity.getType().name().equals("ORGANIZATION") || entity.getType().name().equals("PERSON")) {
	                keywordSuggestions.add(entity.getName());
	            }
	        }
	        feedback.setKeywordSuggestions(keywordSuggestions);

	        feedback.setOverallFeedback("이력서에서 주요 키워드와 문법 오류를 검토하였습니다.");
	    } catch (IOException e) {
	        System.err.println("Google NLP API 호출 중 IO 예외 발생: " + e.getMessage());
	        e.printStackTrace();
	        throw e;
	    } catch (Exception e) {
	        System.err.println("Google NLP API 호출 중 예기치 않은 예외 발생: " + e.getMessage());
	        e.printStackTrace();
	        throw new RuntimeException("Google NLP 분석 오류: " + e.getMessage(), e);
	    }

	    return feedback;
	}

}

