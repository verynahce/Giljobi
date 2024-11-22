package com.prj.users.notice.service;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Notice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notice_idx;
    
	private int post_idx;
	private int resume_idx;
	private int announcement_idx;
	private int company_idx;
	private Integer useridx;
	private boolean state;
	private String notification;
	private String subnoti;
	private String recieveddate;

    // Getter, Setter 및 생성자 생략
}
