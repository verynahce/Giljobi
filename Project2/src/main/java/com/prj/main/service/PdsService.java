package com.prj.main.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;

public interface PdsService {

	void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

	void setimageWrite(HashMap<String, Object> map, MultipartFile uploadimage);

	ImagefileVo getImagefile(int image_idx);

	List<PortfolioVo> getPortfolio(int resume_idx);


}
