package com.prj.users.announce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prj.users.announce.service.Announce;
import com.prj.users.announce.service.AnnounceService;

@RestController
@RequestMapping("/api")
public class AnnounceApiController {

    @Autowired
    private AnnounceService announceService;
    
    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("announce", new Announce());
        return "companys/mypage/applyList/view"; // notificationForm.jsp로 이동
    }

    
    @PostMapping("/announce")
    public ResponseEntity<String> sendAnnounce(@ModelAttribute Announce announce) {
        if (announce.getCompanyIdx() == null || announce.getUserIdx() == null || announce.getAnnouncementIdx() == null) {
            return ResponseEntity.badRequest().body("잘못된 요청입니다. 모든 필드를 제공해야 합니다.");
        }

        announceService.sendAnnounce(announce);
        return ResponseEntity.status(HttpStatus.CREATED).body("알림이 성공적으로 전송되었습니다.");
    }
}
