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
        String sql = "INSERT INTO ANNOUNCEMENT (announcement_idx, company_idx, user_idx, scadule, location, information, writedate)";
        	   sql += "VALUES (ANNOUNCEMENT_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
        jdbcTemplate.update(sql, announce.getCompanyIdx(), announce.getUserIdx(), announce.getScadule(), announce.getLocation(), announce.getInformation());
    }
}
