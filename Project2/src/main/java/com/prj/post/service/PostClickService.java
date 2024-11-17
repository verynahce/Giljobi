package com.prj.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.entity.Post;
import com.prj.entity.PostClick;
import com.prj.entity.Users;
import com.prj.post.repository.PostClickRepository;

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
		 postClick.setPost(new Post(Long.parseLong(post_idx)));          
	     postClick.setUsers(new Users(user_idx));

		postClickRepository.save(postClick);

	    }
	}


	
}
