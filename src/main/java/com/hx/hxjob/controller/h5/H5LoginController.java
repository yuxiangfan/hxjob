package com.hx.hxjob.controller.h5;

import com.hx.hxjob.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("hm")
public class H5LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("login")
    public String login() {
        return "pcH5Plus/login";
    }

    @RequestMapping("register")
    public String register() {
        return "pcH5Plus/register";
    }

    @RequestMapping(value = "logining", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> logining(@RequestParam() Map<String, String> params, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        return this.loginService.memberLogin(params, session,request,response);
    }

    @RequestMapping(value = "registering", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> registering(@RequestParam() Map<String, String> params, HttpSession session) {
        return this.loginService.memberRegister(params, session);
    }

}
