package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PortfolioVo {
	private int portfolio_idx;
	private String filename;
	private String fileext;
	private String file_path;
	private int resume_idx;
	public PortfolioVo(String filename, String fileext, String file_path, int resume_idx) {
		super();
		this.filename = filename;
		this.fileext = fileext;
		this.file_path = file_path;
		this.resume_idx = resume_idx;
	}

	
}
