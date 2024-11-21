package com.prj.users.nlapi;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ResumeFeedback {
    private List<String> grammarCorrections;
    private List<String> keywordSuggestions;
    private String overallFeedback;

}
