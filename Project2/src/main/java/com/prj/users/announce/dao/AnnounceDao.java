package com.prj.users.announce.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.prj.users.announce.service.Announce;

@Repository
public class AnnounceDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void save(Announce announce) {
        String sql = "INSERT INTO ANNOUNCEMENT (announcement_idx, company_idx, user_idx, scadule, location, information, writedate)";
        	   sql += "VALUES (ANNOUNCEMENT_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, announce.getCompanyIdx(), announce.getUserIdx(), announce.getScadule(), announce.getLocation(), announce.getInformation(), announce.getWritedate());
    }
}
