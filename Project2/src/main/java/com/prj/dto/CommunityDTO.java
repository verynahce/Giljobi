package com.prj.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityDTO {

    private Long communityIdx;
    private Long userIdx;
    private Long imageIdx;
    private String dutyName;
    private String comTitle;
    private String comContent;
    private int comHit;
    private int comRegdate;
    private int comLike;
    
    
}
