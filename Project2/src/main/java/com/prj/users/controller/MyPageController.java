package com.prj.users.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.vo.CompanyVo;
import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.CityVo;
import com.prj.main.vo.ClarificationVo;
import com.prj.main.vo.DutyVo;
import com.prj.main.vo.EmpVo;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;
import com.prj.main.vo.PostCountVo;
import com.prj.main.vo.PostListVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.main.vo.SkillVo;
import com.prj.service.ClickService;
import com.prj.service.PdsService;
import com.prj.users.mapper.UserMapper;
import com.prj.users.notification.service.Announce;
import com.prj.users.notification.service.Notice;
import com.prj.users.notification.service.NoticeService;
import com.prj.users.vo.ApplicationVo;
import com.prj.users.vo.EduVo;
import com.prj.users.vo.ResumeCareerVo;
import com.prj.users.vo.ResumeSkillVo;
import com.prj.users.vo.ResumeVo;
import com.prj.users.vo.ScoreVo;
import com.prj.users.vo.UserApplicationListVo;
import com.prj.users.vo.UserBookmarkVo;
import com.prj.users.vo.UserScoutVo;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/User/MyPage")
public class MyPageController {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
    private MainMapper mainMapper;
	@Autowired
	private PdsService pdsService;
	@Autowired
	private ClickService clickService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/Home/View")
	public ModelAndView homeview(HttpServletRequest request, HttpServletResponse responese) {		
		
		//변수 받기
		HttpSession session = request.getSession();
		UserVo slogin = (UserVo) session.getAttribute("login");
		
		//Update 시 변동 값을 가져 오기 위해서 다시 변수 받기
		UserVo login = userMapper.getUser(slogin);	 
				
		//나이 계산		
		String UYearStr =login.getUser_birthdate().substring(0, 4);
		int UYear = Integer.parseInt(UYearStr);
		int CYear = LocalDate.now().getYear();
		int age = CYear - UYear;
		
		
		//수 세기
		int  User_idx =login.getUser_idx();	    
		int  CountR= userMapper.countR(User_idx);
		int  CountB= userMapper.countB(User_idx);
		int  CountA= userMapper.countA(User_idx);
		int  CountS= userMapper.countS(User_idx);
	    		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userVo",login);		
		mv.addObject("CountR",CountR);	
		mv.addObject("CountB",CountB);	
		mv.addObject("CountA",CountA);	
		mv.addObject("CountS",CountS);	
		mv.addObject("UYear",UYear);	
		mv.addObject("age",age);	
		mv.setViewName("user/mypage/home/view");
		return mv;
	}
	
	@RequestMapping("/Home/updateForm")
	 public ModelAndView homeupdateForm(UserVo uservo) {	
		
		UserVo vo = userMapper.getUser(uservo);
		
		
		//나이 계산		
		String UYearStr =vo.getUser_birthdate().substring(0, 4);
		int UYear = Integer.parseInt(UYearStr);
		int CYear = LocalDate.now().getYear();
		int age = CYear - UYear;
		
		
        ModelAndView mv = new ModelAndView();		
		mv.setViewName("user/mypage/home/update");
		mv.addObject("userVo",vo);
		mv.addObject("UYear",UYear);	
		mv.addObject("age",age);
		return mv;
		
	}
	@RequestMapping("/Home/update")
	public ModelAndView homeupdate(UserVo uservo) {
	
		userMapper.updateUser(uservo);

		
    ModelAndView mv = new ModelAndView();		
	 mv.setViewName("redirect:/User/MyPage/Home/View");
    return mv;
	}
	
