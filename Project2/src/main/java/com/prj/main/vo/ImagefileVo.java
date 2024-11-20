package com.prj.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImagefileVo {
	private int image_idx;
	private String imagename;
	private String imageext;
	private String image_path;
	private String image_type;
	
	public ImagefileVo(String imagename, String imageext, String image_path, String image_type) {
		super();
		this.imagename = imagename;
		this.imageext = imageext;
		this.image_path = image_path;
		this.image_type = image_type;
	}

}
