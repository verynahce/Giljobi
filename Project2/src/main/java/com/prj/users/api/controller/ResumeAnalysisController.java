package com.prj.users.api.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.prj.users.nlapi.GoogleNlpService;
import com.prj.users.nlapi.ResumeFeedback;


@RestController
public class ResumeAnalysisController {

	@Autowired
    private GoogleNlpService googleNlpService;

    public ResumeAnalysisController(GoogleNlpService googleNlpService) {
        this.googleNlpService = googleNlpService;
    }

    @PostMapping("/api/resume/analyze")
    public ResponseEntity<ResumeFeedback> analyzeResume(@RequestBody Map<String, String> request) {
        String text = request.get("text");
        System.out.println("Received text: " + text);
        System.out.println("GOOGLE_APPLICATION_CREDENTIALS: " + System.getenv("GOOGLE_APPLICATION_CREDENTIALS"));

        System.setProperty("GOOGLE_APPLICATION_CREDENTIALS", "D:\\GreenGIt\\TeamProject2\\Project2\\src\\main\\resources\\civic-badge-442423-u4-0ca5b0062e2a.json");


        if (text == null || text.trim().isEmpty()) {
            System.out.println("Error: text is null or empty");
            return ResponseEntity.badRequest().body(null);
        }

        try {
            ResumeFeedback feedback = googleNlpService.analyzeResumeText(text);
            System.out.println("Analysis result: " + feedback);
            return ResponseEntity.ok(feedback);
        } catch (Exception e) {
            System.err.println("Error during resume analysis:");
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }
    
    @RequestMapping(value = "/api/resume/analyze", method = RequestMethod.GET)
    public ResponseEntity<String> handleGetRequest() {
        return ResponseEntity
                .status(HttpStatus.METHOD_NOT_ALLOWED)
                .body("GET method is not allowed. Please use POST.");
    }
}


