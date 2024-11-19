package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeListVo {
	private int  	resume_idx;
	private int  	user_idx;
	private String 	user_name;
	private String 	user_age;
	private String 	user_gender;
	private String 	user_year;
	private String 	user_tel;
	private String 	user_email;
	private String 	user_address;
	private String 	resume_title;
	private String 	eb_name;
	private String 	edu_name;
	private String 	skill_name;
	private String 	city_name;
	private String 	duty_name;
	private String 	emp_name;
	private String 	career_cname;
	private String 	career_sdate;
	private String 	career_edate;
	private String  career_year;
	private String  career_month;
	private String 	career_description;
	private String 	cover_letter; 
	private int 	resume_hit; 
    private String 	resume_cdate; 
    private String 	resume_fdate;
    private int image_idx;
}
