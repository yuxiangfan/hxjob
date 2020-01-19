package com.hx.hxjob.service;

import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.enums.KeyEnum;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.MD5;
import com.hx.hxjob.util.PageUtil;
import com.hx.hxjob.util.RandomUtils;
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
}
