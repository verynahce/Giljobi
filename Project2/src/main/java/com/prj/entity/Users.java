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
	
	@Id
	@Column(name = "USER_IDX", nullable = false)
	private Long 	userIdx;

	@Column(name = "USER_ID")
	private String 	userId;

	@Column(name = "USER_PW")
	private String 	userPw;
	
	@Column(name = "USER_NAME")
	private String 	userName;
	
	@Column(name = "USER_BIRTHDATE")
	private String 	userBirthdate;

	@Column(name = "USER_GENDER")
	private String 	userGender;
	
	 @Column(name = "USER_TEL")
	private String 	userTel;
	 
	 @Column(name = "USER_EMAIL")
	 private String  userEmail;
	 
	 @Column(name = "USER_ADDRESS")
	 private String  userAddress;




}
