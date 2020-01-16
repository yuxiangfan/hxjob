package com.hx.hxjob.dao;

import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SystemUser record);

    int insertSelective(SystemUser record);

    SystemUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SystemUser record);

    int updateByPrimaryKey(SystemUser record);

    SystemUser getSystemUserByName(String trim);

    void updateSystemUserLastLoginTime(String userName);

    SystemRole getRoleResources(String userId);
}