package com.prj.companys.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EvaluateVo {
	private Integer  evaluate_idx;
	private Double total_score;
	private String total_note;
	private double edu_score;
	private double skill_score;
	private double career_score;
	private Double letter_score;
	private Double portfolio_score;
	private Double ext_score;
	private String edu_note;
	private String skill_note;
	private String career_note;
	private String letter_note;
	private String portfolio_note;
	private String ext_note;
	private int appli_idx;
}

