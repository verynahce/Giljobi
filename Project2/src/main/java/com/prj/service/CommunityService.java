package com.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.entity.Community;
import com.prj.entity.Users;
import com.prj.repository.CommunityRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommunityService {
	
	@Autowired
	private CommunityRepository cRepository;

	public List<Community> getCommunityList() {
		List<Community> CommunityList =  cRepository.findAll();
		return CommunityList;
	}

	public Community getCommunity(Long communityIdx) {
	    if (communityIdx == null) {
	        throw new IllegalArgumentException("Community ID는 null일 수 없습니다.");
	    }
	    return cRepository.findById(communityIdx).orElse(null);
	}

	public void insertCoummunity(Community community) {
		cRepository.save(community);
		
	}

	public Users getUser(Long userIdx) {
		
		return null;
	}
	
		   

}