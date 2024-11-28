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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "NOTICE")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"community", "users","post"}) 
public class Notice {


	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "NOTICE_SEQ")
    @SequenceGenerator(name="NOTICE_SEQ", 
    sequenceName = "NOTICE_SEQ", allocationSize = 1)
	 @Column(name = "NOTICE_IDX")
	private Long noticeIdx;  
 
	@ManyToOne
    @JoinColumn(name = "POST_IDX", referencedColumnName = "POST_IDX")
    private Post post;
	
    @Column(name = "RESUME_IDX")
    private Long resumeIdx;
    
    @Column(name = "ANNOUNCEMENT_IDX")
    private Long announcementIdx;
    
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX")
	private Users users;	
	
    @Column(name = "SENDER_IDX")
    private Long senderIdx;    
    
    @Column(name = "COMPANY_IDX")
    private Long companyIdx;    
    
	@ManyToOne
    @JoinColumn(name = "COMMUNITY_IDX", referencedColumnName = "COMMUNITY_IDX")
    private Community community;
	
	@ManyToOne
	@JoinColumn(name = "REPLY_IDX", referencedColumnName = "REPLY_IDX")
	private CommunityReply communityReply;

    @Column(name = "RECIEVEDDATE", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    private LocalDateTime  recieveddate;

    @Column(name = "TYPE")
    private String type;
    
    @Column(name = "STATE")
    private String state;
    
    @Column(name = "NOTIFICATION")
    private String notification;
    
    @Column(name = "SUBNOTI")
    private String subnoti;


	public Notice(Users user, CommunityReply reply, LocalDateTime cdate, String type, String notification, String subnoti, Community community,Long senderIdx) {

		this.users = user;
		this.communityReply =reply;
		this.recieveddate =cdate;
		this.type= type;
		this.notification= notification;
		this.subnoti= subnoti;
		this.state = "0";
		this.community = community;
		this.senderIdx = senderIdx;
				
	}


    
}
