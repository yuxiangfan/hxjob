package com.hx.hxjob.model;

public class Position {

    private int id;
    private String decEntryId;
    private String orgcode;
    private String code;
    private String title;
    private String monSalary;
    private String experienceRequire;
    private String educationRequire;
    private String posType;
    private String type;
    private String address;
    private String workplace;
    private String jobSalary;
    private String department;
    private String rindex;
    private String ishot;
    private String posBrief;
    private String duty;
    private String positionPeopleNumber;
    private String requirement;
    private String contact;
    private int pageView;
    private int creater;
    private String createtime;
    private int updater;
    private String updatetime;
    private String publishtime;
    private String shelftime;
    private String isstar;
    private String realName;
    private String remark;
    private boolean collectJob;
    private Integer posSaveCount;

    private Organization organization;
    private SavePositionMember savePositionMember;
    private Member member;
    private Industry industry;
    private City city;

    /*总和*/
    private int count;

    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    public String getJobSalary() {
        return jobSalary;
    }

    public void setJobSalary(String jobSalary) {
        this.jobSalary = jobSalary;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDecEntryId() {
        return decEntryId;
    }

    public void setDecEntryId(String decEntryId) {
        this.decEntryId = decEntryId;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRindex() {
        return rindex;
    }

    public void setRindex(String rindex) {
        this.rindex = rindex;
    }

    public String getIshot() {
        return ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getCreater() {
        return creater;
    }

    public void setCreater(int creater) {
        this.creater = creater;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getUpdater() {
        return updater;
    }

    public void setUpdater(int updater) {
        this.updater = updater;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getShelftime() {
        return shelftime;
    }

    public void setShelftime(String shelftime) {
        this.shelftime = shelftime;
    }

    public String getIsstar() {
        return isstar;
    }

    public void setIsstar(String isstar) {
        this.isstar = isstar;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public int getPageView() {
        return pageView;
    }

    public void setPageView(int pageView) {
        this.pageView = pageView;
    }

    public Industry getIndustry() {
        return industry;
    }

    public void setIndustry(Industry industry) {
        this.industry = industry;
    }

    public SavePositionMember getSavePositionMember() {
        return savePositionMember;
    }

    public void setSavePositionMember(SavePositionMember savePositionMember) {
        this.savePositionMember = savePositionMember;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Boolean getCollectJob() {
        return collectJob;
    }

    public void setCollectJob(Boolean collectJob) {
        this.collectJob = collectJob;
    }


    public String getExperienceRequire() {
        return experienceRequire;
    }

    public void setExperienceRequire(String experienceRequire) {
        this.experienceRequire = experienceRequire;
    }

    public String getEducationRequire() {
        return educationRequire;
    }

    public void setEducationRequire(String educationRequire) {
        this.educationRequire = educationRequire;
    }

    public String getPosType() {
        return posType;
    }

    public void setPosType(String posType) {
        this.posType = posType;
    }


    public String getMonSalary() {
        return monSalary;
    }

    public void setMonSalary(String monSalary) {
        this.monSalary = monSalary;
    }

    public String getPosBrief() {
        return posBrief;
    }

    public void setPosBrief(String posBrief) {
        this.posBrief = posBrief;
    }

    public String getPositionPeopleNumber() {
        return positionPeopleNumber;
    }

    public void setPositionPeopleNumber(String positionPeopleNumber) {
        this.positionPeopleNumber = positionPeopleNumber;
    }

    public Integer getPosSaveCount() {
        return posSaveCount;
    }

    public void setPosSaveCount(Integer posSaveCount) {
        this.posSaveCount = posSaveCount;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