	@RequestMapping("/ApplyList/List")
	public ModelAndView appplylist(UserVo uservo) {
	
     List <UserApplicationListVo> applyList =userMapper.getApplycation(uservo.getUser_idx());

     
     
	ModelAndView mv = new ModelAndView();	
	mv.addObject("applyList",applyList);	
	mv.addObject("user_idx",uservo.getUser_idx());	
	mv.setViewName("user/mypage/applyList/list");
	return mv;
	
	}
	@RequestMapping("/ApplyList/Delete")
	public ModelAndView appplydelete(ApplicationVo vo) {
	    
		//user_idx 구하기
		ApplicationVo avo = userMapper.getApply(vo.getAppli_idx());
		ResumeVo rvo = userMapper.getResume(avo.getResume_idx());
		
		//제거 
		userMapper.deleteApply(vo.getAppli_idx());   		
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("redirect:/User/MyPage/ApplyList/List?user_idx="+rvo.getUser_idx());
		
		return mv;
	
	}
	
	@RequestMapping("/ApplyList/View")
	public ModelAndView applylistview(@RequestParam("post_idx") int post_idx,
                                      @RequestParam("user_idx") int user_idx) {
		//view 내릴 정보
		PostListVo vo = userMapper.getPost(post_idx);
		CompanyVo cvo= userMapper.getCompany(post_idx);
		ScoreVo score = userMapper.getReviewScore(post_idx);
		
	    //공고수 , 인사담당자톡
		PostCountVo pcvo = mainMapper.getPostCount(String.valueOf(post_idx));
		ClarificationVo cfvo = mainMapper.getClarification(post_idx);
		//이미지 정보
		ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
		String imagePath = "";
		if(ifvo==null) {
			 imagePath = "0";
		}else {
			imagePath = ifvo.getImage_path().replace("\\", "/");
		}				
		
		//이력서 도출
		List<ResumeVo> SRList = userMapper.getSRList(user_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/mypage/applyList/view");
		mv.addObject("postVo",vo);	
		mv.addObject("companyVo",cvo);	
		mv.addObject("resumeList",SRList);	
		mv.addObject("user_idx",user_idx);	
		mv.addObject("pcount",pcvo);
		mv.addObject("cfvo",cfvo);
		mv.addObject("imagePath",imagePath);
		mv.addObject("score",score.getScore());	
			return mv;
}
	
	@RequestMapping("/BookMark/List")
	public ModelAndView bookmarklist(UserVo uservo) {
		
		//관심기업
		List<UserBookmarkVo> BookmarkList = userMapper.getBookList(uservo); 
		
		//받은 제안
		List<UserScoutVo> ScoutList = userMapper.getScoutList(uservo.getUser_idx());
		
		//이력서 리스트
		List<ResumeVo> SRList = userMapper.getSRList(uservo.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("BookmarkList",BookmarkList);	
		mv.addObject("ScoutList",ScoutList);	
		mv.addObject("resumeList",SRList);	
		mv.addObject("user_idx",uservo.getUser_idx());	
		mv.setViewName("user/mypage/bookmark/list");
		return mv;
	}
	
	@RequestMapping("/BookMark/View")
	public ModelAndView bookmarkview(@RequestParam("post_idx") int post_idx,
			                         @RequestParam("user_idx") int user_idx) {
		
		//view 내릴 정보
		PostListVo vo = userMapper.getPost(post_idx);
		CompanyVo cvo= userMapper.getCompany(post_idx);
		ScoreVo score = userMapper.getReviewScore(post_idx);
		
	    //공고수 , 인사담당자톡
		PostCountVo pcvo = mainMapper.getPostCount(String.valueOf(post_idx));
		ClarificationVo cfvo = mainMapper.getClarification(post_idx);
		//이미지 정보
		ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
		String imagePath = "";
		if(ifvo==null) {
			 imagePath = "0";
		}else {
			imagePath = ifvo.getImage_path().replace("\\", "/");
		}				
		
		//이력서 도출
		List<ResumeVo> SRList = userMapper.getSRList(user_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/mypage/bookmark/view");
		mv.addObject("postVo",vo);	
		mv.addObject("companyVo",cvo);	
		mv.addObject("resumeList",SRList);	
		mv.addObject("user_idx",user_idx);	
		mv.addObject("pcount",pcvo);
		mv.addObject("cfvo",cfvo);
		mv.addObject("imagePath",imagePath);
		mv.addObject("score",score.getScore());	
		return mv;
	}
	
	
	
	@RequestMapping("/BookMark/Apply")
	public ModelAndView bmapply(ApplicationVo aVO, @RequestParam("scout_idx") int scout_idx) {		
		//insert
		userMapper.insertApply(aVO);
		//경로 변수
		int ridx =aVO.getResume_idx();
		ResumeVo rvo = userMapper.getResume(ridx);
		//받은 제안 삭제
		userMapper.deleteScope(scout_idx);		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/User/MyPage/BookMark/List?user_idx="+rvo.getUser_idx());
				
		return mv;
	}
	@RequestMapping("/BookMark/deadline")
	public ModelAndView deadline(@RequestParam("scout_idx") int scout_idx) {		
		
		UserScoutVo uvo = userMapper.getScout(scout_idx);
		//insert
		userMapper.deleteScope(scout_idx);		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/User/MyPage/BookMark/List?user_idx="+uvo.getUser_idx());
				
		return mv;
	}
	
	
	
	

	@RequestMapping(value="/BookMark/On")
	@ResponseBody
	public String on(@RequestParam("company_idx") int company_idx,@RequestParam("user_idx") int user_idx) {
		
		userMapper.insertBookmark(user_idx,company_idx);
		
		return "";	
	}
	
	@RequestMapping(value="/BookMark/Off")
	@ResponseBody
	public String off(@RequestParam("ub_idx") int ub_idx) {
		
		userMapper.deleteBookmark(ub_idx);
        
		return "";		
	}
	
	@RequestMapping("/Resume/List")
	public ModelAndView resumeList(ResumeVo resumeVo) {
	
    //정보구하기
	List <ResumeVo> resumeList =userMapper.getResumeList(resumeVo);
	
	
	ModelAndView mv = new ModelAndView();	
	mv.addObject("resumeList",resumeList);
	mv.addObject("user_idx",resumeVo.getUser_idx());
	mv.setViewName("user/mypage/resume/list");
	return mv;
	}
	
	@RequestMapping("/Resume/View")
	public ModelAndView resumeView (@RequestParam("resume_idx") int resume_idx) {
	
	//이력서 정보
	ResumeListVo vo  =userMapper.getResumeLong(resume_idx);
	
	//경로설정을 위한 user_idx 구하기
	ResumeVo rvo = userMapper.getResume(resume_idx);
	
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
	mv.addObject("user_idx",rvo.getUser_idx());
	mv.addObject("imagePath",imagePath);
	mv.addObject("pfvoList",pfvoList);
	mv.setViewName("user/mypage/resume/view");
	return mv;
	}
	
	@RequestMapping("/Resume/UpdateForm")
	public ModelAndView resumeUpdateForm (@RequestParam("resume_idx") int resume_idx) {
	
	//이력서 정보
	ResumeListVo vo  =userMapper.getResumeLong(resume_idx);
	
	//경로 설정을 위한 user_idx 구하기
	ResumeVo rvo = userMapper.getResume(resume_idx);
    
	//이미지 정보
	ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
	String imagePath = "";
	if(ifvo==null) {
		 imagePath = "0";
	}else {
		imagePath = ifvo.getImage_path().replace("\\", "/");
	}

	//파일 정보
	List<PortfolioVo> pfvoList = pdsService.getPortfolio(resume_idx);
	
	//필터 정보
	List<EduVo> edVo =userMapper.getEduList();
	List<CityVo> cVo =userMapper.getCityList();
	List<DutyVo> dVo =userMapper.getDutyList();
	List<EmpVo> epVo =userMapper.getEmpList();
	List<SkillVo> sVo =userMapper.getSkillList();
    
	ModelAndView mv = new ModelAndView();	
	
	//년도 날짜 계산 
	if(vo.getCareer_sdate() != null) {
	String sYear = vo.getCareer_sdate().substring(0, 4);
	String eYear = vo.getCareer_edate().substring(0, 4);	
	String sMonth = vo.getCareer_sdate().substring(5, 7);
	String eMonth = vo.getCareer_edate().substring(5, 7);
	
	
	mv.addObject("sYear",sYear);
	mv.addObject("eYear",eYear);
	mv.addObject("sMonth",sMonth);
	mv.addObject("eMonth",eMonth);
	
	}
	

	mv.addObject("resumeVo",vo);
	mv.addObject("user_idx",rvo.getUser_idx());
	mv.addObject("Edu",edVo);
	mv.addObject("City",cVo);
	mv.addObject("Duty",dVo);
	mv.addObject("Emp",epVo);
	mv.addObject("Skill",sVo);
	mv.addObject("imagePath",imagePath);
	mv.addObject("pfvoList",pfvoList);
	mv.addObject("ifvo",ifvo);
	
	mv.setViewName("user/mypage/resume/update");
	return mv;
	}
	
	@RequestMapping("/Resume/Update")
	public ModelAndView resumeUpdate(ResumeVo resumeVo, 
			                         @RequestParam(value="skill_name", 
			                        		       required = false) String skill_name,
			                         @RequestParam(value="career_cname",required = false) String career_cname,
			                         @RequestParam(value="career_description",required = false) String career_description,
			                         @RequestParam(value="career_sdate",required = false) String career_sdate,
			                         @RequestParam(value="career_edate",required = false) String career_edate,
			                         HashMap<String, Object> map,
	            				     @RequestParam(value="upimage",required = false) MultipartFile uploadimage,
	            				     @RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles) {

    // null값 처리 파일 ,이미지
    if (uploadfiles == null) {
    uploadfiles = new MultipartFile[0];  }	 
   
     //이미지 업데이트	
	if(uploadimage != null && !uploadimage.isEmpty()) {	
		 String type ="RESUME";
         map.put("type", type );	
		pdsService.updateimage(uploadimage,resumeVo.getImage_idx(),map,resumeVo);
	 }else {
		//이력서 정보 업데이트
	userMapper.updateResumeximage(resumeVo);		 
		 
	 }
	
	//파일 인서트 
	int resume_idx = resumeVo.getResume_idx();
    map.put("resume_idx", resume_idx );
	pdsService.serWrite(map,uploadfiles);

    //기술 정보 업데이트   	
	  //기술이 이미 INSERT 되있는지 확인-> skill_name 값이 존재할때 : 있으면 UPDATE / 없으면 INSERT 진행
	  //                              -> 값이추가 되지 않은경우(null) : 원래 값이 있다면 DELETE 진행
	ResumeSkillVo svo = userMapper.getSkill(resumeVo);	 	
	if(skill_name != null ) {
	  if(svo != null) {
	     userMapper.updateSkill(skill_name,resumeVo.getResume_idx()); 
	  }else if(svo == null) {		
	     userMapper.insertSkill2(resumeVo.getResume_idx(),skill_name);	
	    }
	}else {				
		userMapper.deleteSkill(resumeVo.getResume_idx());
		
	}
	
	//경력 정보 업데이트
	ResumeCareerVo cvo = userMapper.getCarrer(resumeVo);
	
	if(career_cname != null) {
		if(cvo != null)	{		
	    userMapper.updateCareer(career_cname,career_description,career_sdate,career_edate,resumeVo.getResume_idx());
		}else if(cvo == null) {
		userMapper.insertCareer2(resumeVo.getResume_idx(), career_cname, career_description, career_sdate, career_edate);		
		}	
	}else {		
		userMapper.deleteCarrer(resumeVo.getResume_idx());
	}
	
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("redirect:/User/MyPage/Resume/View?resume_idx="+resumeVo.getResume_idx());
		return mv;
		
	
	}
	
	@RequestMapping("/Resume/WriteForm")
	public ModelAndView resumeWirteForm(UserVo userVo) {
	
	//기본정보	
	UserVo uVo = userMapper.getUser(userVo);	
	
	//나이 계산		
	String UYearStr =uVo.getUser_birthdate().substring(0, 4);
	int UYear = Integer.parseInt(UYearStr);
	int CYear = LocalDate.now().getYear();
	int age = CYear - UYear;
		
	//필터 정보
	List<EduVo> edVo =userMapper.getEduList();
	List<CityVo> cVo =userMapper.getCityList();
	List<DutyVo> dVo =userMapper.getDutyList();
	List<EmpVo> epVo =userMapper.getEmpList();
	List<SkillVo> sVo =userMapper.getSkillList();	
		
	ModelAndView mv = new ModelAndView();	
	mv.setViewName("user/mypage/resume/write");
	mv.addObject("userVo",uVo);
	mv.addObject("age",age);
	mv.addObject("year",UYear);
	mv.addObject("Edu",edVo);
	mv.addObject("City",cVo);
	mv.addObject("Duty",dVo);
	mv.addObject("Emp",epVo);
	mv.addObject("Skill",sVo);
	return mv;
		
	}
	
	@RequestMapping("/Resume/Write")
	public ModelAndView resumeWrite(ResumeVo resumeVo, 
            						@RequestParam(value="skill_name", 
            									  required = false) String skill_name,
            						@RequestParam(value="career_cname",required = false) String career_cname,
            						@RequestParam(value="career_description",required = false) String career_description,
            						@RequestParam(value="career_sdate",required = false) String career_sdate,
            						@RequestParam(value="career_edate",required = false) String career_edate,
            						@RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles,
            						HashMap<String, Object> map,
            						@RequestParam(value="upimage",required = false) MultipartFile uploadimage) {
		
	   //uploadfiles null 오류 처리
		if (uploadfiles == null) {
	        uploadfiles = new MultipartFile[0]; 
	    }
		
		//유저 변수 
		int user_idx =resumeVo.getUser_idx();
		
		//이미지 인서트
		 String type ="RESUME";
         map.put("type", type );
		 pdsService.setimageWrite(map,uploadimage);		  		
		
		// 이력서 , 스킬, 경력 인서트
		userMapper.insertResume(resumeVo);		
		if(skill_name != null ) {
		userMapper.insertSkill(user_idx,skill_name); }
		if(career_cname != null) {
		userMapper.insertCarrer(user_idx,career_cname,career_description,career_sdate,career_edate);
		}
		
		//입력한 이력서 idx 도출하기
		ResumeVo rvo = userMapper.getResumeIdx(user_idx);
		
		//파일 인서트
		int resume_idx = rvo.getResume_idx();
        map.put("resume_idx", resume_idx );
		pdsService.serWrite(map,uploadfiles);
				
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/User/MyPage/Resume/View?resume_idx="+ rvo.getResume_idx());
		return mv;
	}
	
	@RequestMapping("/Resume/Delete")
	public ModelAndView resuemDelete(@RequestParam("resume_idx") int resume_idx) {
		
		//user_idx 도출하기
		ResumeVo rvo = userMapper.getResume(resume_idx);
	    int user_idx =rvo.getUser_idx();
	    
		//삭제
		userMapper.deleteCarrer(resume_idx);
		userMapper.deleteSkill(resume_idx);
		userMapper.deleteApplyR(resume_idx);
		userMapper.deleteBookmarkR(resume_idx);
		pdsService.deletefile(resume_idx);	
		clickService.deleteResumeClickR(resume_idx);
		//삭제 문제시 이 두개 위치 바꾸기
		userMapper.deleteResume(resume_idx);		
		pdsService.deleteImage(rvo.getImage_idx());	

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/User/MyPage/Resume/List?user_idx="+ user_idx);
		return mv;
		
	}
	

	/* 개인회원탈퇴 */
	@RequestMapping("/Home/Delete")
	public ModelAndView Delete(HttpSession session,UserVo uservo) {
		
		userMapper.deleteUser(uservo);

		ModelAndView mv = new ModelAndView();
		
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
		
	}
	
    @RequestMapping("/Notice")
    public String showNotice(Model model, @RequestParam("user_idx") int user_idx, Notice notice) {
        List<Integer> noticeIdx = noticeService.getNoticesByUser(user_idx);
        model.addAttribute("user_idx", user_idx);
        model.addAttribute("noticeIdx", noticeIdx);
        return "user/mypage/notification/notice";
    }

}
