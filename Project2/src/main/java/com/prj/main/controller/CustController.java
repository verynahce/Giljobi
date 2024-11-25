package com.prj.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Main/Cust")
public class CustController {
	
	/* cust 관련 */
	/*================================================================================*/
	@RequestMapping("/Center")
	public String list() {
		return "/main/cust/center";
	}
	

}
