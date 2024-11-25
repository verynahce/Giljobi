package com.prj.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import com.prj.entity.Community;
import com.prj.entity.CommunityReply;
import com.prj.entity.Duty;
import com.prj.entity.Users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityReplyDTO {
    
    private long replyIdx;
    private long communityIdx;
    private long  userIdx;
    private String replyContent;
    private LocalDateTime  replyRegdate;
    private int  replyLike;
    private String careerSelf;
    private long dutyId;
 


	public CommunityReply toEntity(Users user, Duty duty,LocalDateTime cdate, Community community) {
	     CommunityReply communityReply = new CommunityReply();
	    
	    // DTO의 필드 값을 엔티티에 설정
	    communityReply.setReplyIdx(this.replyIdx);
	    communityReply.setCommunity(community);
	    communityReply.setUsers(user); 
	    communityReply.setReplyContent(this.replyContent);
	    communityReply.setReplyRegdate(cdate); 
	    communityReply.setReplyLike(0); 
	    communityReply.setCareerSelf(this.careerSelf);
	    communityReply.setDuty(duty); 

	    return communityReply;
	}
    
}
