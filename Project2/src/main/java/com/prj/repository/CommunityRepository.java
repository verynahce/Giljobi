package com.prj.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prj.entity.Community;
import com.prj.entity.Users;



public interface CommunityRepository extends JpaRepository<Community, Long> {
	 
	@Override
	ArrayList<Community> findAll();

	List<Community> findByUsers(Users user);
   

}
