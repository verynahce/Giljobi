package com.prj.users.notice.service;

public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String subnoti) {
        super(subnoti);
    }
}