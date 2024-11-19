package com.prj.main.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.prj.main.vo.ImagefileVo;

@Mapper
public interface PdsMapper {

	void setFileWriter(HashMap<String, Object> map);

	void setimageWriter(ImagefileVo idPhoto);

	ImagefileVo getImagefile(int image_idx);


	
}
