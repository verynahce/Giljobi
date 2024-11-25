package com.prj.users.notification.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	public Notice(int int1, String string, String string2, int int2) {
		// TODO Auto-generated constructor stub
	}
	private Integer announcementIdx;
	private Integer companyIdx;
	private Integer noticeIdx;
	private Integer postIdx;
	private Integer resumeIdx;
	private Boolean state;
	private Integer userIdx;
	private String notification;
	private String recieveddate;
	private String subnoti;
	
}
