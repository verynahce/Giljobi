package com.prj.main.imple;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.companys.vo.PostWriteVo;
import com.prj.main.mapper.PdsMapper;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.PortfolioVo;
import com.prj.service.PdsService;
import com.prj.users.mapper.UserMapper;
import com.prj.users.vo.ResumeVo;

@Service
public class PdsServiceimpl implements PdsService {
     
	//application.properties의 part4.upload-path 정보 가져오기
	@Value("${part4.upload-path}")	
	private String uploadPath;
	
	@Autowired
	private PdsMapper pdsMapper;

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CompanyMapper companyMapper;
	
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

	@Override
	public List<PortfolioVo> getPortfolio(int resume_idx) {
		List<PortfolioVo> pfvoList = pdsMapper.getPortfolio(resume_idx);
		return pfvoList;
	}

	@Override
	public PortfolioVo getportfolifo(int portfolio_idx) {
		PortfolioVo prvo =pdsMapper.getPortfolioinfo(portfolio_idx);
		return prvo;
	}

	@Override
	public void updateimage(MultipartFile uploadimage, int image_idx, HashMap<String, Object> map,ResumeVo resumeVo) {
		

		//기존  파일 삭제 
		ImagefileVo imfo = pdsMapper.getImagefile(image_idx); 				
	    if(imfo != null) {
		File file = new File(uploadPath + imfo.getImage_path());
		if( file.exists()) {
			file.delete();
		 }	
	    }
		map.put("uploadPath", uploadPath );
		//새로운 파일 저장
		PdsFile.getsave(uploadimage,map);
		
		//새로운 파일 db 저장
		ImagefileVo idPhoto = (ImagefileVo) map.get("idPhoto");		
		if(idPhoto != null)
		pdsMapper.setimageWriter(idPhoto);	
		
		//resume 업데이트
		userMapper.updateResume(resumeVo);	
		// 기존 db 삭제
		pdsMapper.deleteImagefile(image_idx);
		
	}

	@Override
	public void deleteportfolivo(int portfolio_idx) {
		pdsMapper.deleteportfolivo(portfolio_idx);
		
	}

	@Override
	public void deletefile(int resume_idx) {
		pdsMapper.deleteportresume(resume_idx);
	}

	@Override
	public void deleteImage(int image_idx) {
		pdsMapper.deleteImagefile(image_idx);
	}

	@Override
	public void updateimagePost(MultipartFile uploadimage, int image_idx, HashMap<String, Object> map, PostWriteVo vo) {
		
		//기존  파일 삭제 
		ImagefileVo imfo = pdsMapper.getImagefile(image_idx); 				
	    if(imfo != null) {
		File file = new File(uploadPath + imfo.getImage_path());
		if( file.exists()) {
			file.delete();
		 }	
	    }
		map.put("uploadPath", uploadPath );
		//새로운 파일 저장
		PdsFile.getsave(uploadimage,map);
		
		//새로운 파일 db 저장
		ImagefileVo idPhoto = (ImagefileVo) map.get("idPhoto");		
		if(idPhoto != null)
		pdsMapper.setimageWriter(idPhoto);			
		//resume 업데이트
		companyMapper.updatePostimage(vo);
		// 기존 db 삭제
		pdsMapper.deleteImagefile(image_idx);
		
	}

	
		
	
	
	

}
