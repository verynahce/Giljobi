package com.prj.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.PostClickVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostClickService {
	@Autowired
	private MainMapper mainMapper;
	
	public void insertPostClick(int user_idx, int post_idx) {
		
		PostClickVo pvo = mainMapper.getPostclick(user_idx,post_idx);		
		if(pvo == null) {
			mainMapper.insertPostClick(user_idx,post_idx);
		}			
	}

}
