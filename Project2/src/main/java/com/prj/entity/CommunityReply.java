package com.prj.entity;

import java.time.LocalDateTime;

import com.prj.dto.CommunityReplyDTO;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "COMMUNITY_REPLY")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityReply {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "COMMUNITY_REPLY_SEQ")
    @SequenceGenerator(name="COMMUNITY_REPLY_SEQ", 
    sequenceName = "COMMUNITY_REPLY_SEQ", allocationSize = 1)
	 @Column(name = "REPLY_IDX")
	private Long replyIdx;   

	@ManyToOne
    @JoinColumn(name = "COMMUNITY_IDX", referencedColumnName = "COMMUNITY_IDX")
    private Community community;
	
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX")
	private Users users;		
	
    @Column(name = "REPLY_CONTENT", nullable = false)
    private String replyContent;

    @Column(name = "REPLY_REGDATE", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    private LocalDateTime  replyRegdate;

    @Column(name = "REPLY_LIKE")
    private Integer replyLike;
    
    @Column(name = "CAREER_SELF")
    private String careerSelf;
    
	@ManyToOne
    @JoinColumn(name = "DUTY_ID", referencedColumnName = "DUTY_ID")	
    private Duty duty;

	public CommunityReplyDTO toDto() {
		CommunityReplyDTO crdto = new CommunityReplyDTO();
		crdto.setReplyIdx(this.replyIdx);
		crdto.setCommunityIdx(community.getCommunityIdx());
		crdto.setUserIdx(users.getUser_idx()); 
		crdto.setReplyContent(this.replyContent);
		crdto.setReplyRegdate(this.replyRegdate); 
		crdto.setReplyLike(this.replyLike); 
		crdto.setCareerSelf(this.careerSelf);
		crdto.setDutyId(duty.getDutyId());
	
		
		return crdto;
	}


  


    
}
