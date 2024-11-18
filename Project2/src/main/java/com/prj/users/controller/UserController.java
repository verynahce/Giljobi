package com.prj.users.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.prj.users.mapper.UserMapper;
import com.prj.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/User")
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/Login")
	public String login(HttpServletRequest requset,
					    HttpServletRequest response ) {

		System.out.println(requset);
		System.out.println(response);
		String 		 userid = requset.getParameter("user_id");
		String 		 passwd = requset.getParameter("user_pw");
		String 		 uri = requset.getParameter("uri");
		// db 조회
		System.out.println(uri);
		System.out.println(passwd);
		UserVo 		 vo     = userMapper.login(userid,passwd);
		System.out.println(vo);
		
		HttpSession session = requset.getSession();
		session.setAttribute("login", vo);
		return "redirect:/";
	}	
	
	// /Users/Logout 
	@RequestMapping(
		value =	"/Logout",
		method = RequestMethod.GET)
	public String Logout(
			HttpServletRequest requset,
			HttpServletRequest response,
			HttpSession        session) {
		Object url = session.getAttribute("URL");
		session.invalidate();
		//return "redirect:" + (String)url;
		return "redirect:/";
	}
	

	
	@RequestMapping("/RegisterForm")
	public String regiserForm() {
		return "user/registerForm";
	}
	
	@RequestMapping("/Register")
	public ModelAndView regiser(UserVo userVo) {
		userMapper.insertUser(userVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/User/LoginForm");
		return mv;
	}

	
	
	
}


//네이버 API 예제 - 회원프로필 조회
class APIExamMemberProfile {

	 public static void main(String[] args, String apiURL) {
	     String token = apiURL;// 네아로 접근 토큰 값";
	     String header = "Bearer " + token; // Bearer 다음에 공백 추가
	     try {
	         URL url = new URL(apiURL);
	         HttpURLConnection con = (HttpURLConnection)url.openConnection();
	         con.setRequestMethod("GET");
	         con.setRequestProperty("Authorization", header);
	         int responseCode = con.getResponseCode();
	         BufferedReader br;
	         if(responseCode==200) { // 정상 호출
	             br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	         } else {  // 에러 발생
	             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	         }
	         String inputLine;
	         StringBuffer response = new StringBuffer();
	         while ((inputLine = br.readLine()) != null) {
	             response.append(inputLine);
	         }
	         br.close();
	         System.out.println(response.toString());
	     } catch (Exception e) {
	         System.out.println(e);
	     }
	 }
}
