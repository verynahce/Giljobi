package com.prj.companys.vo;

import lombok.Data;

@Data
public class CompanyVo {
	private int		company_idx;
	private String 	company_id;
	private String 	company_pw;
	private String 	company_name;
	private String 	company_brnum;
	private String	company_tel;
	private String	company_area;
	private String	rep_name;
	private String	company_email;
	private String	company_point;
	private String	company_birthdate;
	private String	company_address;
	private int image_idx;
	private String  role;
	public CompanyVo() {
		this.role = "기업회원";
	}
	
	
	
	public CompanyVo(int company_idx, String company_id, String company_pw, String company_name, String company_brnum,
			String company_tel, String company_area, String rep_name, String company_email, String company_point,int image_idx,
			String company_birthdate,String company_address,String role) {
		this.company_idx = company_idx;
		this.company_id = company_id;
		this.company_pw = company_pw;
		this.company_name = company_name;
		this.company_brnum = company_brnum;
		this.company_tel = company_tel;
		this.company_area = company_area;
		this.rep_name = rep_name;
		this.company_email = company_email;
		this.company_point = company_point;
		this.image_idx =image_idx;
		this.company_birthdate =company_birthdate;		
		this.company_address =company_address;		
		this.role = role != null ? role : "기업회원";
	}
	
	
	
}
