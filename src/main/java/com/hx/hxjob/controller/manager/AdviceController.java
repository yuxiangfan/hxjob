package com.hx.hxjob.controller.manager;

import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.AdviceService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description: 通知mvc
 * @created: 2020/01/19 15:10
 */
@Controller
@RequestMapping("advice")
public class AdviceController {
    @Autowired
    private AdviceService adviceService;
    @Autowired
    private SystemConfig systemConfig;

    @RequestMapping("list")
    /**
    * @Description 路由到通知界面
    * @Params []
    * @Return java.lang.String
    * @Date 2020/1/19 15:15
    **/
    public String adviceList() {
        return "manager/advice";
    }

    @RequestMapping("page")
    @ResponseBody
    public Map<String, Object> getAdvicePage(@RequestParam() Map<String, String> params) {
        return this.adviceService.getAdvicePage(params);
    }

    @RequestMapping("add")
    /**
    * @Description 新增通知————> 回显数据
    * @Params [model]
    * @Return java.lang.String
    * @Date 2020/1/19 15:31
    **/
    public String add(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("author", this.adviceService.getAuthor());
        return "manager/new-advice";
    }

    @RequestMapping("adding")
    @ResponseBody
    /**
    * @Description 新增通知添加功能
    * @Params [params, image, session, request]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 15:39
    **/
    public Map<String, Object> adding(@RequestParam() Map<String, Object> params, MultipartFile image, HttpSession session, HttpServletRequest request) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.adviceService.adding(params, image, user, request);
    }
    @RequestMapping("edit/{id}")
    /**
    * @Description 修改通知———>编辑回显
    * @Params [id, model]
    * @Return java.lang.String
    * @Date 2020/1/19 15:44
    **/
    public String edit(@PathVariable String id, Model model) {
        model.addAttribute("news", this.adviceService.getAdviceById(id));
        model.addAttribute("author", this.adviceService.getAuthor());
        return "manager/new-advice";
    }
    @RequestMapping("editing")
    @ResponseBody
    /**
    * @Description 修改通知———>确认修改
    * @Params [params, image, session, request]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 15:50
    **/
    public Map<String, Object> editing(@RequestParam() Map<String, Object> params, MultipartFile image, HttpSession session, HttpServletRequest request) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.adviceService.editing(params, image, user,request);
    }
    @RequestMapping("deleteAdvice/{id}")
    @ResponseBody
    /**
    * @Description 删除通知
    * @Params [id, session]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 15:54
    **/
    public Map<String, Object> deleteAdvice(@PathVariable String id, HttpSession session) {
        return this.adviceService.delete(id);
    }
}
