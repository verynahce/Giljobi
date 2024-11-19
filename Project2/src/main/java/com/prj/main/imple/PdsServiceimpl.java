package com.prj.main.imple;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.main.mapper.PdsMapper;
import com.prj.main.service.PdsService;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;

@Service
public class PdsServiceimpl implements PdsService {
     
	//application.properties의 part4.upload-path 정보 가져오기
	@Value("${part4.upload-path}")	
	private String uploadPath;
	
	@Autowired
	private PdsMapper pdsMapper;

	@Override
	public void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.save(uploadfiles,map);	
		
		//db 저장
		List<PortfolioVo> fileList = (List<PortfolioVo>)map.get("fileList");
		if(fileList.size()>0)
		pdsMapper.setFileWriter(map);	
	}

	@Override
	public void setimageWrite(HashMap<String, Object> map,MultipartFile uploadimage) {
		map.put("uploadPath", uploadPath );
		//파일 저장
		PdsFile.getsave(uploadimage,map);
		
		//db 저장
		ImagefileVo idPhoto = (ImagefileVo) map.get("idPhoto");
		if(idPhoto != null)
		pdsMapper.setimageWriter(idPhoto);
	}

	@Override
	public ImagefileVo getImagefile(int image_idx) {
		ImagefileVo ifvo = pdsMapper.getImagefile(image_idx);
		return ifvo;
	}		
		
	
	
	

}
