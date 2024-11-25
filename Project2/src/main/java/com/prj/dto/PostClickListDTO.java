package com.prj.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostClickListDTO {
	
	private String post_title;
	private String post_ddate;
	private String company_name;
	private String emp_name;
	private String career_name;
	private String duty_name;
	private int post_idx;
    
}
