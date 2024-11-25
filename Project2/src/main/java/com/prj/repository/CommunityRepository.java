package com.prj.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prj.entity.Community;



public interface CommunityRepository extends JpaRepository<Community, Long> {
	 
	@Override
	ArrayList<Community> findAll();
   

}
