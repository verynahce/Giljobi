package com.prj.main.vo;




import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeClickVo {
	
    private int rc_idx;
    private int resume_idx;
    private int company_idx;
    private int user_id;   
    private String resume_title;
    private String user_name;
    private String duty_name;
    private String duration;

}
