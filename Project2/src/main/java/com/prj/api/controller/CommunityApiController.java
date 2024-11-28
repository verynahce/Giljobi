package com.prj.api.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prj.dto.CommunityReplyDTO;
import com.prj.entity.Community;
import com.prj.entity.CommunityReply;
import com.prj.entity.Notice;
import com.prj.service.CommunityService;


@RestController
@RequestMapping("Main/Reply")
public class CommunityApiController {

	@Autowired
	private CommunityService  communityService;
	
	@PostMapping("/Write")
	public ResponseEntity<CommunityReplyDTO> create(@RequestBody CommunityReplyDTO crDto) {
	 

         CommunityReplyDTO  created = communityService.insertCoummunityReply(crDto);
        
         //댓글
         communityService.insertNoticeReply(crDto,created);
         
		return    ResponseEntity.status(HttpStatus.OK).body( created );
	}
	
	//좋아요 수 업데이트 추가
	@PatchMapping("/Like/on")
	public ResponseEntity <Community>  LikeOn(@RequestBody Community Community) {
				
		Community  updated  =  communityService.updateLikeOn(Community.getCommunityIdx()); 		
		ResponseEntity<Community>  result  =
				( updated != null ) 
				?  ResponseEntity.status(HttpStatus.OK).body( updated )	
				:  ResponseEntity.status(HttpStatus.BAD_REQUEST).build() ;	
		
		return  result;
	}
	//좋아요 수 업데이트 제거
	@PatchMapping("/Like/off")
	public ResponseEntity <Community>  LikeOff (@RequestBody Community Community) {
				
		Community  updated  =  communityService.updateLikeOFF(Community.getCommunityIdx()); 		
		ResponseEntity<Community>  result  =
				( updated != null ) 
				?  ResponseEntity.status(HttpStatus.OK).body( updated )	
				:  ResponseEntity.status(HttpStatus.BAD_REQUEST).build() ;	
		
		return  result;
	}
	//댓글 좋아요 수 업데이트 추가
	@PatchMapping("/RLike/on")
	public ResponseEntity <CommunityReply>  RLikeOn(@RequestBody CommunityReply communityReply) {
				
		CommunityReply  updated  =  communityService.updateRLikeOn(communityReply.getReplyIdx()); 		
		ResponseEntity<CommunityReply>  result  =
				( updated != null ) 
				?  ResponseEntity.status(HttpStatus.OK).body( updated )	
				:  ResponseEntity.status(HttpStatus.BAD_REQUEST).build() ;	
		
		return  result;
	}
	
	//댓글 좋아요 수 업데이트 추가
	@PatchMapping("/RLike/off")
	public ResponseEntity <CommunityReply>  RLikeOff(@RequestBody CommunityReply communityReply) {
				
		CommunityReply  updated  =  communityService.updateRLikeOff(communityReply.getReplyIdx()); 		
		ResponseEntity<CommunityReply>  result  =
				( updated != null ) 
				?  ResponseEntity.status(HttpStatus.OK).body( updated )	
				:  ResponseEntity.status(HttpStatus.BAD_REQUEST).build() ;	
		
		return  result;
	}
	
	@DeleteMapping("/Delete")
	public ResponseEntity <CommunityReply> Deletereply(@RequestBody CommunityReplyDTO crDto) {
		
		
		CommunityReply deleted = communityService.deleteReply(crDto);
		ResponseEntity <CommunityReply> result =
				(deleted != null)
				?  ResponseEntity.status(HttpStatus.OK).body( deleted )	
				:  ResponseEntity.status(HttpStatus.BAD_REQUEST).build() ;	
		
		return  result;
	}
	
	
}
