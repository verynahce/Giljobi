package com.green.dto;

import com.green.entity.Post;
import com.green.entity.PostClick;
import com.green.entity.Users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostClickDTO {
    private Long pc_idx;
    private Long post_idx;
    private Long user_idx;
   
    
    // 엔티티 변환 로직
    public PostClick toEntitiy(Post post, Users user) {
    	PostClick pc = new PostClick();
    	  pc.setPost(post);         // post_idx에 해당하는 Post 엔티티 설정
          pc.setUsers(user);   		
    	return pc;
    }
    
    
}
