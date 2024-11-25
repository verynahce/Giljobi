package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewCompanyListVo {
	private int 	company_idx;
	private String  company_name;
	private String  company_area;
	private int     count;

}