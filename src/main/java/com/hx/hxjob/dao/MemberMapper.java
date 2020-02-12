package com.hx.hxjob.dao;

import com.hx.hxjob.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 20:27
 */
@Mapper
public interface MemberMapper {
    List<City> getCityOfJob();

    List<OrganizationRemark> getOrganizationGrade(String code);

    Member getMember(@Param(value = "username") String username);

    List<Industry> getIndustriesOfJob();

    List<Member> getMemberPage(Map<String, String> parmas);

    int getMemberPageCount(Map<String, String> parmas);

    int updateMemberPassword(@Param(value = "memberid") String memberid, @Param(value = "password") String password);

    int changeStatus(Map<String, String> parmas);

    /*PC——>获取用户表单*/
    Member getPersonForm(@Param(value = "id") String id);

    void addHeadPhoto(Map<String, Object> params);

    /*PC——>设置二寸照片*/
    void setHeadPhoto(@Param("headPhoto") String headPhoto, @Param("id") String id);

    /*PC——>PC用户登录*/
    Member getMemberByUsername(String username);

    /*PC——>设置最后一次登录时间*/
    void setLastLogintime(String username);

    /*PC——>用户注册*/
    void insertMember(Member member);

    /*PC——>获得收藏*/
    List<Position> getCollect(@Param(value = "id") String id);

    /*PC——>获得收藏*/
    List<Organization> getCollectOrg(String valueOf);
}
