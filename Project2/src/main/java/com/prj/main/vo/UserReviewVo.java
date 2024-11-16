package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserReviewVo {
	private int 	 review_idx;
	private int 	 user_idx;
	private String 	 company_name;
	private double 	 tot_point;
	private double 	 wc_point;
	private double 	 wlb_point;
	private double 	 cc_point;
	private double 	 po_point;
	private double 	 em_point;
	private String 	 review_title;
	private String 	 review_pros;
	private String 	 review_con;
	private String 	 review_date;
}
