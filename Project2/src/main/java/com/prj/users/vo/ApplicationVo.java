package com.prj.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplicationVo {
	
	private int	      appli_idx;
	private int       resume_idx;
	private int       post_idx;
	private String    appli_date;
	private String    appli_status;
	
	
}
