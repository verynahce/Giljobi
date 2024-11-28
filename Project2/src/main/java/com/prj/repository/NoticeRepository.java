package com.prj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.prj.dto.CommunityDTO;
import com.prj.entity.Duty;
import com.prj.entity.Notice;
import com.prj.entity.Users;



public interface NoticeRepository extends JpaRepository<Notice, Long> {
	 

	 List<Notice> findByCommunityReplyReplyIdx(Long replyIdx);

}
