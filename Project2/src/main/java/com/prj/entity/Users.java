package com.prj.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "USERS")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {
	
	public Users(int user_idx) {
		this.user_idx = (long) user_idx;
	}
	@Id
	private Long 	user_idx;
	@Column
	private String 	user_id;
	@Column
	private String 	user_name;
	@Column
	private String 	user_pw;
	@Column
	private String 	user_birthdate;
	@Column
	private String 	user_gender;
	@Column
	private String 	user_email;
	@Column
	private String 	user_tel;

}
