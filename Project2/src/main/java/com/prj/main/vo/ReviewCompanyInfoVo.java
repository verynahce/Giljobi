package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewCompanyInfoVo {
	private int 	company_idx;
	private String  company_name;
	private String  company_tel;
	private String  company_email;
	private String  company_area;	
	private String  company_birthdate;
	private String  company_address;
	private double  tot_point;
	private double  wc_point;
	private double  wlb_point;
	private double  cc_point;
	private double  po_point;
	private double  em_point;
}