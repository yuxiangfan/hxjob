package com.hx.hxjob.model;
/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-05-07 18:01
 **/

public class ArticleCommandAttention {
    private int id;
    private int commandid;
    private int memberid;
    private String createtime;
    private boolean adviceWhether;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCommandid() {
        return commandid;
    }

    public void setCommandid(int commandid) {
        this.commandid = commandid;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public boolean isAdviceWhether() {
        return adviceWhether;
    }

    public void setAdviceWhether(boolean adviceWhether) {
        this.adviceWhether = adviceWhether;
    }
}
