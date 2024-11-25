package com.green.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.prj.entity.PostClick;



public interface PostClickRepository extends JpaRepository<PostClick, Long> {
	 
	
	@Query("SELECT p FROM PostClick p WHERE p.users.user_idx = :user_idx AND p.post.post_idx = :post_idx")
	PostClick findByIdPCtarget(@Param("user_idx") int user_idx, @Param("post_idx")long post_idx);
   
	

}
