package com.prj.post.dto;

import com.prj.entity.Post;
import com.prj.entity.PostClick;
import com.prj.entity.Users;

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
   
    
    public PostClick toEntitiy(Post post, Users user) {
    	PostClick pc = new PostClick();
    	  pc.setPost(post);         // post_idx에 해당하는 Post 엔티티 설정
          pc.setUsers(user);   		
    	return pc;
    }
    
    
}
