package com.prj.main.vo;




import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClarificationVo {
	private int clarification_idx;
	private String cloth;
	private String age;
	private String situation_etc;
	private String prek;
	private String pto;
	private String prek_etc;
	private String meeting_num;
	private String meeting_count;
}
