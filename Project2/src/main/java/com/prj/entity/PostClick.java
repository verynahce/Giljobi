package com.prj.entity;

import com.prj.dto.PostClickDTO;

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
@Table(name = "POST_CLICK")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostClick {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "POST_CLICK_SEQ")
    @SequenceGenerator(name="POST_CLICK_SEQ", 
    sequenceName = "POST_CLICK_SEQ", allocationSize = 1)	
	private Long pc_idx;
    
	@ManyToOne
    @JoinColumn(name = "post_idx", referencedColumnName = "post_idx", nullable = false)
	private Post post;
	
	@ManyToOne
    @JoinColumn(name = "USER_IDX", referencedColumnName = "USER_IDX", nullable = false)
	private Users users;	
	
    // DTO 변환 메서드
    public PostClickDTO toDTO() {
        return new PostClickDTO(this.pc_idx,this.post.getPost_idx(),this.users.getUserIdx());
    }
	
}
