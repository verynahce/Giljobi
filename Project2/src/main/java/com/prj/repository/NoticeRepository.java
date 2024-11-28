package com.prj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prj.entity.Notice;



public interface NoticeRepository extends JpaRepository<Notice, Long> {
	 

	 List<Notice> findByCommunityReplyReplyIdx(Long replyIdx);

}
