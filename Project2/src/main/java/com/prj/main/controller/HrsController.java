package com.prj.main.controller;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.vo.CompanyVo;
import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.CareerVo;
import com.prj.main.vo.CityVo;
import com.prj.main.vo.DutyVo;
import com.prj.main.vo.EmpVo;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;
import com.prj.main.vo.PostListVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.main.vo.SkillVo;
import com.prj.service.PdsService;
import com.prj.users.vo.ApplicationVo;
import com.prj.users.vo.UserScoutVo;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("Main")
public class HrsController {
	
	@Autowired
	private MainMapper mainMapper;
	@Autowired
	private PdsService pdsService;
	
	/* hrs 관련 */
	/*================================================================================*/
	@RequestMapping("/Hrs/List")
	@ResponseBody
	public ModelAndView list() {
		List<CityVo> 	cityList 	= mainMapper.getCityList();
		List<DutyVo> 	dutyList 	= mainMapper.getDutyList();
		List<CareerVo> 	careerList 	= mainMapper.getCareerList();
		List<EmpVo> 	empList 	= mainMapper.getEmpList();
		List<SkillVo> 	skillList 	= mainMapper.getSkillList();
		
		List<ResumeListVo> resumeList   = mainMapper.getResumeList(); 
		System.out.println(resumeList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cityList",cityList);
		mv.addObject("dutyList",dutyList);
		mv.addObject("careerList",careerList);
		mv.addObject("empList",empList);
		mv.addObject("skillList",skillList);
		mv.addObject("resumeList",resumeList);
		mv.setViewName("main/hrs/list");
		return mv;

	}
	
	@RequestMapping("/HrsFilter")
	public Map<String, Object> filterJobs(
	        @RequestParam(required = false, value="city_id") 	String city_id,
	        @RequestParam(required = false, value="duty_id") 	String duty_id,
	        @RequestParam(required = false, value="career_id") 	String career_id,
	        @RequestParam(required = false, value="emp_id") 	String emp_id,
	        @RequestParam(required = false, value="skill_id") 	String skill_id) {
		
	    List<ResumeListVo> hrsFilter = mainMapper.getFilteredResumes(city_id, duty_id, career_id, emp_id, skill_id);
	    System.out.println(hrsFilter);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("resumeList", hrsFilter);
	    response.put("message", "데이터를 성공적으로 가져왔습니다.");
	    return response;
	}
	
	
	
	

	//-- hrs bookmark
	
	@RequestMapping("/Hrs/View")
	public ModelAndView view(HttpServletRequest request
			,@RequestParam(required = true, value="resume_idx")  String resume_idx) {

		mainMapper.updateResumeHit(resume_idx);
		
		HttpSession session = request.getSession();
		ResumeListVo vo   = mainMapper.getResume(resume_idx); 
		
		ModelAndView mv = new ModelAndView();
		//파일 정보
		List<PortfolioVo> pfvoList = pdsService.getPortfolio(Integer.parseInt(resume_idx));
		//이미지 정보
		ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
		String imagePath = "";
		if(ifvo==null) {
			 imagePath = "0";
		}else {
			imagePath = ifvo.getImage_path().replace("\\", "/");
		}

		Object userObject = session.getAttribute("login");

		if (userObject instanceof CompanyVo) {
			System.out.println("userObject는 CompanyVo 타입입니다.");
			CompanyVo userVo = (CompanyVo) session.getAttribute("login");
			if( userVo != null ) {		
				
				List<PostListVo> postVo = mainMapper.getCompanyPost(userVo.getCompany_idx());
				String cb_idx = mainMapper.getBookC(userVo.getCompany_idx(),resume_idx);
				mv.addObject("cb_idx",cb_idx);
				mv.addObject("company_idx",userVo.getCompany_idx());
				mv.addObject("postVo",postVo);
				
			}	
			mv.addObject("vo",vo);
			mv.addObject("imagePath",imagePath);
			mv.addObject("pfvoList",pfvoList);
			mv.addObject("userObject",userObject);
			mv.setViewName("main/hrs/view");
		}else {
			mv.setViewName("company/loginForm");
			
		}


		return mv;
	}
	@RequestMapping("/Hrs/Scout")
	public ModelAndView scout(@RequestParam (value = "resume_idx") String resumeIdx,
							  @RequestParam (value = "post_idx") String postIdx) {
		System.out.println(resumeIdx);
		System.out.println(postIdx);
		mainMapper.insetScout(resumeIdx,postIdx);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Main/Hrs/List");
		return mv;
		
	}
	

	@RequestMapping(value="Hrs/BookMark/On")
	@ResponseBody
	public String bookmarkon(@RequestParam("company_idx") int company_idx,@RequestParam("resume_idx") int resume_idx) {
		
		mainMapper.insertBookC(company_idx,resume_idx);
		
		return "";	
	}
	
	@RequestMapping(value="Hrs/BookMark/Off")
	@ResponseBody
	public String bookmarkoff(@RequestParam("company_idx") int company_idx,@RequestParam("resume_idx") int resume_idx) {
		
		mainMapper.deleteBookC(company_idx,resume_idx);
		
		return "";	
	}
	
	
}
