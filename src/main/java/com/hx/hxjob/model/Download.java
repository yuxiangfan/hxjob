package com.hx.hxjob.model;

import lombok.Getter;
import lombok.Setter;

/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-07-06 15:09
 **/
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
