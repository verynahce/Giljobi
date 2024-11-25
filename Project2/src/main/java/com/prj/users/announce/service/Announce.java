package com.prj.users.announce.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Announce {

	private Integer announcementIdx;
	private Integer companyIdx;
	private Integer userIdx;
	private String scadule;
	private String location;
	private String information;
	private String writedate;
}
