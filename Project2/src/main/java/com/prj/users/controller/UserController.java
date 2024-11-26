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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.vo.CompanyVo;
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
        public String login(HttpServletRequest request,
                                            HttpServletRequest response ) {

                System.out.println(request);
                System.out.println(response);
                String           userid = request.getParameter("user_id");
                String           passwd = request.getParameter("user_pw");
                String           uri = request.getParameter("uri");
                // db 조회
                System.out.println(uri);
                System.out.println(passwd);
                UserVo           vo     = userMapper.login(userid,passwd);
                System.out.println(vo);

              String loginFalseMessage = "";
                if( vo != null ) {

                   HttpSession  session = request.getSession();
                   session.setAttribute( "login", vo );
                   session.setMaxInactiveInterval(2*60*60);

                   return ("redirect:/");
                };
                if( vo == null ) {
                           HttpSession  session = request.getSession();
                   loginFalseMessage = "다시 로그인 시도해주세요";
                   session.setAttribute("loginFalseMessage",loginFalseMessage);
                   return ("redirect:/User/LoginForm");

                };
                return "";
        }

        // /Users/Logout
        @RequestMapping(
                value = "/Logout",
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
        public String registerForm() {
                return "user/registerForm";
        }
        
        @RequestMapping( "/CheckDuplication" )
        @ResponseBody
        public String checkDuplication( @RequestParam( "user_id" ) String user_id ) {

           UserVo user = userMapper.getUserById(user_id);
            if (user == null) {
                return "가능";  // 아이디가 존재하지 않으면 가능
            }
            return "불가능";  // 아이디가 존재하면 불가능
        }
        
		@RequestMapping("/SearchAddress")
		public String searchAddress() {
		        return "user/popupaddress";
		}

        @RequestMapping("/Register")
        public ModelAndView register(UserVo userVo) {
                userMapper.insertUser(userVo);

                ModelAndView mv = new ModelAndView();
                mv.setViewName("redirect:/User/LoginForm");
                return mv;
        }

        @RequestMapping("/Social/Profile")
        public ModelAndView social(String state) {
                ModelAndView mv = new ModelAndView();
                mv.addObject("state",state);
                mv.setViewName("/user/navercallback");
                return mv;
        }



}