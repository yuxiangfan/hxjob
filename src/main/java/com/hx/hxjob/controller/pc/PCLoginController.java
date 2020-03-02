package com.hx.hxjob.controller.pc;

import com.hx.hxjob.model.Member;
import com.hx.hxjob.model.Organization;
import com.hx.hxjob.model.Position;
import com.hx.hxjob.service.LoginService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.pc
 * @description:
 * @created: 2020/01/20 09:26
 */
@Controller
@RequestMapping("pcm")
public class PCLoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping("login")
    public String login() {
        return "pcPlus/login";
    }

    @RequestMapping("register")
    public String register() {
        return "pcPlus/registered";
    }

    /**
    * @Description 缓存中拿用户登录session
    * @Params [session]
    * @Return com.hx.hxjob.model.Member
    * @Date 2020/1/20 9:28
    **/
    private Member getMember(HttpSession session) {
        Object obj = session.getAttribute(Constant.MEMBER);
        if (obj == null) {
            return null;
        } else {
            return (Member) obj;
        }
    }

    @RequestMapping("personCenter")
    /*
    * @Description 个人中心页，回显头像，密码，表单
    * @Params [model, session]
    * @Return java.lang.String
    * @Date 2020/1/20 9:29
    */
    public String personCenter(Model model, HttpSession session) {
        Member member = this.getMember(session);
        /*回显头像，密码，表单*/
        model.addAttribute("personForm", this.loginService.getPersonForm(member));
        return "pcPlus/personalcenter";
    }
    @RequestMapping("addHeadPhotp/{id}")
    @ResponseBody
    /*
     @Description 更新个人中心页数据
    * @Params [params, session, request]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/20 9:37
    */
    public Map<String, Object> addHeadPhoTp(@RequestParam Map<String, String> params, HttpSession session, HttpServletRequest request) {
        Member member = this.getMember(session);
        return this.loginService.addHeadPhoto(params, member, request);
    }
    @RequestMapping("setHeadPhoto/{id}")
    @ResponseBody
    /**
    * @Description 设置大头照
    * @Params [file, id, session, request]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/20 9:48
    **/
    public Map<String, Object> setHeadPhoto(MultipartFile file, @PathVariable String id, HttpSession session, HttpServletRequest request) {
        Member member = this.getMember(session);
        return this.loginService.setHeadPhoto(file, id, member, request);
    }

    @RequestMapping(value = "logining", method = RequestMethod.POST)
    @ResponseBody
    /**
    * @Description 用户登录
    * @Params [params, session, request, response]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/20 10:06
    **/
    public Map<String, Object> logining(@RequestParam() Map<String, String> params, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        return this.loginService.memberLogin(params, session, request, response);
    }
    @RequestMapping(value = "registering", method = RequestMethod.POST)
    @ResponseBody
    /**
    * @Description 用户注册
    * @Params [params, session]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/20 10:27
    **/
    public Map<String, Object> registering(@RequestParam() Map<String, String> params, HttpSession session) {
        return this.loginService.memberRegister(params, session);
    }

    @RequestMapping(value = "editPassword", method = RequestMethod.POST)
    @ResponseBody
    /**
    * @Description 用户修改密码
    * @Params [params, session]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/20 10:35
    **/
    public Map<String, Object> editPassword(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.loginService.editPassword(params, member);
    }
    /**
    * @Description 用户获得收藏信息
    * @Params [params, session]
    * @Return java.util.List<com.hx.hxjob.model.Position>
    * @Date 2020/1/20 10:50
    **/
    @RequestMapping(value = "getCollect", method = RequestMethod.POST)
    @ResponseBody
    public List<Position> getCollect(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.loginService.getCollect(params, member);
    }
    /**
    * @Description 用户获得机构信息
    * @Params [params, session]
    * @Return java.util.List<com.hx.hxjob.model.Organization>
    * @Date 2020/1/20 11:07
    **/
    @RequestMapping(value = "getCollectOrg", method = RequestMethod.POST)
    @ResponseBody
    public List<Organization> getCollectOrg(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.loginService.getCollectOrg(params, member);
    }
     /**
     * @Description 用户登出操作
     * @Params [params, request]
     * @Return java.lang.String
     * @Date 2020/1/20 11:14
     **/
    @RequestMapping("personGoOut")
    public String personGoOut(@RequestParam() Map<String, String> params, org.apache.catalina.servlet4preview.http.HttpServletRequest request) {
        request.getSession().invalidate();
        return "pcPlus/login";
    }
}
