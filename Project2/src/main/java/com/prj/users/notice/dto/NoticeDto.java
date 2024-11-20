package com.prj.users.notice.dto;

import com.prj.users.notice.service.Notice;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDto {

        private Integer notice_idx;
        private int post_idx;
        private int resume_idx;
        private int announcement_idx;
        private int company_idx;
        private Integer user_idx;
        private boolean state;
        private String notification;
        private String subnoti;
        private String recieveddate;

    public NoticeDto(Notice notice) {
        this.user_idx = notice.getUseridx();
        this.notification = notice.getNotification();
        this.subnoti = notice.getSubnoti();
        this.state = notice.isState();
        this.recieveddate = notice.getRecieveddate();
    }
}