package com.prj.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Main/Community")
public class CommunityController {
	
	@RequestMapping("/List")
	public String list() {
		return "/main/community/list";
	}
	

}
