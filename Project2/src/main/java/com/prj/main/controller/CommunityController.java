package com.prj.main.controller;


import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.prj.entity.Community;
import com.prj.entity.CommunityReply;
import com.prj.entity.Duty;
import com.prj.entity.Users;
import com.prj.main.mapper.MainMapper;
import com.prj.main.mapper.PagingMapper;
import com.prj.service.CommunityService;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("Main/Community")
public class CommunityController {
 	@Autowired
	private MainMapper mainMapper;	
	@Autowired
	private PagingMapper pagingMapper; 
	@Autowired
	private CommunityService  communityService;
	
	@RequestMapping("/List")
	public ModelAndView list( @RequestParam(name = "page",defaultValue = "0") int page,
                              @RequestParam(name = "size",defaultValue = "5") int size,
                              @RequestParam(name = "newhit",defaultValue = "0") int newhit) {

		//duty 정보
		List <Duty> dutyList = communityService.getDutyList();
		Page<Community> CommunityList = null;
		if(newhit == 0){
		
		//리스트 필터	
		//List<Community> CommunityList = communityService.getCommunityList();		
	    CommunityList = communityService.getPageCommunityList(page,size);					
		}else if(newhit == 1) {			
		CommunityList = communityService.getPageListdata(page,size);				      	
		}else {
		CommunityList = communityService.getPageListHit(page,size);					
		}
		
		ModelAndView mv =new ModelAndView();
		mv.addObject("List",  CommunityList.getContent());
		mv.addObject("dutyList",dutyList);
		
		//페이징 정보
		mv.addObject("totalPages", CommunityList.getTotalPages());
		mv.addObject("totalElements", CommunityList.getTotalElements());
		mv.addObject("currentPage", CommunityList.getNumber());
		mv.addObject("size", CommunityList.getSize());
		mv.addObject("newhit", newhit);
		mv.setViewName("/main/community/list");
		return mv;
	}
	
	@RequestMapping("/View")
	public ModelAndView view( HttpServletRequest request,Community community ) {
		

	    Community Community = communityService.getCommunity(community.getCommunityIdx());		
      
		//duty 정보
		List <Duty> dutyList = communityService.getDutyList();		
	   
		//답글
		List<CommunityReply>communityReply= communityService.getRepliesByCommunityIdx(community.getCommunityIdx());
		System.out.println(communityReply);
		
		//답글 수
		Long replyCount = communityService.getReplyCountForCommunity(community.getCommunityIdx());
		//로그인 점검
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Object userObject = session.getAttribute("login");
		
		if (userObject instanceof UserVo) {
			UserVo userVo = (UserVo) session.getAttribute("login");
             if(userVo != null ) {	
            	 
            	//조회수 업데이트
            	 communityService.updateHit(community.getCommunityIdx());          	            	 
            	 
            	mv.addObject("userIdx",userVo.getUser_idx());
         		mv.addObject("ct", Community);
        		mv.addObject("dutyList",dutyList);
        		mv.addObject("replyList",communityReply);
        		mv.addObject("replyCount",replyCount);
        		mv.setViewName("/main/community/view");
			}						
	   }else {
		   mv.setViewName("/user/loginForm");   
		   
	   }
	
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView WriteForm(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Object userObject = session.getAttribute("login");
		
		//duty 정보
		List <Duty> dutyList = communityService.getDutyList();
		
		if (userObject instanceof UserVo) {
			UserVo userVo = (UserVo) session.getAttribute("login");
             if(userVo != null ) {	
            	 mv.addObject("userIdx",userVo.getUser_idx());
            	 mv.addObject("dutyList",dutyList);
            	 mv.setViewName("/main/community/write");
            	 
			}						
	   }else {
		   mv.setViewName("/user/loginForm");   
		   
	   }
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView Write(Community community , @RequestParam("userIdx") Long userIdx,
			                                      @RequestParam("dutyId") Long dutyId) {		
         Users user = communityService.getUser(userIdx);
         Duty duty = 	communityService.getDuty(dutyId);
         
         LocalDateTime localDateTime = LocalDateTime.now();
         Date cdate = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
         
         community.setUsers(user);
         community.setDuty(duty);        
         community.setComHit(0); // 기본값을 명시적으로 설정
         community.setComLike(0);
         community.setComRegdate(cdate);
		communityService.insertCoummunity(community);
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("redirect:/Main/Community/List");
		return mv;
	}

	
}
