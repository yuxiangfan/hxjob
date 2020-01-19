package com.hx.hxjob.dao;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Organization;
import com.hx.hxjob.model.OrganizationRemark;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 16:52
 */
public interface OrganizationMapper {
    List<Organization> getOrganizations();

    List<City> getCities();

    List<Industry> getIndustries();

    List<Organization> getOrganizationsPage(Map<String, String> params);

    int getOrganizationsPageCount(Map<String, String> params);

     Organization getOrganizationByFullNameAndShortName(@Param(value = "fullname") String fullname, @Param(value = "shortname") String shortname);

    void addNewOrg(Map<String, Object> params);

    Organization getOrganizationByCode(String code);

    void editOrg(Map<String, Object> params);

    void deleteOrg(String code);

    void deleteOrgPosition(String code);

    List<OrganizationRemark> getCommentPage(Map<String, String> params);

    int getCommentPageCount(Map<String, String> params);

    void addNewComment(Map<String, Object> params);

    OrganizationRemark toEditCommentById(String id);

    void editComment(Map<String, Object> params);

    void deleteComment(String id);

    void insertOrgExcel(@Param("list") List<Organization> list);
}
