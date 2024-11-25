package com.prj.coverletter.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.prj.coverletter.vo.CoverLetterRequest;

@RestController
@RequestMapping("/coverletter")
public class CoverLetterController {

    @Value("${openai.api.key}")
    private String openaiApiKey;

    private static final Logger logger = LoggerFactory.getLogger(CoverLetterController.class);
    private final RestTemplate restTemplate;

    public CoverLetterController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @PostMapping("/improve")
    public ResponseEntity<Map<String, String>> improveCoverLetter(@RequestBody CoverLetterRequest request) {
        String url = "https://api.openai.com/v1/chat/completions";

        logger.debug("Cover Letter received: {}", request);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + openaiApiKey);
        headers.set("Content-Type", "application/json");

        // ObjectMapper를 사용하여 JSON 문자열 생성
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> requestBodyMap = new HashMap<>();
        requestBodyMap.put("model", "gpt-3.5-turbo");
        requestBodyMap.put("messages", request.getMessages());
        requestBodyMap.put("max_tokens", 1000);

        String requestBody;
        try {
            requestBody = objectMapper.writeValueAsString(requestBodyMap);
        } catch (JsonProcessingException e) {
            logger.error("JSON 변환 오류: {}", e.getMessage());
            return ResponseEntity.badRequest().body(Map.of("message", "JSON 변환 오류"));
        }

        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        // OpenAI API 응답 처리
        if (response.getStatusCode().is2xxSuccessful()) {
            String responseBody = response.getBody();
            try {
                JsonNode jsonNode = objectMapper.readTree(responseBody);
                String improvedCoverLetter = jsonNode.get("choices").get(0).get("message").get("content").asText();

                Map<String, String> result = new HashMap<>();
                result.put("improvedCoverLetter", improvedCoverLetter);
                return ResponseEntity.ok(result);
            } catch (IOException e) {
                logger.error("응답 JSON 파싱 오류: {}", e.getMessage());
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", "응답 처리 중 오류가 발생했습니다."));
            }
        } else {
            logger.error("OpenAI API 호출 실패: {}", response.getBody());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", "OpenAI API 호출 실패"));
        }
    }
}
