package com.prj.users.notification.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.prj.users.notification.dao.NoticeDao;
import com.prj.users.notification.service.Announce;
import com.prj.users.notification.service.AnnounceService;
import com.prj.users.notification.service.Notice;
import com.prj.users.notification.service.NoticeService;

@RestController
@RequestMapping("/api")
public class NotificationApiController {

    @Autowired
    private AnnounceService announceService;
    
    @Autowired
    private NoticeService noticeService;
    
    @Autowired
    private NoticeDao noticeDao;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @GetMapping
    public String showAnnounce(Model model) {
        model.addAttribute("announce", new Announce());
        return "companys/mypage/applyList/view";
    }

    
    @PostMapping("/announce")
    public ResponseEntity<Map<String, Object>> sendAnnounce(@ModelAttribute Announce announce, 
                                                            @RequestParam("companyIdx") Integer companyIdx, 
                                                            @RequestParam("post_idx") int post_idx) {
        
    	if (announce.getCompanyIdx() == null) {
            return ResponseEntity.badRequest().body(Map.of("message", "잘못된 요청입니다. 모든 필드를 제공해야 합니다."));
        }

        // Announce 저장
        try {
            announceService.sendAnnounce(announce);
            System.out.println("Received Announce: " + announce);
            // 저장된 announcementIdx 반환
            Map<String, Object> response = new HashMap<>();
            response.put("message", "알림이 성공적으로 전송되었습니다.");
            response.put("announcementIdx", announce.getAnnouncementIdx());
            
            return ResponseEntity.status(HttpStatus.OK).body(response);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("message", "서버 오류 발생", "error", e.getMessage()));
        }

    }

    
    
    //알림삭제
    @DeleteMapping("/notification/remove/{noticeIdx}")
    public ResponseEntity<String> deleteNotification(@PathVariable("noticeIdx") Integer noticeIdx) {
    	noticeService.deleteNotification(noticeIdx);
    	return ResponseEntity.ok("알림이 삭제되었습니다.");
    }

    
    //개인회원 알림 확인
    /*@GetMapping("/notice/list/{userIdx}")
    public ResponseEntity<List<Notice>> getUserNotifications(@PathVariable Integer userIdx) {
        List<Notice> notifications = noticeDao.getNotificationsByUserIdx(userIdx);
        return ResponseEntity.ok(notifications);
    }*/
    



    /*
    @PutMapping("/mark-read/{noticeIdx}")
    public ResponseEntity<String> markAsRead(@PathVariable Integer noticeIdx) {
        noticeService.markNotificationAsRead(noticeIdx);
        return ResponseEntity.ok("알림을 읽음으로 표시했습니다.");
    }
    
    /*

    @PutMapping("/{notificationIdx}/read")
    public ResponseEntity<String> markAsRead(@PathVariable Integer notificationIdx) {
    	noticeService.markNotificationAsRead(notificationIdx);
        return ResponseEntity.ok("알림 읽음 처리 완료");
    }
    */
    
    /*
    @PostMapping("/notice/list/{userIdx}")
    public ResponseEntity<Map<String, String>> sendNotification(@RequestBody Notice notice) {
        // 알림 저장
        noticeDao.saveNotice(notice);

        // 응답 데이터 생성
        Map<String, String> response = new HashMap<>();
        response.put("message", "알림이 성공적으로 전송되었습니다.");
        response.put("notificationTitle", generateNotificationTitle(notice.getType()));
        response.put("subNotification", generateSubNotification(notice.getType()));

        return ResponseEntity.ok(response);
    }

*/
    


    // 알림 리스트 조회
    /*@GetMapping("/user/{userIdx}")
    public ResponseEntity<List<Map<String, Object>>> getNotifications(@PathVariable int userIdx) {
        List<Map<String, Object>> notifications = noticeService.getNoticesForUser(userIdx);
        return ResponseEntity.ok(notifications);
    }*/
    

    @PostMapping("/send-notification")
    public ResponseEntity<String> sendNotification(@RequestBody Notice notice) {
        try {
            noticeService.sendNotification(notice);
            return ResponseEntity.ok("알림이 저장되었습니다.");
        } catch (Exception e) {
            e.printStackTrace(); // 예외 스택 트레이스를 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("알림 전송 실패: " + e.getMessage());
        }
    }
  //중요===================================================================================
    @GetMapping("/notifications/{noticeIdx}")
    public ResponseEntity<Announce> getNoticeDetail(@PathVariable("noticeIdx") Integer noticeIdx) {
        Announce announce = noticeService.getAnnouncementDetails(noticeIdx);
        return ResponseEntity.ok(announce);
    }
  //중요===================================================================================

    @GetMapping("/notifications/type/{userIdx}/{type}")
    public ResponseEntity<List<Notice>> getNoticesByType(
            @PathVariable("userIdx") int userIdx,
            @PathVariable("type") String type) {

        // 서비스 호출
        List<Notice> notices = noticeService.getNoticesByUserAndType(userIdx, type);
        
        // 로그 확인
        System.out.println("응애: " + notices);
        
        // JSON 응답 반환
        return ResponseEntity.ok(notices);
    }


    @PostMapping("/notifications/read/{noticeIdx}")
    public ResponseEntity<String> markAsRead(@PathVariable("noticeIdx") int noticeIdx) {
        boolean isUpdated = noticeService.markNoticeAsRead(noticeIdx);
        if (isUpdated) {
            return ResponseEntity.ok("알림이 읽음 처리되었습니다.");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("알림 읽음 처리 실패");
    }
    
    //새알림 
    @GetMapping("/recent/{userId}")
    public ResponseEntity<List<Notice>> getNewNotifications(@PathVariable("userIdx") Integer userIdx) {
    	String sql = "SELECT * FROM NOTICE WHERE USER_IDX = ? AND STATE = 0";
    	List<Notice> newNotifications = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Notice.class), userIdx);
    	return ResponseEntity.ok(newNotifications);
    }

    
}
