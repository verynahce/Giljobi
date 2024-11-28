package com.prj.users.notification.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.prj.users.notification.service.Announce;
import com.prj.users.notification.service.Notice;
import com.prj.users.notification.service.NoticeService;

@Repository
public class NoticeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    /*
    @Autowired
    private NoticeService noticeService;
    */


    //중요===================================================================================
    // NOTICE 테이블에서 ANNOUNCEMENT_IDX 가져오기
    public Integer getAnnouncementIdx(Integer noticeIdx) {
    	String sql = "SELECT ANNOUNCEMENT_IDX FROM NOTICE WHERE NOTICE_IDX = ?";
    	return jdbcTemplate.queryForObject(sql, new Object[]{noticeIdx}, Integer.class);
    }
    
    // ANNOUNCEMENT 테이블에서 상세 데이터 조회
    public Announce getAnnouncementDetails(Integer announcementIdx) {
    	String sql = "SELECT ANNOUNCEMENT_IDX, COMPANY_IDX, USER_IDX, TO_CHAR(SCADULE, 'YYYY-MM-DD HH24:MI') AS SCADULE, LOCATION, INFORMATION, WRITEDATE FROM ANNOUNCEMENT WHERE ANNOUNCEMENT_IDX = ?";
    	return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
    		Announce announce = new Announce();
    		announce.setAnnouncementIdx(rs.getInt("ANNOUNCEMENT_IDX"));
    		announce.setCompanyIdx(rs.getInt("COMPANY_IDX"));
    		announce.setUserIdx(rs.getInt("USER_IDX"));
    		announce.setScadule(rs.getString("SCADULE"));
    		announce.setLocation(rs.getString("LOCATION"));
    		announce.setInformation(rs.getString("INFORMATION"));
    		announce.setWritedate(rs.getString("WRITEDATE"));
    		return announce;
    	}, announcementIdx);
    }
    //중요===================================================================================
    
    public List<Notice> findNoticesByUserAndType(int userIdx, String type) {
        String sql = "SELECT * FROM NOTICE WHERE USER_IDX = ?";
        if (type != null && !type.isEmpty() && !"all".equals(type)) {
            sql += " AND TYPE = ? ORDER BY RECIEVEDDATE DESC";
            return jdbcTemplate.query(sql, new Object[]{userIdx, type}, new BeanPropertyRowMapper<>(Notice.class));
        } else {
        	sql += " ORDER BY RECIEVEDDATE DESC";
            return jdbcTemplate.query(sql, new Object[]{userIdx}, new BeanPropertyRowMapper<>(Notice.class));
        }
    }
    
    /*
    public Notice findNoticeById(int noticeIdx) {
        String sql = "SELECT * FROM NOTICE WHERE NOTICE_IDX = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{noticeIdx}, new BeanPropertyRowMapper<>(Notice.class));
    }
     */
    
    public boolean updateNoticeState(int noticeIdx, int state) {
    	String sql = "UPDATE NOTICE SET STATE = ? WHERE NOTICE_IDX = ?";
    	return jdbcTemplate.update(sql, state, noticeIdx) > 0;
    }
    
    
    public List<Integer> findNoticeIdxByUser(int user_idx) {
    	String sql = "SELECT NOTICE_IDX FROM NOTICE WHERE USER_IDX = ?";
    	return jdbcTemplate.queryForList(sql, new Object[]{user_idx}, Integer.class);
    }

    public void save(Notice notice) {
        String sql = "INSERT INTO NOTICE (NOTICE_IDX, USER_IDX, COMPANY_IDX, ANNOUNCEMENT_IDX, NOTIFICATION, SUBNOTI, TYPE) VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, notice.getUserIdx(), notice.getCompanyIdx(), notice.getAnnouncementIdx(),notice.getNotification(),
                notice.getSubnoti(), notice.getType());

    }

    //알림 삭제
    public void deleteNotice(Integer noticeIdx) {
    	String sql = "DELETE FROM NOTICE WHERE NOTICE_IDX = ?";
    	jdbcTemplate.update(sql, noticeIdx);
    }
    
    /*
    // 알림 저장 메서드, 댓글 작성시 알림 저장
    public void saveNotice(Notice notice) {
        String sql = "INSERT INTO NOTICE (NOTICE_IDX, POST_IDX, RESUME_IDX, ANNOUNCEMENT_IDX, USER_IDX, SENDER_IDX, COMPANY_IDX, COMMUNITY_IDX, REPLY_IDX, TYPE, NOTIFICATION, SUBNOTI, STATE, RECIEVEDDATE)"
                   + " VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, 'document', ?, ?, 0, SYSDATE)";
        jdbcTemplate.update(sql,
            notice.getPostIdx(),
            notice.getResumeIdx(),
            notice.getAnnouncementIdx(),
            notice.getUserIdx(),
            notice.getSenderIdx(),
            notice.getCompanyIdx(),
            notice.getCommunityIdx(),
            notice.getReplyIdx(),
            notice.getType(),
            notice.getNotification(),
            notice.getSubnoti()
        );
    }
    */
    

    /*
    public List<Announce> getNotifications(Integer userIdx) {
        String sql = "SELECT * FROM ANNOUNCEMENT WHERE user_idx = ? ORDER BY writedate DESC";
        return jdbcTemplate.query(sql, new Object[]{userIdx}, (rs, rowNum) -> {
            return new Announce(
                rs.getInt("notification_idx"),
                rs.getInt("company_idx"),
                rs.getInt("user_idx"),
                rs.getString("scadule"),
                rs.getString("location"),
                rs.getString("information"),
                rs.getString("writedate")
            );
        });
    }
    



    
    //개인회원 알림목록
    public List<Notice> getNotificationsByUserIdx(Integer userIdx) {
        String sql = "SELECT * FROM NOTICE WHERE USER_IDX = ? ORDER BY RECIEVEDDATE DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Notice.class), userIdx);
    }
    
    public List<Notice> getNotificationsByType(Integer userIdx) {
        String sql = "SELECT * FROM NOTICE WHERE USER_IDX = ? ORDER BY RECIEVEDDATE DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Notice.class), userIdx);
    }
    

    //알림 읽음 여부
    public void markAsRead(Integer noticeIdx) {
        String sql = "UPDATE NOTICE SET STATE = 1 WHERE NOTICE_IDX = ?";
        jdbcTemplate.update(sql, noticeIdx);
    }
    
    
    

	
	public void saveNotice(Notice notice) {
	    // 알림 유형(type)이 전달되지 않았을 경우 기본값 설정
	    if (notice.getType() == null || notice.getType().isEmpty()) {
	        throw new IllegalArgumentException("알림 유형(TYPE)이 정의되지 않았습니다.");
	    }

	    // SQL 저장 로직
	    String sql = "INSERT INTO NOTICE (NOTICE_IDX, POST_IDX, RESUME_IDX, ANNOUNCEMENT_IDX, USER_IDX, SENDER_IDX, COMPANY_IDX, COMMUNITY_IDX, REPLY_IDX, RECIEVEDDATE, TYPE, STATE, NOTIFICATION, SUBNOTI) " +
	                 "VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, 0, ?, ?)";

	    jdbcTemplate.update(sql,
	        notice.getPostIdx(),
	        notice.getResumeIdx(),
	        notice.getAnnouncementIdx(),
	        notice.getUserIdx(),
	        notice.getSenderIdx(),
	        notice.getCompanyIdx(),
	        notice.getCommunityIdx(),
	        notice.getReplyIdx(),
	        notice.getType(),
	        generateNotificationTitle(notice.getType()),
	        generateSubNotification(notice.getType())
	    );
	}

	
	private String generateNotificationTitle(String type) {
    	switch (type) {
    	case "document":
    		return "서류 합격 알림";
    	case "interview":
    		return "면접 합격 알림";
    	case "reply":
    		return "댓글 알림";
    	default:
    		return "새로운 알림";
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
    	default:
    		return "클릭해서 자세한 내용을 확인해주세요.";
    	}
    }
    
    /*
    public List<Map<String, Object>> getUserNoticesWithDynamicIdx(int userIdx) {
        String sql = "SELECT NOTICE_IDX, TYPE, NOTIFICATION, SUBNOTI, RECIEVEDDATE, STATE, " +
                       "       CASE " +
                       "           WHEN TYPE = 'DOCUMENT' THEN ANNOUNCEMENT_IDX " +
                       "           WHEN TYPE = 'INTERVIEW' THEN ANNOUNCEMENT_IDX " +
                       "           WHEN TYPE = 'REPLY' THEN REPLY_IDX " +
                       "           WHEN TYPE = 'SYSTEM' THEN NULL " +
                       "           ELSE NULL " +
                       "       END AS RELATED_IDX " +
                       "FROM NOTICE " +
                       "WHERE USER_IDX = ? " +
                       "ORDER BY RECIEVEDDATE DESC";

        return jdbcTemplate.queryForList(sql, userIdx);
    }
    */
    
    /*
    // 알림 목록 가져오기
    public List<Map<String, Object>> getNoticesWithDynamicIdx(int userIdx) {
        String sql = "SELECT NOTICE_IDX, TYPE, NOTIFICATION, SUBNOTI, RECIEVEDDATE, STATE, " +
                     "       CASE " +
                     "           WHEN TYPE = 'DOCUMENT' THEN ANNOUNCEMENT_IDX " +
                     "           WHEN TYPE = 'INTERVIEW' THEN ANNOUNCEMENT_IDX " +
                     "           WHEN TYPE = 'REPLY' THEN REPLY_IDX " +
                     "           ELSE NULL " +
                     "       END AS RELATED_IDX " +
                     "FROM NOTICE " +
                     "WHERE USER_IDX = ? " +
                     "ORDER BY RECIEVEDDATE DESC";

        return jdbcTemplate.queryForList(sql, userIdx);
    }

    // 알림 읽음 상태 업데이트
    public int markAsRead(int noticeIdx) {
        String sql = "UPDATE NOTICE SET STATE = 1 WHERE NOTICE_IDX = ?";
        return jdbcTemplate.update(sql, noticeIdx);
    }

    // 알림 상세 정보 가져오기
    public Map<String, Object> getNoticeDetail(int noticeIdx) {
        String sql = "SELECT NOTICE_IDX, TYPE, NOTIFICATION, SUBNOTI, RECIEVEDDATE, STATE, " +
                     "       CASE " +
                     "           WHEN TYPE = 'DOCUMENT' THEN ANNOUNCEMENT_IDX " +
                     "           WHEN TYPE = 'INTERVIEW' THEN ANNOUNCEMENT_IDX " +
                     "           WHEN TYPE = 'REPLY' THEN REPLY_IDX " +
                     "           ELSE NULL " +
                     "       END AS RELATED_IDX " +
                     "FROM NOTICE " +
                     "WHERE NOTICE_IDX = ?";

        return jdbcTemplate.queryForMap(sql, noticeIdx);
    }
    
    */

    

}
