package com.hx.hxjob.model;

import lombok.Getter;
import lombok.Setter;

/*
 * @program: smartBR
 * @description: 评论
 * @author: yu.God
 * @create: 2019-05-05 09:23
 **/
@Getter
@Setter
public class OrganizationRemark {

    private int id;
    private int memberid;
    private String orgcode;
    private String orgname;
    private String memberPhoto;
    private String city;
    private String workyear;
    private String postStatus;
    private float salaryPreTax;
    private String otherBenefit;
    private String yearEndMoney;
    private int growth;
    private int  workload;
    private int  culturalContext;
    private int satisfaction;
    private int treatment;
    private String theme;
    private String writingEvaluation;
    private String evaluateLabel;
    private String imgUpload;
    private String createtime;
    private String nickname;
    private String fullname;
    private String username;
    private String headPhoto;
    private String name;
    private String tags;
    private Boolean whetherRemark;
    private int remarkCount;
    private String headPeopleId;
    private String footPeopleId;
    private String replyData;
    private String puplishTime;
    private String logo;

}
