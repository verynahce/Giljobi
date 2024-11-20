package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.entity.PostClick;
import com.green.repository.PostClickRepository;

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
