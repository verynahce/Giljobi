package com.prj.users.notification.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.prj.users.notification.service.Announce;

@Repository
public class AnnounceDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void save(Announce announce) {
        // 시퀀스에서 다음 값을 가져오는 쿼리
        String sequenceSql = "SELECT ANNOUNCEMENT_SEQ.NEXTVAL FROM DUAL";
        Integer announcementIdx = jdbcTemplate.queryForObject(sequenceSql, Integer.class);

        String sql = "INSERT INTO ANNOUNCEMENT (announcement_idx, company_idx, user_idx, scadule, location, information, writedate) "
                + "VALUES (?, ?, ?, ?, ?, ?, SYSDATE)";

        jdbcTemplate.update(sql, announcementIdx, announce.getCompanyIdx(), announce.getUserIdx(), 
                            announce.getScadule(), announce.getLocation(), announce.getInformation());

        // announcement_idx를 Announce 객체에 설정
        announce.setAnnouncementIdx(announcementIdx);
    }

}
