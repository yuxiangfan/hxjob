package com.hx.hxjob.dao;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.model.OrganizationRemark;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 20:27
 */
public interface MemberMapper {
    List<City> getCityOfJob();

    List<OrganizationRemark> getOrganizationGrade(String code);

    Member getMember(@Param(value = "username") String username);

    List<Industry> getIndustriesOfJob();

}
