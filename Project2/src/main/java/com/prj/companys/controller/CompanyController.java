package com.prj.companys.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.companys.vo.CompanyVo;
import com.prj.main.mapper.MainMapper;
import com.prj.main.vo.PostListVo;

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
	public String login(HttpServletRequest request,
					    HttpServletRequest response ) {

		System.out.println(request);
		System.out.println(response);
		String 		 userid = request.getParameter("company_id");
		String 		 passwd = request.getParameter("company_pw");
		// db 조회
		CompanyVo 		       vo     = companyMapper.login(userid,passwd);
		System.out.println(vo);
		
		
        String loginFalseMessage = "";
        if( vo != null ) {

        	List<PostListVo>       post   = mainMapper.getCompanyPost(vo.getCompany_idx());
        	System.out.println(post);
            HttpSession session = request.getSession();
            session.setAttribute( "login", vo );
            session.setAttribute("post", post);
            session.setMaxInactiveInterval(2*60*60);

            return ("redirect:/");
         };
         if( vo == null ) {
            HttpSession  session = request.getSession();
            loginFalseMessage = "아이디와 비밀번호를 확인해주세요";
            session.setAttribute("loginFalseMessage",loginFalseMessage);
            return ("redirect:/Company/LoginForm");

         };
		return "";
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
	

    // /Company/Logout
    @RequestMapping(
            value = "/Logout",
            method = RequestMethod.GET)
    public String Logout(
                    HttpServletRequest requset,
                    HttpServletRequest response,
                    HttpSession        session) {
            session.invalidate();
            return "redirect:/";
    }
	

	
}
