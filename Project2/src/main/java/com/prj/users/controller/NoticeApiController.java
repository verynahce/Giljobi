package com.prj.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.prj.users.notice.dto.NoticeDto;
import com.prj.users.notice.service.NoticeService;

@RestController
@RequestMapping("/api/Notice")
public class NoticeApiController {

    @Autowired
    private NoticeService noticeService;

    // 알림 조회
    @GetMapping
    public ResponseEntity<List<NoticeDto>> getNoticeItems(@RequestParam("user_idx") Integer user_idx) {
        List<NoticeDto> noticeItems = noticeService.getNoticeItems(user_idx);
        return ResponseEntity.ok(noticeItems);
    }

    // 읽음 처리
    @PatchMapping("/{notice_idx}/read")
    public ResponseEntity<Void> markAsRead(@PathVariable Integer notice_idx) {
        noticeService.markAsRead(notice_idx);
        return ResponseEntity.noContent().build();
    }

    // 알림 삭제
    @DeleteMapping("/{notice_idx}")
    public ResponseEntity<Void> deleteNoticeItem(@PathVariable Integer notice_idx) {
        noticeService.deleteNoticeItem(notice_idx);
        return ResponseEntity.noContent().build();
    }
}
