package com.hx.hxjob.controller.manager;

import com.hx.hxjob.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description: 会员mvc
 * @created: 2020/01/19 14:17
 */
@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("list")
    /**
     * @Description 显示会员列表
     * @Params []
     * @Return java.lang.String
     * @Date 2020/1/19 14:18
     **/
    public String list() {
        return "manager/member";
    }

    @RequestMapping("memberPage")
    @ResponseBody
    /**
    * @Description 显示会员列表页
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:20
    **/
    public Map<String, Object> memberPage(@RequestParam() Map<String, String> params) {
        return this.memberService.getMemberPage(params);
    }

    @RequestMapping("resetPassword/{memberid}")
    @ResponseBody
    /**
    * @Description 重置会员密码
    * @Params [memberid]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:27
    **/
    public Map<String,Object> resetPassword(@PathVariable String memberid) {
        return this.memberService.resetPassword(memberid);
    }

    @RequestMapping("changeStatus")
    @ResponseBody
    /**
    * @Description 改变状态
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:30
    **/
    public Map<String,Object> changeStatus(@RequestParam()Map<String,String> params) {
        return this.memberService.changeStatus(params);
    }

}
