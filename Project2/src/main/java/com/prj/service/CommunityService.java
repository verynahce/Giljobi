package com.prj.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.prj.dto.CommunityReplyDTO;
import com.prj.entity.Community;
import com.prj.entity.CommunityReply;
import com.prj.entity.Duty;
import com.prj.entity.Users;
import com.prj.repository.CommunityRepository;
import com.prj.repository.DutyRepository;
import com.prj.repository.ReplyRepository;
import com.prj.repository.UsersRepository;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommunityService {
	
	@Autowired
	private CommunityRepository cRepository;
	@Autowired
	private UsersRepository usersRepository;
	@Autowired
	private DutyRepository dutyRepository;
	@Autowired
	private ReplyRepository replyRepository;

	public List<Community> getCommunityList() {
		List<Community> CommunityList =  cRepository.findAll();
		return CommunityList;
	}

	public Community getCommunity(Long communityIdx) {
	    if (communityIdx == null) {
	        throw new IllegalArgumentException("Community ID는 null일 수 없습니다.");
	    }
	    return cRepository.findById(communityIdx).orElse(null);
	}

	public void insertCoummunity(Community community) {
		cRepository.save(community);
		
	}

	public Users getUser(Long userIdx) {
		Users users = usersRepository.findById(userIdx).orElseThrow(null);
		return users;
	}

	public Duty getDuty(Long dutyId) {
		Duty duty = dutyRepository.findById(dutyId).orElseThrow(null);
		return duty;
	}

	public List<Duty> getDutyList() {
		List<Duty> dutyList =  dutyRepository.findAll();
		
		return dutyList;
	}


	public CommunityReplyDTO insertCoummunityReply(CommunityReplyDTO crDto) {
		
		
		System.out.println("댓글 확인 좀 " + crDto.getCommunityIdx());
		//1.게시물이 있는지 조회
		Community community = cRepository.findById(crDto.getCommunityIdx()).orElseThrow( () -> new IllegalArgumentException(
					"댓글 생성 실패! 대상 게시물이 없습니다" ) );
		
		 // dto 엔티티형식으로 변경
		 Users user = usersRepository.findById(crDto.getUserIdx()).orElseThrow(null);
         Duty duty = dutyRepository.findById(crDto.getDutyId()).orElseThrow(null);    
        
		 System.out.println("유저값 "+user);
		 System.out.println("유저값 "+duty);
		
         LocalDateTime cdate = LocalDateTime.now();
                
         CommunityReply target = crDto.toEntity(user,duty,cdate,community);

         // 3.댓글 엔티티 db에 저장
         CommunityReply createob = replyRepository.save(target);
 							
 		// 4. 저장 created -> Dto로 변환
         CommunityReplyDTO created = createob.toDto();
		
		return created;
	}

	public List<CommunityReply> getCommunityReplyList(Iterable<Long> communityIdx) {
		
		List<CommunityReply> replyList = replyRepository.findAllById(communityIdx);
		
		return replyList;
	}

	public Community updateLikeOn(Long communityIdx) {
		
		
		//게시물이 있는지 조회
		Community target = cRepository.findById(communityIdx).orElseThrow(()-> 
		                   new  IllegalArgumentException("좋아요수 on업데이트 실패! 게시물이 없습니다"));
		//수정 후 다시 저장
		target.patchOn();  
		Community updateLike = cRepository.save(target);
		return updateLike;
	}

	public Community updateLikeOFF(Long communityIdx) {
		//게시물이 있는지 조회
		Community target = cRepository.findById(communityIdx).orElseThrow(()-> 
		                   new  IllegalArgumentException("좋아요수 off업데이트 실패! 게시물이 없습니다"));
		//수정 후 다시 저장
		target.patchOff();  
		Community updateLike = cRepository.save(target);
		return updateLike;
	}

	public List<CommunityReply> getRepliesByCommunityIdx(Long communityIdx) {
		
	    Community target = cRepository.findById(communityIdx).orElseThrow(() -> 
        new IllegalArgumentException("댓글 조회 실패! 게시물이 없습니다"));

    // 댓글 리스트 반환
    return target.getReplies();
	}

	public CommunityReply updateRLikeOn(Long replyIdx) {
		CommunityReply target = replyRepository.findById(replyIdx).orElseThrow(()-> 
        new  IllegalArgumentException("좋아요수 off업데이트 실패! 댓글이 없습니다"));
		
		target.patchOn();
		CommunityReply reply = replyRepository.save(target);
		return reply;
	}

	public CommunityReply updateRLikeOff(Long replyIdx) {
		CommunityReply target = replyRepository.findById(replyIdx).orElseThrow(()-> 
        new  IllegalArgumentException("좋아요수 off업데이트 실패! 댓글이 없습니다"));
		
		target.patchOff();
		CommunityReply reply = replyRepository.save(target);
		return reply;
	}

	public Long getReplyCountForCommunity(Long communityIdx) {
		Long count = replyRepository.countByCommunityCommunityIdx(communityIdx);
		return count;
	}
	@Transactional 
	public CommunityReply deleteReply(CommunityReplyDTO crDto) {
		
		//타겟 조회
		CommunityReply target = replyRepository.findById(crDto.getReplyIdx()).orElseThrow(()-> 
        new  IllegalArgumentException("삭제 실패! 댓글이 없습니다"));
		//없는 자료 처리
		if( target == null  )
			return  null;		
		// 3. 실제 삭제		
		replyRepository.delete( target );
		//삭제					
		return target;
	}

	public void updateHit(Long communityIdx) {
		//타겟 조회
		 Community target = cRepository.findById(communityIdx).orElseThrow(() -> 
	        new IllegalArgumentException("조회수 업데이트 실패! 게시물이 없습니다"));
		
		target.updateHit();
		cRepository.save(target);
		
	}

// 리스트 -기본 , 최신순, 추천순
	public Page<Community> getPageCommunityList(int page, int size) {
		  Pageable pageable = PageRequest.of(page, size);
		return cRepository.findAll(pageable);
	}

	public Page<Community> getPageListdata(int page, int size) {
	    Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.desc("comRegdate")));
	    return cRepository.findAll(pageable);
	}

	public Page<Community> getPageListHit(int page, int size) {
	    Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.desc("comLike")));
	    return cRepository.findAll(pageable);
	}
	
		   

}