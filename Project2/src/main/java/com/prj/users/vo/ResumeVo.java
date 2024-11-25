package com.prj.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeVo {
	private int	 resume_idx;
	private int	 user_idx;
	private int duty_id;
	private int city_id;
	private int emp_id;
	private int edu_id;
	private String resume_title;
	private String eb_name;
	private String cover_letter;
	private int resume_hit;
	private String resume_cdate;
	private String resume_fdate;
	
	private int image_idx;

}
