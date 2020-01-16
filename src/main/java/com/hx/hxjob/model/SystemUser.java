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
    private Integer id;

    /**
    * 用户名
    */
    private String userName;

    /**
    * 密码
    */
    private String password;

    /**
    * 真实姓名
    */
    private String realName;

    /**
    * 手机号
    */
    private String mobile;

    /**
    * 状态
    */
    private String status;

    /**
    * 创建人
    */
    private Integer creater;

    /**
    * 创建时间
    */
    private Date createtime;

    /**
    * 更新人
    */
    private Integer updater;

    /**
    * 更新时间
    */
    private Date updatetime;

    /**
    * 最后一次登陆时间
    */
    private Date lastLogintime;

    private  SystemRole systemRole;
}