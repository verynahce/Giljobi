package com.prj.coverletter.vo;
import lombok.Data;

import java.util.List;

@Data
public class CoverLetterRequest {
    private List<Message> messages;

    @Data
    public static class Message {
        private String role;
        private String content;
    }
}
