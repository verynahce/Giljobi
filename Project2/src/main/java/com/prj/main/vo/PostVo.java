package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVo {
	private int 	post_idx;
	private String 	company_name;
	private String 	duty_name;
	private String 	career_name;
	private String 	city_name;
	private String 	edu_name;	
	private String  emp_name;
	private String  skill_name;
	private String 	post_title;
	private String 	post_content;
	private String 	post_Salary;
	private int 	post_hit;
	private String 	post_ddate;
	private String 	post_cdate;
	private String 	post_fdate;
	private int     company_idx;
}
