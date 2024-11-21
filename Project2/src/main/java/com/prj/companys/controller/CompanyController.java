package com.prj.companys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.companys.vo.CompanyVo;
import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.PostListVo;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private MainMapper mainMapper;
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "company/loginForm";
	}
	

	@PostMapping("/Login")
	public String login(HttpServletRequest requset,
					    HttpServletRequest response ) {

		System.out.println(requset);
		System.out.println(response);
		String 		 userid = requset.getParameter("company_id");
		String 		 passwd = requset.getParameter("company_pw");
		// db 조회
		CompanyVo 		       vo     = companyMapper.login(userid,passwd);
		System.out.println(vo);
		List<PostListVo>       post   = mainMapper.getCompanyPost(vo.getCompany_idx());
		System.out.println(post);
		
		
		HttpSession session = requset.getSession();
		session.setAttribute("login", vo);
		session.setAttribute("post", post);
		return "redirect:/";
	}	
	
	
	@RequestMapping("/RegisterForm")
	public String registerForm() {
		return "company/registerForm";
	}
   @RequestMapping( "/CheckDuplication" )
   @ResponseBody
   public String checkDuplication( @RequestParam( "company_id" ) String company_id ) {
     
      CompanyVo company = companyMapper.getCompanyById(company_id);
       if (company == null) {
           return "가능";  // 아이디가 존재하지 않으면 가능
       }
       return "불가능";  // 아이디가 존재하면 불가능
   }
	@RequestMapping("/SearchAddress")
	public String searchAddress() {
		return "company/popupaddress";
	}	

	
	@RequestMapping("/Register")
	public ModelAndView regiser(CompanyVo companyVo) {
		System.out.println(companyVo);
		companyMapper.insertCompany(companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/LoginForm");
		return mv;
	}
	
	
}
