package com.hx.hxjob.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Organization {

    private int id;
    private String code;
    private String fullname;
    private String shortname;
    private String logo;
    private String orgPeopleNumber;
    private String brief;
    private String description;
    private String city;
    private String cityname;
    private String industry;
    private int treatment;

    /*考试相关*/
    private String applyInto;
    private String selectData;
    private String examBeforConsult;
    private String examStatus;
    private String title;
    private String content;
    private String startTime;
    private String endTime;
    private String examTitle;
    private String examContent;
    private String examInto;
    private String applyCode;
    private String examTime;
    private String orgCode;

    private String industryname;
    private String tags;
    private String salary;
    private String grade;
    private String score;
    private int creater;
    private String createtime;
    private String publishtime;
    private String shelftime;
    private int updater;
    private String updatetime;
    private String sort;
    private String realName;
    private String ishot;
    private int praiseCount;
    private int commontCount;
    private int collectCount;

    private boolean praiseFlag;
    private boolean collectFlag;
    private boolean commentFlag;
    private boolean whetherLogon;

    private Member member;
    private OrganizationCollect organizationCollect;

    private String otherBenefit;
    private String evaluateLabel;
    private int growth;
    private int workload;
    private int culturalContext;
    private int satisfaction;

    private String acId;


}
