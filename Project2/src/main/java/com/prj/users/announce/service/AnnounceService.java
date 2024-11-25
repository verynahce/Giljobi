package com.prj.users.announce.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.users.announce.dao.AnnounceDao;

@Service
public class AnnounceService {

    @Autowired
    private AnnounceDao announceDao;

    public void sendAnnounce(Announce announce) {
    	announceDao.save(announce);
    }
}