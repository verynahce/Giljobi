package com.prj.users.notice.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Integer> {
    List<Notice> findByUseridx(Integer useridx); // 특정 유저의 알림 목록 조회
}