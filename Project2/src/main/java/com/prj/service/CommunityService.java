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
import com.prj.entity.Notice;
import com.prj.entity.Users;
import com.prj.repository.CommunityRepository;
import com.prj.repository.DutyRepository;
import com.prj.repository.NoticeRepository;
import com.prj.repository.ReplyRepository;
import com.prj.repository.UsersRepository;
import com.prj.users.notification.service.NoticeService;

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
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeRepository noticeRepository;

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
        
		 System.out.println("게시글 쓴 유저값 "+user);
		 System.out.println("게시글 직무값 "+duty);
		
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

	/*
    //댓글 작성시 알림 저장
    public void sendCommentNotification(Integer communityIdx, Integer replyIdx, Integer senderIdx, Integer receiverIdx, String notification, String subnoti) {
        Notice notice = new Notice();
        notice.setCommunityIdx(communityIdx);
        notice.setReplyIdx(replyIdx);
        notice.setSenderIdx(senderIdx);
        notice.setUserIdx(receiverIdx);
        notice.setType("댓글 알림");
        notice.setNotification(notification);
        notice.setSubnoti(subnoti);
        noticeService.sendNotification(notice);
    }
    */
    
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

	//조회수
	public List<Community> getCommunityU(int user_idx) {
		
		 //유저 조회
		 Long userIdx = (long) user_idx;
		 Users user = usersRepository.findById(userIdx).orElseThrow(()->
		 new IllegalArgumentException("글 업로드 실패! 등록된 유저가 아닙니다") );
		 
		 List <Community> CommunityList = cRepository.findByUsers(user);		 
		return CommunityList;
		
		
	}

	public void  deleteCommunity(Long communityIdx) {
		//게시물이 있는지 조회
	    Community target = cRepository.findById(communityIdx).orElseThrow(()-> 
				  new  IllegalArgumentException("삭제 실패! 게시물이 없습니다"));
		
	    cRepository.delete(target);
	}
   
	public void updateCommunity(Community community, Long dutyId) {
		
		//게시물이 있는지 조회
		Community target = cRepository.findById(community.getCommunityIdx()).orElseThrow(()-> 
		                   new  IllegalArgumentException("업데이트 실패! 게시물이 없습니다"));
       //직무
		Duty duty = dutyRepository.findById(dutyId).orElseThrow(null);    
        
		//수정 후 다시 저장
		target.patch(community,duty);  
		Community updated = cRepository.save(target);
		
	}

	public void insertNoticeReply(CommunityReplyDTO crDto, CommunityReplyDTO created) {
		System.out.println("댓글 확인 좀 " + crDto.getCommunityIdx());
		//1.게시물이 있는지 조회
		Community community = cRepository.findById(crDto.getCommunityIdx()).orElseThrow( () -> new IllegalArgumentException(
					"메시지 전송실패! 대상 게시물이 없습니다" ) );
		System.out.println("유저값 "+community.getUsers());
		 //2. 칼럼 값 구하기
        
         CommunityReply reply = replyRepository.findById(created.getReplyIdx()).orElseThrow( () -> new IllegalArgumentException(
					"메시지 전송실패! 대상 댓글이 없습니다" ) );		
         LocalDateTime cdate = LocalDateTime.now();
         String type = "reply";
         Long senderIdx = reply.getUsers().getUserIdx();
        
         
         Long cUser = community.getUsers().getUserIdx();
         Long rUser = reply.getUsers().getUserIdx();
 		 System.out.println("유저값 "+ cUser);
		 System.out.println("유저값 "+ rUser);
         // 게시물유저 = 댓글 유저 동일 제외
         if (!cUser.equals(rUser)) {
             Notice notice = new Notice(community.getUsers(),reply,cdate,type,community,senderIdx);           
             Notice send = noticeRepository.save(notice); 
	 
         }

		
	}
	

    
	
		   

}