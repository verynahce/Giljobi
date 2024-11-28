package com.prj.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.prj.main.mapper.MainMapper;
import com.prj.users.notification.service.Notice;
import com.prj.users.vo.NoticeVo;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@ControllerAdvice
public class AlertController {

  @Autowired
  private MainMapper mainMapper;

    @ModelAttribute("unreadNotices")
    public List<NoticeVo> addUnreadNoticesToModel(HttpServletRequest 	request, 
			 HttpServletResponse 	response ) {

		
        List<NoticeVo> noticeAlret = null;  	
    	HttpSession session = request.getSession();
    	Object userObject = session.getAttribute("login");
        if (userObject instanceof UserVo) {
        	UserVo userVo = (UserVo) session.getAttribute("login");       
          	noticeAlret = 	mainMapper.getNoticeUser(userVo.getUser_idx());               	        	
        }else {
        	        	
        }
        return noticeAlret != null ? noticeAlret : Collections.emptyList();
        
    }
}