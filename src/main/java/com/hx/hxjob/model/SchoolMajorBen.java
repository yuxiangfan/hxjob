package com.hx.hxjob.model;
/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-05-21 19:53
 **/

public class SchoolMajorBen {
    private int id;
    private String testid;
    private String school;
    private String majorBen;
    private String schoolGrade;
    private String majorBenGrade;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTestid() {
        return testid;
    }

    public void setTestid(String testid) {
        this.testid = testid;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }



    public String getSchoolGrade() {
        return schoolGrade;
    }

    public void setSchoolGrade(String schoolGrade) {
        this.schoolGrade = schoolGrade;
    }

    public String getMajorBenGrade() {
        return majorBenGrade;
    }

    public void setMajorBenGrade(String majorBenGrade) {
        this.majorBenGrade = majorBenGrade;
    }

    public String getMajorBen() {
        return majorBen;
    }

    public void setMajorBen(String majorBen) {
        this.majorBen = majorBen;
    }
}
