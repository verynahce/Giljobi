package com.prj.companys.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluateVo {	

	private Integer evaluate_idx;
	private int resume_idx;
	private int company_idx;
	private int total_score;
	private String total_note;
	private int edu_score;
	private int skill_score;
	private int career_score;
	private int letter_score;
	private int portfolio_score;
	private int ext_score;
	private String edu_note;
	private String skill_note;
	private String career_note;
	private String letter_note;
	private String portfolio_note;
	private String ext_note;
	private int appli_idx;
}

