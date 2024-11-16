package com.prj.companys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.companys.vo.ComApplyVo;
import com.prj.companys.vo.ComBookmarkVo;
import com.prj.companys.vo.CompanyVo;
import com.prj.companys.vo.RConutVo;
import com.prj.main.vo.PostVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.users.mapper.UserMapper;
import com.prj.users.vo.ResumeVo;

@Controller
@SessionAttributes("login")
@RequestMapping("/Company/Mypage")
public class MypageBookMarkController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/Bookmark/List")
	public ModelAndView bookmarkList(CompanyVo companyVo) {
	
    List <ComBookmarkVo> BookList = companyMapper.getBookList(companyVo);	
    
		
	ModelAndView mv = new ModelAndView();	
	mv.addObject("BookList", BookList);
	mv.addObject("company_idx", companyVo.getCompany_idx());
	mv.setViewName("/company/mypage/bookmark/list");
		return mv;
	}
	
	@RequestMapping("/Bookmark/View")
	public ModelAndView bookmarkView(PostVo pvo,@RequestParam("resume_idx") int resume_idx) {	
	//이력서 정보
	ResumeListVo vo  =userMapper.getResumeLong(resume_idx);	
	
	//공고 정보	
	List<PostVo> povo = companyMapper.getPostList(pvo);
	
	ModelAndView mv = new ModelAndView();	
	mv.addObject("resumeVo",vo);
	mv.addObject("postVo",povo);
	mv.addObject("company_idx",pvo.getCompany_idx());
	mv.setViewName("/company/mypage/bookmark/view");
		return mv;
	}
	
	@RequestMapping("/Bookrmark/Support")
	public ModelAndView bookmarkSupport(@RequestParam("resume_idx") int resume_idx, PostVo pvo) {
	
		//company_idx , user_idx 변수 생성
		ResumeVo uvo = userMapper.getResume(resume_idx);
		PostVo povo = companyMapper.getPost(pvo);
		
		//insert
		companyMapper.insertBook(uvo.getUser_idx(),pvo.getPost_idx());	
		
	ModelAndView mv = new ModelAndView();
	mv.setViewName("redirect:/Company/Mypage/Bookmark/View?resume_idx="+resume_idx+"&company_idx="+ povo.getCompany_idx());
	return mv;	
	}
	@RequestMapping("/Bookmark/Delete")
	public ModelAndView bookMarkdelete(@RequestParam("cb_idx") int cb_idx,
			                           @RequestParam("company_idx") int company_idx) {
		
	companyMapper.deleteBook(cb_idx);
		
	ModelAndView mv = new ModelAndView();
	mv.setViewName("redirect:/Company/Mypage/Bookmark/List?company_idx="+ company_idx);
	return mv;		
		
	}
	

	@RequestMapping("/ApplyList/PostList")
	public ModelAndView applyLispostList(@RequestParam("company_idx") int company_idx) {
	
	List <RConutVo> postList = companyMapper.getRCount(company_idx);
		
	ModelAndView mv = new ModelAndView();
	mv.addObject("postList",postList);
	mv.addObject("company_idx",company_idx);
	mv.setViewName("/company/mypage/applyList/postList");
	return mv;		
		
	}
	
	@RequestMapping("/ApplyList/ApplyList")
	public ModelAndView applyListapplyList(@RequestParam("company_idx") int company_idx,
			                               @RequestParam("post_idx") int post_idx) {
	
   List<ComApplyVo> applyList = companyMapper.getapplyList(post_idx);
		
	ModelAndView mv = new ModelAndView();
	mv.addObject("company_idx",company_idx);
	mv.addObject("post_idx",post_idx);
	mv.addObject("applyList",applyList);
	mv.setViewName("/company/mypage/applyList/applyList");
	return mv;		
		
	}
	
	@RequestMapping(value="/ApplyList/State")
	@ResponseBody
	public String applyListstate(@RequestParam("appli_idx") int appli_idx,
			                     @RequestParam("appli_status") String appli_status ) {
		
		companyMapper.updateApply(appli_idx,appli_status);
		
	
		return "";
	}
	
	@RequestMapping("/ApplyList/View")
	public ModelAndView applyListView(@RequestParam("resume_idx") int resume_idx,
			                          @RequestParam("company_idx") int company_idx,
			                          @RequestParam("post_idx") int post_idx ) {
		
		ResumeListVo vo  =userMapper.getResumeLong(resume_idx);	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/company/mypage/applyList/view");
		mv.addObject("resumeVo",vo);
		mv.addObject("company_idx",company_idx);
		mv.addObject("post_idx",post_idx);
		return mv;
	}
	
	@RequestMapping("/ApplyList/Delete")
	public ModelAndView applyListdelete(@RequestParam("appli_idx") int appli_idx,
							            @RequestParam("company_idx") int company_idx,
							            @RequestParam("post_idx") int post_idx) {
		
		companyMapper.deleteApply(appli_idx);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/Company/Mypage/ApplyList/ApplyList?company_idx= "+company_idx +"&post_idx="+post_idx);
		return mv;
	}

}
