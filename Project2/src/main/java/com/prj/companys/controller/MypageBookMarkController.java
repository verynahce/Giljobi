package com.prj.companys.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.companys.vo.ComApplyVo;
import com.prj.companys.vo.ComBookmarkVo;
import com.prj.companys.vo.CompanyVo;
import com.prj.companys.vo.EvaluateVo;
import com.prj.companys.vo.PostSkillVo;
import com.prj.companys.vo.RConutVo;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;
import com.prj.main.vo.PostVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.service.PdsService;
import com.prj.users.mapper.UserMapper;
import com.prj.users.notification.service.Notice;
import com.prj.users.vo.ResumeSkillVo;
import com.prj.users.vo.ResumeVo;

@Controller
@SessionAttributes("login")
@RequestMapping("/Company/Mypage")
public class MypageBookMarkController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PdsService pdsService;

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
	//스킬 정보
	List <ResumeSkillVo> SkillList = userMapper.getResumeSkillList(resume_idx);
	//파일 정보
	List<PortfolioVo> pfvoList = pdsService.getPortfolio(resume_idx);
	//이미지 정보
	ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
	String imagePath = "";
	if(ifvo==null) {
		 imagePath = "0";
	}else {
		imagePath = ifvo.getImage_path().replace("\\", "/");
	}
	
	
	
	ModelAndView mv = new ModelAndView();	
	mv.addObject("resumeVo",vo);
	mv.addObject("postVo",povo);
	mv.addObject("company_idx",pvo.getCompany_idx());
	mv.addObject("imagePath",imagePath);
	mv.addObject("pfvoList",pfvoList);
	mv.addObject("SkillList",SkillList);
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


	
    List<ComApplyVo> applyList = companyMapper.getapplyListSkill(post_idx);
	
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
			                          @RequestParam("post_idx") int post_idx
			                          ) {
		
		List<ComApplyVo> applyList = companyMapper.getapplyList(post_idx);
		ResumeListVo vo  =userMapper.getResumeLong(resume_idx);	
		List<ComApplyVo> appli_idx = companyMapper.getAppliIdx(resume_idx);
	    List<Integer> appliIdxList = appli_idx.stream()
	    	    .map(ComApplyVo::getAppli_idx)
	    	    .collect(Collectors.toList());

	    List<EvaluateVo> evaluateIdx = companyMapper.getEvaluateIdx(appliIdxList);

	    System.out.println("지원 idx 리스트: " + appliIdxList);
	    System.out.println("평가 idx 리스트: " + evaluateIdx);

		//파일 정보
		List<PortfolioVo> pfvoList = pdsService.getPortfolio(resume_idx);
		//이미지 정보
		ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
		String imagePath = "";
		if(ifvo==null) {
			 imagePath = "0";
		}else {
			imagePath = ifvo.getImage_path().replace("\\", "/");
		}
		
		//스킬 정보
		List <ResumeSkillVo> SkillList = userMapper.getResumeSkillList(resume_idx);
		
		//메시지 보내기
		Notice notice = new Notice();
		notice.setResumeIdx(resume_idx);
		notice.setPostIdx(post_idx);
		notice.setCompanyIdx(company_idx);
		notice.setUserIdx(vo.getUser_idx());		
		notice.setType("resume");
		// 중복 메시지 막기
		Notice configNotice = userMapper.getNoticeClick(notice);		
		if (configNotice == null) {
		userMapper.insertNoticeClick(notice); 
		}else {
			
		}
		
		
		ModelAndView mv = new ModelAndView();
			
		if (evaluateIdx != null && !evaluateIdx.isEmpty()) {
		    EvaluateVo evaluate = companyMapper.getEvaluate(evaluateIdx);
		    mv.addObject("evaluate", evaluate);
		} else {
		    System.out.println("평가 idx 리스트가 비어 있습니다.");
		}

		mv.addObject("applyList",applyList);
		mv.addObject("appli_idx",appli_idx);
		mv.addObject("resumeVo",vo);
		mv.addObject("company_idx",company_idx);
		mv.addObject("post_idx",post_idx);
		mv.addObject("imagePath",imagePath);
		mv.addObject("pfvoList",pfvoList);
		mv.addObject("SkillList",SkillList);
		mv.setViewName("/company/mypage/applyList/view");
		return mv;
	}


	@RequestMapping(value = "/ApplyList/Evaluate")
	@ResponseBody
	public ModelAndView register(@RequestParam("appli_idx") List<Integer> appli_idx,
								 @RequestParam("company_idx") int company_idx, 
	                             @RequestParam("post_idx") int post_idx,
	                             EvaluateVo evaluateVo) {

		System.out.println("응애"+evaluateVo);
	    ModelAndView mv = new ModelAndView();

	    

	    if (evaluateVo.getEvaluate_idx() == null) {
	        companyMapper.insertEvaluate(evaluateVo);
	    } else {
	        companyMapper.updateEvaluate(evaluateVo);
	    }

	    System.out.println("응애"+evaluateVo);
	    mv.setViewName("redirect:/Company/Mypage/ApplyList/ApplyList?company_idx= "+company_idx +"&post_idx="+post_idx);
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
	

	@RequestMapping(value="/ApplyList/Remove")
	@ResponseBody
	public void Remove(@RequestParam("appli_idx") int appli_idx) {
		
		companyMapper.updateRemove(appli_idx);	
	
		
	}
	

}
