package com.prj.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.prj.entity.Community;
import com.prj.entity.Users;
import com.prj.service.CommunityService;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Main/Community")
public class CommunityController {
	
	@Autowired
	private CommunityService  communityService;
	
	@RequestMapping("/List")
	public ModelAndView list() {

		
		List<Community> CommunityList = communityService.getCommunityList();		

		
		ModelAndView mv =new ModelAndView();
		mv.addObject("List", CommunityList);
		mv.setViewName("/main/community/list");
		return mv;
	}
	
	@RequestMapping("/View")
	public ModelAndView view( Community community ) {

		
		
	  Community Community = communityService.getCommunity(community.getCommunityIdx());		

		
		ModelAndView mv =new ModelAndView();
		mv.addObject("ct", Community);
		mv.setViewName("/main/community/view");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView WriteForm(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Object userObject = session.getAttribute("login");
		
		if (userObject instanceof UserVo) {
			UserVo userVo = (UserVo) session.getAttribute("login");
             if(userVo != null ) {	
            	 mv.addObject("userIdx",userVo.getUser_idx());
            	 mv.setViewName("/main/community/write");
			}						
	   }else {
		  
		   
		   mv.setViewName("/user/loginForm");   
		   
	   }
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView Write(Community community , @RequestParam("userIdx") Long userIdx ,
			                                      @RequestParam("dutyId") Long dutyId) {
		
         Users user = communityService.getUser(userIdx);
        		
		System.out.println("dd 오츄랒는:" + community.getDuty());
		communityService.insertCoummunity(community);
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/main/community/list");
		return mv;
	}

}
