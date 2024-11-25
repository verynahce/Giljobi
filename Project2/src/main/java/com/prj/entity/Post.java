package com.prj.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "POST")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {	

	@Id
	private Long post_idx;
	@Column
	private int company_idx;
	@Column
	private int duty_id;
	@Column
	private int career_id;
	@Column
	private int emp_id;
	@Column
	private int city_id;
	@Column
	private int edu_id;
	@Column
	private String post_title;
	@Column
	private String post_content;
	@Column
	private String post_salary;
	@Column
	private int post_hit;
	@Column
	private String post_ddate;
	@Column
	private String post_cdate;
	@Column
	private String post_fdate;
	@Column
	private Long image_idx;


	
}
