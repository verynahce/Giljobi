package com.prj.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.users.notice.dto.NoticeDto;
import com.prj.users.notice.service.NoticeService;
import com.prj.users.vo.UserVo;
@Controller
@RequestMapping("User/MyPage/Notice/List")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

		@GetMapping
		public String getNoticeItems(Model model, UserVo uservo) {
		    // REST API를 호출하거나 서비스 계층에서 데이터 가져오기
		int user_idx = uservo.getUser_idx();
		List<NoticeDto> noticeItems = noticeService.getNoticeItems(user_idx);
		model.addAttribute("user_idx",uservo.getUser_idx());
		    // 데이터를 JSP로 전달
		    model.addAttribute("noticeItems", noticeItems);
		    return "user/mypage/home/notice"; // inbox.jsp 파일을 렌더링
		}
                
             
}