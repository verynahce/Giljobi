package com.prj.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVo {
	

	private int notice_idx;
	private int post_idx;
	private int resume_idx;
	private int announcement_idx;
	private int user_idx;
	private int sender_idx;
	private int company_idx;
	private int community_idx;
	private int reply_idx;
	private String recieveddate;
	private String type;
	private String state;
	private String notification;
	private String subnoti;
}
