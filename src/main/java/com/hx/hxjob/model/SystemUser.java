package com.hx.hxjob.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SystemUser {
    private int id;

    private String desEntryId;

    private String userName;

    private String password;

    private String realName;

    private String mobile;

    private int siteid;

    private String title;

    private String status;

    private Date createtime;

    private Date updatetime;

    private Date lastLogintime;

    private String imageCode;//验证码

    private int roleid;

    private String roleDesEntryId;

    private String roleName;

    private SystemRole systemRole;
}