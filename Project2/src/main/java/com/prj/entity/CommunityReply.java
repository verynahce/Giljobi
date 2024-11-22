package com.prj.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
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
	private Long reply_idx;   

	@ManyToOne
    @JoinColumn(name = "COMMUNITY_IDX", referencedColumnName = "COMMUNITY_IDX")
    private Community communityIdx;
	
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX")
	private Users users;		
	
    @Column(name = "REPLY_CONTENT", nullable = false)
    private String replyContent;

    @Column(name = "REPLY_REGDATE", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date replyRegdate;

    @Column(name = "REPLY_LIKE")
    private Integer replyLike;
    
    @Column(name = "CAREER_SELF")
    private String careerSelf;
    
    @Column(name = "DUTY_ID")
    private Integer dutyId;
  


    
}
