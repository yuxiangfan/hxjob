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

    String getMemberIdByVal(@Param(value = "val") String val);

    void setReplyOk(@Param(value = "val") String val, @Param(value = "memberId") String memberId, @Param(value = "code") String code, @Param(value = "replyData") String replyData, @Param(value = "fid") String fid);

    Member getMemberJobByUsername(String username);

    SavePositionMember getPositionAndMember(@Param(value = "code") String code, @Param(value = "memberId") String memberId);

    int deletePositionAndMember(@Param(value = "code") String code, @Param(value = "memberId") String memberId);

    int savePositionAndMember(@Param(value = "code") String code, @Param(value = "memberId") String memberId);

    void deleteCollectOrg(@Param(value = "code") String code, @Param(value = "memberId") String memberId);

    List<OrganizationRemark> getRemark(String id);

    void deleteRemark(@Param(value = "id") String id);

    void deleteRemarkSave(String id);

    List<Member> alreadyPraise(@Param(value = "id") String id);

    List<organizationReply> letter(@Param(value = "id") String id);

    void clearLetter(String id);

    ArticleCommandAttention getAdviceWhether(@Param(value = "id") String id, @Param(value = "memberId") String memberId);

    SaveRemarkMember getPraiseRemark(@Param(value = "id") String id, @Param(value = "memberId") String memberId);

    int deletePraiseRemark(@Param(value = "id") String id, @Param(value = "memberId") String memberId);

    Member getMemberById(@Param(value = "memberId") String memberId);

    int savePraiseRemark(@Param(value = "id") String id, @Param(value = "nickname") String nickname, @Param(value = "memberId") String memberId);

    Organization getEveryoneSay(String orgcode);

    List<Organization> orgGet(@Param(value = "id") Integer id);

    List<Position> posGet(@Param(value = "id") Integer id);

    List<ApplyCalendar> getApplyCalendar();

    List<SignCalendar> applyList(String code);

    List<ExamCalendar> examList(String code);

    List<Download> downList(Map<String, String> params);

    int downListCount(Map<String, String> params);

    Member getLogin( @Param("username") String username,@Param("userpwd") String userpwd);
}
