package com.prj.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserScoutVo {
	
	private String company_name;
	private String post_title;
	private String post_ddate;
	private String	scout_date;
	private int	scout_idx;
	private int	user_idx;
	private int	post_idx;
	
	
}
