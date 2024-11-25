package com.prj.users.notification.controller;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.prj.users.notification.dao.NoticeDao;
import com.prj.users.notification.service.Announce;
import com.prj.users.notification.service.AnnounceService;
import com.prj.users.notification.service.Notice;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/api")
public class NotificationApiController {

    @Autowired
    private AnnounceService announceService;
    
    private final NoticeDao noticeDao = new NoticeDao();
    
    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("announce", new Announce());
        return "companys/mypage/applyList/view";
    }

    
    @PostMapping("/announce")
    public ResponseEntity<String> sendAnnounce(@ModelAttribute Announce announce, 
									    		@RequestParam("companyIdx") Integer companyIdx, 
									            @RequestParam("post_idx") int post_idx) {
        if (announce.getCompanyIdx() == null) {
            return ResponseEntity.badRequest().body("잘못된 요청입니다. 모든 필드를 제공해야 합니다.");
        }

        announceService.sendAnnounce(announce);
        return ResponseEntity.status(HttpStatus.FOUND)
                .location(URI.create("/Company/Mypage/ApplyList/ApplyList?company_idx="+companyIdx +"&post_idx="+post_idx))
                .build();
    }
    


    @GetMapping("/notice/list")
    public List<Notice> getAllNotifications(@PathVariable int companyId) throws SQLException {
        return noticeDao.getAllNotifications(companyId);
    }

    @PostMapping
    public String addNotice(@RequestBody Notice notice) throws SQLException {
    	noticeDao.addNotification(notice);
        return "Notification added successfully!";
    }
}
