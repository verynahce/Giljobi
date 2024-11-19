package com.prj.main.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.prj.main.vo.ImagefileVo;

public interface PdsService {

	void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

	void setimageWrite(HashMap<String, Object> map, MultipartFile uploadimage);

	ImagefileVo getImagefile(int image_idx);


}
