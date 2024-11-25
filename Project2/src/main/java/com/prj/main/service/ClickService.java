package com.prj.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.PostClickVo;
import com.prj.main.vo.ResumeClickVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ClickService {
	@Autowired
	private MainMapper mainMapper;
	
	public void insertPostClick(int user_idx, int post_idx) {
		
		PostClickVo pvo = mainMapper.getPostclick(user_idx,post_idx);		
		if(pvo == null) {
			mainMapper.insertPostClick(user_idx,post_idx);
		}			
	}
    //이력서클릭 삭제 GET
	public void deleteResumeClickR(int resume_idx) {
		List <ResumeClickVo> rvo = mainMapper.getResumeClickList(resume_idx);
		if(rvo !=  null) {
			mainMapper.deleteResumeClickR(resume_idx);
		}
	}

}