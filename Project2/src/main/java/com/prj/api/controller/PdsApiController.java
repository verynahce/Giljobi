package com.prj.api.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.prj.main.vo.PortfolioVo;
import com.prj.service.PdsService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
public class PdsApiController {

	@Value("${part4.upload-path}")	
	private String uploadPath;
	
	@Autowired
	private PdsService pdsService;
	
    // private final String uploadDir = "C:/Users/Admin/Desktop/dev/data/";
     
    @GetMapping("/image/read")
    public ResponseEntity<Resource> getImage(@RequestParam("path") String imagePath) throws IOException {
    	 
        try {
            // 이미지 파일의 절대 경로
            Path filePath = Paths.get(uploadPath).resolve(imagePath).normalize();
           
            Resource resource = new UrlResource(filePath.toUri());
                       
            // 파일의 MIME 타입 동적으로 설정
            String contentType = Files.probeContentType(filePath);
            if (contentType == null) {
                contentType = "application/octet-stream"; // 기본값 설정
            }    
            if (resource.exists() && resource.isReadable()) {
                // 파일이 존재하고 읽을 수 있는 경우 이미지 반환
                HttpHeaders headers = new HttpHeaders();
                headers.add(HttpHeaders.CONTENT_TYPE, contentType); // 이미지 타입 지정 (예: jpeg)
                return new ResponseEntity<>(resource, headers, HttpStatus.OK);
            } else {
                // 파일이 없는 경우 404 응답
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    
    @GetMapping("/filedownload/{portfolio_idx}")
    public void filedownload(HttpServletResponse res, @PathVariable(value="portfolio_idx") int portfolio_idx) throws UnsupportedEncodingException {
    
  	  //파일을 조회(Files) //pathvariable은 map 쓰기 적합하지 않음
    	PortfolioVo portfolioVo = pdsService.getportfolifo(portfolio_idx);
    	
    	 System.out.println(portfolioVo);
    	 System.out.println(portfolio_idx);
  	  //파일의 경로 (import Path java.nio.file)
  	  Path saveFilepath =Paths.get(
  			   uploadPath 
  			  +java.io.File.separator
  			  +portfolioVo.getFile_path()
  			  );
  	  System.out.println(saveFilepath);
  	  // http 헤더 설정
  	  setFileHeader(res,portfolioVo);
  	  // 파일 복사 -> 함수 (서버 --> 클라이언트로 복사) == 다운로드
  	  fileCopy(res,saveFilepath);
    }                             
    //파일복사: 실제 바이너리 데이터를 다운로드
    private void fileCopy(HttpServletResponse res, Path saveFilepath) {
          FileInputStream fis = null;
  		try {
  			fis = new FileInputStream( saveFilepath.toFile());
  			FileCopyUtils.copy(fis, res.getOutputStream());
  			res.getOutputStream().flush(); //버퍼에 남아있는 데이터를 다 보내라
  		} catch (FileNotFoundException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		} finally {
          try {
  			fis.close();
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  		}
  }
    //다운받을 파일을 header(받아서 넘기는 정보들) 정보를 설정
    private void setFileHeader(HttpServletResponse res, PortfolioVo portfolioVo) throws UnsupportedEncodingException {
  	   res.setHeader("Content-Disposition",
                "attachment; filename=\"" +  
                   URLEncoder.encode(
                   (String) portfolioVo.getFilename(), "UTF-8") + "\";");
          res.setHeader("Content-Transfer-Encoding", "binary");
          res.setHeader("Content-Type", "application/download; utf-8");
          res.setHeader("Pragma", "no-cache;");
          res.setHeader("Expires", "-1;");
  	
  } 
	@RequestMapping("/deleteFile")
	public void deleteFile(@RequestParam ("portfolio_idx") int portfolio_idx ) {
	
		
	//실제 파일 삭제 
	PortfolioVo pfvo = pdsService.getportfolifo(portfolio_idx); 	
	
	File file = new File(uploadPath + pfvo.getFile_path());
	if( file.exists()) {
		file.delete();
	}	
	//files table row delete
	pdsService.deleteportfolivo(portfolio_idx);
	
	} 
    
}