package com.hx.hxjob.dao;

import com.hx.hxjob.model.Member;
import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/19 09:40
 */
@Mapper
public interface LoginMapper {
    public SystemUser getSystemUserByName(@Param(value = "userName") String userName);

    public SystemUser getSystemUserByUserid(@Param(value = "userid") String userid);

    public void updateSystemUserLastLoginTime(@Param(value = "userName") String userName);

    public SystemRole getRoleResources(@Param(value = "userId") String userId);

    public void changePassword(SystemUser user);


    void editPassword(Member member);
}
