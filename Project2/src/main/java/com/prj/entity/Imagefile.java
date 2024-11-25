package com.prj.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "IMAGEFILE")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Imagefile {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "IMAGEFILE_SEQ")
    @SequenceGenerator(name="IMAGEFILE_SEQ", 
    sequenceName = "IMAGEFILE_SEQ", allocationSize = 1)
	 @Column(name = "IMAGE_IDX")
	private Long imageIdx;   

    @Column(name = "IMAGENAME", nullable = false)
    private String imageName;

    @Column(name = "IMAGEEXT", nullable = false)
    private String imageExt;

    @Column(name = "IMAGE_PATH", nullable = false)
    private String imagePath;

    @Column(name = "IMAGE_TYPE", nullable = false)
    private String imageType;
    
 
    
    
}
