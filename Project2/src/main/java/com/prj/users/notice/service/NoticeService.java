package com.prj.users.notice.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.users.notice.dto.NoticeDto;

@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    // 알림 목록 조회
    public List<NoticeDto> getNoticeItems(Integer useridx) {
        return noticeRepository.findByUseridx(useridx)
                .stream()
                .map(NoticeDto::new) // Entity -> DTO 변환
                .collect(Collectors.toList());
    }

    // 읽음 처리
    public void markAsRead(Integer notice_idx) {
        Notice notice = noticeRepository.findById(notice_idx)
                .orElseThrow(() -> new RuntimeException("알림이 존재하지 않습니다."));
        notice.setState(true);
        noticeRepository.save(notice);
    }

    // 알림 삭제
    public void deleteNoticeItem(Integer notice_idx) {
        if (!noticeRepository.existsById(notice_idx)) {
            throw new ResourceNotFoundException("알림이 존재하지 않습니다.");
        }
        noticeRepository.deleteById(notice_idx);
    }
}
