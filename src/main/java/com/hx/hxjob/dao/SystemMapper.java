package com.hx.hxjob.dao;

import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/19 09:41
 */
@Mapper
public interface SystemMapper {
    List<SystemRole> getSystemRole(Map<String, String> params);

    List<Map<String, Object>> getSystemResources();

    int getSystemRoleCount(Map<String, String> params);

    void addNewRole(Map<String, Object> params);

    void addRoleResources(@Param(value = "roleid") String roleid, @Param(value = "ids") String[] ids);

    SystemRole getRoleById(String roleid);

    void editRole(Map<String, Object> params);

    void deleteRoleResources(String roleid);

    void changeStatus(@Param(value = "roleid") String roleid, @Param(value = "status") String status);

    List<SystemUser> getSystemUser(Map<String, String> params);

    int getSystemUserCount(Map<String, String> params);

    void addAccount(Map<String, Object> params);

    void addAccountRole(@Param(value = "userid") String userid, @Param(value = "roleid") String roleid);

    SystemUser getSystemUserById(String userid);

    public void editAccount(Map<String,Object> params);

     void editAccountRole(@Param(value="userid")String userid,@Param(value="roleid")String roleid);

    void deleteAccount(String userid);

    public void changeAccount(@Param(value="userid")String userid,@Param(value="status")String status);
}
