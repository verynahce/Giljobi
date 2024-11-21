package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostListVo {
    private int    post_idx;
    private int    company_idx;
    private String post_title;
    private String company_name;
    private double tot_point;
    private String company_email;
    private String company_tel;
    private int    duty_id;
    private String duty_name;
    private String career_name;
    private String edu_name;
    private String post_salary;
    private String skill_name;
    private String emp_name;
    private String city_name;
    private String post_content;
    private int    post_hit;
    private String post_ddate;
    private String post_cdate;
    private String post_fdate;
    private int    image_idx;
}
