package com.prj.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserBookmarkVo {

	private int ub_idx;
	private int user_idx;
	private int company_idx;
	private String company_area;
	private String company_name;
}
