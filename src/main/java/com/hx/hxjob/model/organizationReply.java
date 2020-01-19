package com.hx.hxjob.model;
/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-06-01 08:57
 **/

public class organizationReply {
    private String id;
    private String orgCode;
    private String memberId;
    private String headPeopleId;
    private String footPeopleId;
    private String replyData;
    private String publishTime;
    private String nickname;
    private String fullname;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }


    public String getFootPeopleId() {
        return footPeopleId;
    }

    public void setFootPeopleId(String footPeopleId) {
        this.footPeopleId = footPeopleId;
    }

    public String getReplyData() {
        return replyData;
    }

    public void setReplyData(String replyData) {
        this.replyData = replyData;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }



    public String getHeadPeopleId() {
        return headPeopleId;
    }

    public void setHeadPeopleId(String headPeopleId) {
        this.headPeopleId = headPeopleId;
    }
}
