package com.prj.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "COMMUNITY")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"users","replies"})
public class Community {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "COMMUNITY_SEQ")
    @SequenceGenerator(name="COMMUNITY_SEQ", 
    sequenceName = "COMMUNITY_SEQ", allocationSize = 1)
	 @Column(name = "COMMUNITY_IDX")
	private Long communityIdx;   
	
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX", nullable = false)
	private Users users;	
	@ManyToOne
    @JoinColumn(name = "IMAGE_IDX", referencedColumnName = "IMAGE_IDX")
    private Imagefile imagefile;
	@ManyToOne
    @JoinColumn(name = "DUTY_ID", referencedColumnName = "DUTY_ID")	
    private Duty duty;

    @Column(name = "COM_TITLE", nullable = false)
    private String comTitle;

    @Column(name = "COM_CONTENT", nullable = false)
    private String comContent;

    @Column(name = "COM_HIT", columnDefinition = "integer default 0")
    private Integer comHit;

    @Column(name = "COM_REGDATE", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date comRegdate;

    @Column(name = "COM_LIKE", columnDefinition = "integer default 0")
    private Integer comLike;
    
    @OneToMany(mappedBy = "community", fetch = FetchType.LAZY)
    private List<CommunityReply> replies;

	public void patchOn() {	
	this.comLike = comLike+1;
	}

	public void patchOff() {
		this.comLike = comLike-1;
		
	}
	public void updateHit() {
		this.comHit = comHit+1;
		
	}
}
