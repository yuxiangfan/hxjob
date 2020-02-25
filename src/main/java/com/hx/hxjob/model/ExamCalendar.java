package com.hx.hxjob.model;
/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-05-22 14:24
 **/

public class ExamCalendar {
    private int id;
    private String orgCode;
    private String examCode;
    private String title;
    private String content;
    private String startTime;
    private String examTime;
    private String canExamInto;
    private String selectData;
    private String examBeforeConsult;
    private String fullname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getExamCode() {
        return examCode;
    }

    public void setExamCode(String examCode) {
        this.examCode = examCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getCanExamInto() {
        return canExamInto;
    }

    public void setCanExamInto(String canExamInto) {
        this.canExamInto = canExamInto;
    }

    public String getSelectData() {
        return selectData;
    }

    public void setSelectData(String selectData) {
        this.selectData = selectData;
    }

    public String getExamBeforeConsult() {
        return examBeforeConsult;
    }

    public void setExamBeforeConsult(String examBeforeConsult) {
        this.examBeforeConsult = examBeforeConsult;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }
}
