package com.hx.hxjob.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Download {
    private int id;
    private String title;
    private String link;
    private String code;
    private String validTime;
    private String pay;
    private String member;
    private String createTime;
}
