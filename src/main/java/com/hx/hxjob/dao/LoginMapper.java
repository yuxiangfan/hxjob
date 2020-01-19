package com.hx.hxjob.dao;

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
}
