package com.green.entity;

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
@Table(name = "COMMUNITY")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "COMMUNITY_SEQ")
    @SequenceGenerator(name="COMMUNITY_SEQ", 
    sequenceName = "COMMUNITY_SEQ", allocationSize = 1)
	 @Column(name = "COMMUNITY_IDX")
	private Long community_idx;   
	
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX", nullable = false)
	private Users users;	
	@ManyToOne
    @JoinColumn(name = "IMAGE_IDX", referencedColumnName = "IMAGE_IDX", nullable = false)
    private Imagefile imagefile;

    @Column(name = "DUTY_ID")
    private String dutyId;

    @Column(name = "COM_TITLE", nullable = false)
    private String comTitle;

    @Column(name = "COM_CONTENT", nullable = false)
    private String comContent;

    @Column(name = "COM_HIT")
    private Integer comHit;

    @Column(name = "COM_REGDATE", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date comRegdate;

    @Column(name = "COM_LIKE")
    private Integer comLike;
}
