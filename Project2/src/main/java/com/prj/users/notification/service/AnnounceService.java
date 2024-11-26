package com.prj.users.notification.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.users.notification.dao.AnnounceDao;

@Service
public class AnnounceService {

    @Autowired
    private AnnounceDao announceDao;

    public void sendAnnounce(Announce announce) {
    	announceDao.save(announce);
    }
}