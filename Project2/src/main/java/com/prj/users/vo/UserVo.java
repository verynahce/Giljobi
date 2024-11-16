package com.prj.users.vo;

import lombok.Data;

@Data
public class UserVo {
	private int 	user_idx;
	private String 	user_id;
	private String 	user_name;
	private String 	user_pw;
	private String 	user_birthdate;
	private String 	user_gender;
	private String 	user_email;
	private String 	user_tel;
	private String  role;
	
	public UserVo() {
		this.role = "개인회원";
	}
	
	
	
	public UserVo(int user_idx, String user_id, String user_name, String user_pw, String user_birthdate,
			String user_gender, String user_email, String user_tel, String role) {
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.role = role != null ? role : "기업회원";
	}
}
