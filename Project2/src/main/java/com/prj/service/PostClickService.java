package com.prj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.entity.PostClick;
import com.prj.repository.PostClickRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostClickService {

	@Autowired
	private  PostClickRepository  postClickRepository;

	public void insertPostClick(int user_idx, String post_idx) {
		
		
		PostClick postClickTarget =postClickRepository.findByIdPCtarget(user_idx,Long.parseLong(post_idx));
		
	    if(postClickTarget == null) {
		 PostClick postClick = new PostClick();		      
		postClickRepository.save(postClick);

	    }
	}


	
}
