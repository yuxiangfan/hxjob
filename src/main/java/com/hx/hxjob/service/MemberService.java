package com.hx.hxjob.service;

import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.enums.KeyEnum;
import com.hx.hxjob.model.*;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.MD5;
import com.hx.hxjob.util.PageUtil;
import com.hx.hxjob.util.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description: 会员
 * @created: 2020/01/19 14:18
 */
@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    public Map<String, Object> getMemberPage(Map<String, String> params){
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        List<Member> members = this.memberMapper.getMemberPage(params);
        for (Member member : members) {
            try {
                member.setDesEntryId(Des.encrypt(member.getId() + ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
            member.setId(0);
        }
        result.put("rows", members);
        result.put("total", this.memberMapper.getMemberPageCount(params));
        return result;
    }

    public Map<String, Object> resetPassword(String memberid) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            memberid = Des.decrypt(memberid);
            String newpassword = RandomUtils.getRandomNumber(6);
            String newpasswordAfterMd5 = MD5.MD5Encode(newpassword + KeyEnum.MD5.getKey());
            this.memberMapper.updateMemberPassword(memberid, newpasswordAfterMd5);
            result.put("code", 0);
            result.put("msg", "重设成功");
            result.put("newPassword", newpassword);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> changeStatus(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            params.put("memberid", Des.decrypt(params.get("id")));
            this.memberMapper.changeStatus(params);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Member getMemberByName(String username) {
        return this.memberMapper.getMemberByUsername(username);
    }

    public synchronized Map<String, Object> savePositionAndMember(String code, Member member) {
        HashMap<String, Object> result = new HashMap<>();
        try {
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登陆");
            } else {
                SavePositionMember savePositionMember = this.memberMapper.getPositionAndMember(code, String.valueOf(member.getId()));
                if (savePositionMember != null) {
                    this.memberMapper.deletePositionAndMember(code, String.valueOf(member.getId()));
                    result.put("code", 1);
                    result.put("msg", "取消收藏");
                } else {
                    this.memberMapper.savePositionAndMember(code, String.valueOf(member.getId()));
                    result.put("code", 0);
                    result.put("msg", "收藏成功");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> deleteSave(String code, Member member) {
        Map<String, Object> result = new HashMap<>();
        if (member != null) {
            this.memberMapper.deletePositionAndMember(code, String.valueOf(member.getId()));
        }
        result.put("code", 0);
        result.put("msg", "删除成功");
        return result;
    }

    public Map<String, Object> deleteCollectOrg(String code, Member member) {
        Map<String, Object> result = new HashMap<>();
        if (member != null) {
            this.memberMapper.deleteCollectOrg(code, String.valueOf(member.getId()));
        }
        result.put("code", 0);
        result.put("msg", "删除成功");
        return result;
    }

    public List<OrganizationRemark> getRemark(Member member) {
        List<OrganizationRemark> remarkList = this.memberMapper.getRemark(String.valueOf(member.getId()));
        return remarkList;
    }

    public Map<String, Object> deleteRemark(String id) {
        Map<String, Object> result = new HashMap<>();
        this.memberMapper.deleteRemark(id);
        /*删除收藏信息*/
        this.memberMapper.deleteRemarkSave(id);
        result.put("code", 0);
        result.put("msg", "删除成功");
        return result;
    }

    public List<Member> alreadyPraise(Member member) {
        List<Member> members = null;
        if (member != null) {
            members = this.memberMapper.alreadyPraise(String.valueOf(member.getId()));
        }
        return members;
    }

    public List<organizationReply> letter(Member member) {
        List<organizationReply> organizationReplyList = null;
        if (member != null) {
            organizationReplyList = this.memberMapper.letter(String.valueOf(member.getId()));
        }
        return organizationReplyList;
    }

    public Map<String, Object> clearLetter(String id) {
        Map<String, Object> result = new HashMap<>();
        if (id != null) {
            this.memberMapper.clearLetter(id);
            result.put("code", 0);
            result.put("msg", "清除成功");
        }
        return result;
    }

    public SavePositionMember getMenJobWhether(String code, Member member) {

        SavePositionMember savePositionMember = new SavePositionMember();

        if (member == null) {
            savePositionMember.setMenSaveJob(true);
        } else {
            savePositionMember = this.memberMapper.getPositionAndMember(code, String.valueOf(member.getId()));
            if (StringUtils.isEmpty(savePositionMember.getPositionCode())) {
                savePositionMember.setMenSaveJob(true);
            } else {
                savePositionMember.setMenSaveJob(false);
            }
        }

        return savePositionMember;
    }

    public ArticleCommandAttention getAdviceWhether(String id, Member member) {
        ArticleCommandAttention commandAttention = new ArticleCommandAttention();
        if (member == null) {
            commandAttention.setAdviceWhether(true);
        } else {
            commandAttention = this.memberMapper.getAdviceWhether(id, String.valueOf(member.getId()));
            if (commandAttention.getCommandid() == 0) {
                commandAttention.setAdviceWhether(true);
            } else {
                commandAttention.setAdviceWhether(false);
            }
        }
        return commandAttention;
    }

    public Map<String, Object> savePraiseRemark(String id, Member member) {
        HashMap<String, Object> result = new HashMap<>();
        try {
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登录");
            } else {
                SaveRemarkMember saveRemarkMember = this.memberMapper.getPraiseRemark(id, String.valueOf(member.getId()));
                if (saveRemarkMember != null) {
                    this.memberMapper.deletePraiseRemark(id, String.valueOf(member.getId()));
                    result.put("code", 1);
                    result.put("msg", "取消点赞");
                } else {
                    /*根据用户获得用户名*/
                    Member mId = this.memberMapper.getMemberById(String.valueOf(member.getId()));
                    String nickname = mId.getNickname();

                    this.memberMapper.savePraiseRemark(id, nickname, String.valueOf(member.getId()));
                    result.put("code", 0);
                    result.put("msg", "点赞成功");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "您已取消收藏");
        }

        return result;
    }

    public Organization everyoneSay(String orgcode, Member member) {
        Organization organization = memberMapper.getEveryoneSay(orgcode);
        System.out.println(organization);
        return organization;
    }

    public List<Organization> orgGet(Integer id) {
        HashMap<String, Object> result = new HashMap<>();
        if (id == null) {
            result.put("code", -9);
            result.put("msg", "用户未登陆");
        }
        List<Organization> organizations = memberMapper.orgGet(id);
        return organizations;
    }

    public List<Position> posGet(Integer id) {
        List<Position> positions = memberMapper.posGet(id);
        return positions;
    }

    public Map<String, Object> getExamCalendar(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        List<ApplyCalendar> applyCalendarList = this.memberMapper.getApplyCalendar();
        for (ApplyCalendar applyCalendar : applyCalendarList) {
            /* 判断报名状态（未发布）*/
            if (applyCalendar.getExamStatus() != 1) {
                applyCalendar.setExamStartTime(null);
                applyCalendar.setExamEndTime(null);
                applyCalendar.setExamTitle(null);
            }
        }
        if (applyCalendarList == null || applyCalendarList.size() == 0) {
            result.put("code", -1);
            result.put("msg", "获取考试内容失败！");
        } else {
            result.put("applyList", applyCalendarList);
        }
        return result;
    }

    public List<SignCalendar> applyList(String code) {
        List<SignCalendar> list = this.memberMapper.applyList(code);
        return list;
    }

    public List<ExamCalendar> examList(String m1) {
        List<ExamCalendar> list = this.memberMapper.examList(m1);
        return list;
    }

    public Map<String, Object> downList(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        PageUtil.dealPageParamForLayer(params);
        List<Download> list = this.memberMapper.downList(params);
        result.put("rows", list);
        result.put("total", this.memberMapper.downListCount(params));
        return result;
    }
}
