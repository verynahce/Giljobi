package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityVo {
	private int community_idx;
	private int user_idx;
	private int image_idx;
	private int duty_id;
	private String com_title;
	private String com_content;
	private int com_hit;
	private String com_regdate;
	private int com_like;
}