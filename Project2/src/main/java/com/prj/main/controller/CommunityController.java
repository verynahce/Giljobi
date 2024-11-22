package com.prj.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.prj.main.mapper.MainMapper;
import com.prj.main.mapper.PagingMapper;

@Controller
@RequestMapping("Main/Community")
public class CommunityController {
	
	@Autowired
	private MainMapper mainMapper;
	
	@Autowired
	private PagingMapper pagingMapper; 
	
	
	
	/*커뮤니티 관련*/
	@RequestMapping("/List")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	

}
