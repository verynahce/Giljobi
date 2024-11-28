package com.prj.users.notification.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.users.notification.dao.NoticeDao;

@Service
public class NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    
	private String generateNotificationTitle(String type) {
    	switch (type) {
    	case "document":
    		return "🎉서류 합격 알림";
    	case "interview":
    		return "🎉면접 합격 알림";
    	case "reply":
    		return "💬댓글 알림";
    	case "resume":
    		return "📑이력서 알림";
    	case "post":
    		return "🏢공고 알림";
    	default:
    		return "❗새로운 알림";
    	}
    }
                    
    private String generateSubNotification(String type) {
    	switch (type) {
    	case "document":
    		return "축하드립니다! 서류심사를 통과하셨습니다! 자세한 내용을 확인해주세요!";
    	case "interview":
    		return "축하드립니다! 지원하신 채용에 최종 면접을 통과하셨습니다! 클릭해서 자세한 내용을 확인하세요";
    	case "reply":
    		return "작성하신 게시글에 새로운 댓글이 달렸습니다.";
    	case "resume":
    		return "회원님께서 지원한 회사에서 회원님의 이력서를 확인하였습니다.";
    	case "post":
    		return "회원님께서 북마크하신 회사의 새로운 공고가 올라왔습니다.";
    	default:
    		return "클릭해서 자세한 내용을 확인해주세요.";
    	}
    }
    
    // 알림 저장 메서드
    public void sendNotification(Notice notice) {
        // type에 맞는 제목과 세부 내용을 설정
        notice.setNotification(generateNotificationTitle(notice.getType()));
        notice.setSubnoti(generateSubNotification(notice.getType()));
        
        // notice 객체를 DB에 저장 (MyBatis, JPA 등)
        noticeDao.save(notice);
    }
    //중요===================================================================================
    public Announce getAnnouncementDetails(Integer noticeIdx) {
        // NOTICE 테이블에서 ANNOUNCEMENT_IDX 가져오기
        Integer announcementIdx = noticeDao.getAnnouncementIdx(noticeIdx);
        if (announcementIdx == null) {
            throw new IllegalArgumentException("해당 알림에 대한 공지사항이 존재하지 않습니다.");
        }
        // ANNOUNCEMENT 테이블에서 상세 데이터 가져오기
        return noticeDao.getAnnouncementDetails(announcementIdx);
    }
    //중요===================================================================================
    
    public List<Notice> getNoticesByUserAndType(int userIdx, String type) {
        return noticeDao.findNoticesByUserAndType(userIdx, type);
    }

    public boolean markNoticeAsRead(int noticeIdx) {
        return noticeDao.updateNoticeState(noticeIdx, 1); // 1 = 읽음
    }

	public List<Integer> getNoticesByUser(int user_idx) {
		return noticeDao.findNoticeIdxByUser(user_idx);
	}

	//알림 삭제
	public void deleteNotification(Integer noticeIdx) {
		noticeDao.deleteNotice(noticeIdx);
	}
	/*
    // 알림 전송 메서드
    public void sendNotification(Notice notice) {
        // 알림의 type을 결정하는 로직 추가 (예: 댓글, 기업 등)
        if (notice.getType() == null) {
            // 기본값 설정 또는 예외 처리
            throw new IllegalArgumentException("알림 타입이 설정되지 않았습니다.");
        }
        noticeDao.insertNotice(notice);
    }
    */
    /*
    public void saveNotification(Announce announce) {
    	noticeDao.saveNotification(announce);
    }
    */
    
    /*
    public List<Announce> getNotifications(Integer userIdx) {
    	return noticeDao.getNotifications(userIdx);
    }
    
    // 알림 전송 메서드, 댓글 작성시 알림 저장
    public void sendNotification(Notice notice) {
        noticeDao.saveNotice(notice);
    }
    
    //알림 읽음 여부
    public void markNotificationAsRead(Integer noticeIdx) {
    	noticeDao.markAsRead(noticeIdx);
    }
    
    
    /*
    public List<Map<String, Object>> getNoticesByType(int userIdx) {
        List<Map<String, Object>> notices = noticeDao.getUserNoticesWithDynamicIdx(userIdx);

        return notices.stream().map(notice -> {
            String type = (String) notice.get("TYPE");
            Object relatedIdx = null;

            switch (type) {
                case "DOCUMENT":
                    relatedIdx = notice.get("ANNOUNCEMENT_IDX");
                    break;
                case "INTERVIEW":
                	relatedIdx = notice.get("ANNOUNCEMENT_IDX");
                	break;
                case "REPLY":
                    relatedIdx = notice.get("REPLY_IDX");
                    break;
                case "SYSTEM":
                    relatedIdx = null;
                    break;
                default:
                    relatedIdx = null;
            }

            notice.put("RELATED_IDX", relatedIdx);
            return notice;
        }).collect(Collectors.toList());
    }
    */
    
    /*
    public List<Map<String, Object>> getNoticesForUser(int userIdx) {
        List<Map<String, Object>> notices = noticeDao.getNoticesWithDynamicIdx(userIdx);

        return notices.stream().map(notice -> {
            // TYPE에 따라 추가적인 로직 적용 가능
            Object relatedIdx = notice.get("RELATED_IDX");
            if ("DOCUMENT".equals(notice.get("TYPE"))) {
                notice.put("DETAIL_URL", "/api/announce?idx=" + relatedIdx);
            } else if ("INTERVIEW".equals(notice.get("TYPE"))) {
                notice.put("DETAIL_URL", "/community/viewReply?idx=" + relatedIdx);
            } else if ("REPLY".equals(notice.get("TYPE"))) {
                notice.put("DETAIL_URL", "/document/view?idx=" + relatedIdx);
            } else {
                notice.put("DETAIL_URL", null); // TYPE에 따른 URL 없을 경우
            }
            return notice;
        }).collect(Collectors.toList());
    }
    */
    
    /*
    // 알림 목록 가져오기
    public List<Map<String, Object>> getNoticesWithDynamicIdx(int userIdx) {
        return noticeDao.getNoticesWithDynamicIdx(userIdx);
    }

    // 알림 읽음 처리
    public void markAsRead(int noticeIdx) {
        int rowsUpdated = noticeDao.markAsRead(noticeIdx);
        if (rowsUpdated == 0) {
            throw new RuntimeException("알림 읽음 상태 업데이트 실패");
        }
    }

    // 알림 상세 정보 가져오기
    public Map<String, Object> getNoticeDetail(int noticeIdx) {
        return noticeDao.getNoticeDetail(noticeIdx);
    }

    */
    

}
