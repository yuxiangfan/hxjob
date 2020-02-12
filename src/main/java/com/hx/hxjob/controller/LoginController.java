package com.hx.hxjob.controller;

import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.LoginService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller
 * @description: 登录Mvc
 * @created: 2020/01/15 12:44
 */
@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private SystemConfig systemConfig;

    @RequestMapping("login")
    public String toLoginPage(Model model) {
        return "login";
    }

    @RequestMapping(value = "logining", method = RequestMethod.POST)
    public String logining(SystemUser systemUser, HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        model.addAttribute("systemConfig", systemConfig);
        /*检查验证码*/
        if (systemUser == null) {
            return "error";
        }
        /*校验账号*/
        Map<String, Object> accountCheck = this.loginService.systemUserLogining(systemUser);
        if (0 == (int) accountCheck.get("code")) {
            /*获取管理员用户资源*/
            SystemUser user = (SystemUser) accountCheck.get(Constant.SYSTEM_USER);
            SystemRole role = this.loginService.getSystemRoleResources(String.valueOf(user.getId()));
            if (role == null) {
                return "error";
            }
            user.setSystemRole(role);
            session.setAttribute(Constant.SYSTEM_USER, user);
            /*拿取第一个资源，并给予路由*/
            String firstResource = role.getSystemResources() == null ? "" :
                    (role.getSystemResources().get(0).getChildren() == null ? role.getSystemResources().get(0).getResources() :
                            role.getSystemResources().get(0).getChildren().get(0).getResources());
            session.setAttribute("systemConfig", systemConfig);
            return "redirect:" + firstResource;
        } else {
            /*登录失败，回撤到登录 */
            redirectAttributes.addFlashAttribute("msg", accountCheck.get("msg"));
            return "redirect:login";
        }
    }

    @RequestMapping("rightError")
    public String rightError() {
        return "right-error";
    }

    @RequestMapping("loginout")
    public String loginout(@RequestParam() Map<String, String> params, org.apache.catalina.servlet4preview.http.HttpServletRequest request) {
        request.getSession().invalidate();
        return "login";
    }
}
