package com.hx.hxjob.dao;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.model.OrganizationRemark;
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

    public List<Member> getMemberPage(Map<String, String> parmas);

    int getMemberPageCount(Map<String, String> parmas);

    public int updateMemberPassword(@Param(value = "memberid") String memberid, @Param(value = "password") String password);

    int changeStatus(Map<String, String> parmas);

}
