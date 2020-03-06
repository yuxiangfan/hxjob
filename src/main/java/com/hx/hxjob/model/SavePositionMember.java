package com.hx.hxjob.model;


public class SavePositionMember {
    private int id;
    private String positionCode;
    private String memberId;
    private Boolean menSaveJob;
    private boolean whetherRemark;
    private boolean remarkCode;
    private String orgcode;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode;
    }


    public Boolean getMenSaveJob() {
        return menSaveJob;
    }

    public void setMenSaveJob(Boolean menSaveJob) {
        this.menSaveJob = menSaveJob;
    }

    public boolean isWhetherRemark() {
        return whetherRemark;
    }

    public void setWhetherRemark(boolean whetherRemark) {
        this.whetherRemark = whetherRemark;
    }

    public boolean isRemarkCode() {
        return remarkCode;
    }

    public void setRemarkCode(boolean remarkCode) {
        this.remarkCode = remarkCode;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }
}

