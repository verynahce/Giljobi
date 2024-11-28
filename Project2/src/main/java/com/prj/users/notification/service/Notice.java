package com.prj.users.notification.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	

	private Integer noticeIdx;
	private Integer postIdx;
	private Integer resumeIdx;
	private Integer announcementIdx;
	private Integer userIdx;
	private Integer senderIdx;
	private Integer companyIdx;
	private Integer communityIdx;
	private Integer replyIdx;
	private String recieveddate;
	private String type;
	private String state;
	private String notification;
	private String subnoti;

}
