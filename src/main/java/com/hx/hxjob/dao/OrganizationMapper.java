package com.hx.hxjob.dao;

import com.hx.hxjob.model.*;
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

    public List<City> getCitiesPage(Map<String, String> params);

    public int getCitiesPageCount(Map<String, String> params);

    City getCityByName(String name);

    void addCity(City city);

    City getCityById(String cid);

    void editCity(City city);

    void deleteCity(String cid);

    List<Industry> getIndustriesPage(Map<String, String> params);

    int getIndustriesPageCount(Map<String, String> params);

    Industry getIndustryByName(String cityName);

    void addIndustry(Industry industry);

    Industry getIndustryById(String cid);

    void editIndustry(Industry industry);

    void deleteIndustry(String cid);

    String getLastOrgCode();

    List<Organization> getPcOrganizations(Map<String, String> params);

    int getPcOrganizationsCount(Map<String, String> params);

    List<Organization> getPcHotOrganizations(Map<String, String> params);

    int getPcHotOrganizationsCount(Map<String, String> params);

    List<Organization> orgsIndexDatas(Map<String, String> params);

    public OrganizationPraise getOrganizationPraiseByCodeAndMemberid(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    public int deleteOrgPraise(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    public int addPraise(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    public OrganizationCollect getOrganizationCollectByCodeAndMemberid(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    public int deleteOrgCollect(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    public int addCollect(@Param(value = "code") String code, @Param(value = "memberid") String memberid);

    OrganizationRemark getOrganizationCommentByCodeAndMemberid(@Param(value = "orgcode") String orgcode, @Param(value = "memberid") String memberid);

    void userOrgComment(Map<String, Object> params);

    String getwhetherByName(@Param(value = "code") String code, @Param(value = "memberId") String memberId);

    List<OrganizationRemark> getOrganizationCommenIndexHot(Map<String, String> params);

    Member orgCommentsWhetherPraise(String username);

    public int getOrganizationCommentPageCount(Map<String, String> params);

    public List<OrganizationRemark> getOrganizationCommentPage(Map<String, String> params);

    List<OrganizationRemark> getOrganizationCommenRecommend(Map<String, String> params);

    List<OrganizationRemark> getOrganizationCommentPageOnJob(Map<String, String> params);

    List<OrganizationRemark> getOrganizationCommenPractice(Map<String, String> params);
}
