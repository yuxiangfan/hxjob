package com.hx.hxjob.model;

import java.util.List;

public class Member {

    private int id;

    private String desEntryId;

    private String username;

    private String password;

    private String nickname;

    private String mobile;

    private int score;

    private String lastlogintime;

    private String createtime;

    private String status;

    private String birthday;

    private String gender;

    private String address;

    private String mail;

    private String headPhoto;

    private String likeIndustry;

    private String likeJob;

    private String introduce;

    private String jobStatus;

    private String remarkTime;

    private String fullname;


    private List<OrganizationPraise> organizationPraises;

    private List<OrganizationComment> organizationComments;

    private List<OrganizationRemark> organizationRemarks;

    private OrganizationRemark organizationRemark;

    private String remarkCode;

    private List<OrganizationCollect> organizationCollects;

    private List<Organization> organizations;

    private List<ACCollect> aCCollects;

    private List<Position> positions;

    private List<SavePositionMember> savePositionMembers;

    private List<ArticleCommandAttention> articleCommandAttention;

    private List<SaveRemarkMember> saveRemarkMembers;

    public String getLikeIndustry() {
        return likeIndustry;
    }

    public void setLikeIndustry(String likeIndustry) {
        this.likeIndustry = likeIndustry;
    }

    public String getRemarkTime() {
        return remarkTime;
    }

    public void setRemarkTime(String remarkTime) {
        this.remarkTime = remarkTime;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesEntryId() {
        return desEntryId;
    }

    public void setDesEntryId(String desEntryId) {
        this.desEntryId = desEntryId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getLastlogintime() {
        return lastlogintime == null ? "" : lastlogintime;
    }

    public void setLastlogintime(String lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrganizationPraise> getOrganizationPraises() {
        return organizationPraises;
    }

    public void setOrganizationPraises(List<OrganizationPraise> organizationPraises) {
        this.organizationPraises = organizationPraises;
    }

    public List<OrganizationComment> getOrganizationComments() {
        return organizationComments;
    }

    public void setOrganizationComments(List<OrganizationComment> organizationComments) {
        this.organizationComments = organizationComments;
    }

    public List<OrganizationCollect> getOrganizationCollects() {
        return organizationCollects;
    }

    public void setOrganizationCollects(List<OrganizationCollect> organizationCollects) {
        this.organizationCollects = organizationCollects;
    }

    public List<ACCollect> getaCCollects() {
        return aCCollects;
    }

    public void setaCCollects(List<ACCollect> aCCollects) {
        this.aCCollects = aCCollects;
    }


    public List<Position> getPositions() {
        return positions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }

    public List<SavePositionMember> getSavePositionMembers() {
        return savePositionMembers;
    }

    public void setSavePositionMembers(List<SavePositionMember> savePositionMembers) {
        this.savePositionMembers = savePositionMembers;
    }

    public List<Organization> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    public List<ArticleCommandAttention> getArticleCommandAttention() {
        return articleCommandAttention;
    }

    public void setArticleCommandAttention(List<ArticleCommandAttention> articleCommandAttention) {
        this.articleCommandAttention = articleCommandAttention;
    }

    public List<OrganizationRemark> getOrganizationRemarks() {
        return organizationRemarks;
    }

    public void setOrganizationRemarks(List<OrganizationRemark> organizationRemarks) {
        this.organizationRemarks = organizationRemarks;
    }

    public List<SaveRemarkMember> getSaveRemarkMembers() {
        return saveRemarkMembers;
    }

    public void setSaveRemarkMembers(List<SaveRemarkMember> saveRemarkMembers) {
        this.saveRemarkMembers = saveRemarkMembers;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }


    public String getHeadPhoto() {
        return headPhoto;
    }

    public void setHeadPhoto(String headPhoto) {
        this.headPhoto = headPhoto;
    }

    public String getLikeJob() {
        return likeJob;
    }

    public void setLikeJob(String likeJob) {
        this.likeJob = likeJob;
    }

    public OrganizationRemark getOrganizationRemark() {
        return organizationRemark;
    }

    public void setOrganizationRemark(OrganizationRemark organizationRemark) {
        this.organizationRemark = organizationRemark;
    }

    public String getRemarkCode() {
        return remarkCode;
    }

    public void setRemarkCode(String remarkCode) {
        this.remarkCode = remarkCode;
    }
}
