package com.hx.hxjob.controller.manager;

import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.SystemService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description:
 * @created: 2020/01/19 09:35
 */
@Controller
@RequestMapping("system")
public class SystemController {
    @Autowired
    private SystemService SystemService;


    @RequestMapping("account")
    /**
     * @Description 路由到管理员权限界面
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/19 9:39
     **/
    public String account(Model model) {
        model.addAttribute("roles", this.SystemService.getSystemRole());
        return "manager/account";
    }

    @RequestMapping("role")
    /**
     * @Description 路由到权限界面
     * @Params []
     * @Return java.lang.String
     * @Date 2020/1/19 9:48
     **/
    public String role() {
        return "manager/role";
    }

    @RequestMapping("rolePage")
    @ResponseBody
    /**
     * @Description 权限列表页
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 9:50
     **/
    public Map<String, Object> rolePage(@RequestParam() Map<String, String> params) {
        return this.SystemService.rolePage(params);
    }

    @RequestMapping("getResources")
    @ResponseBody
    /**
     * @Description 获取资源
     * @Params []
     * @Return java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     * @Date 2020/1/19 9:56
     **/
    public List<Map<String, Object>> getResourcesByRoleId() {
        return this.SystemService.getSystemResources();
    }

    @RequestMapping("addNewRole")
    @ResponseBody
    /**
     * @Description 添加管理员
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 10:05
     **/
    public Map<String, Object> addNewRole(@RequestParam() Map<String, Object> params) {
        return this.SystemService.addNewRole(params);
    }

    @RequestMapping("getRoleById")
    @ResponseBody
    /**
     * @Description 获取管理员通过id
     * @Params [params]
     * @Return com.hx.hxjob.model.SystemRole
     * @Date 2020/1/19 10:06
     **/
    public SystemRole getRoleById(@RequestParam() Map<String, String> params) {
        return this.SystemService.getRoleById(params.get("rid"));
    }

    @RequestMapping("editRole")
    @ResponseBody
    /**
     * @Description 编辑权限
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 10:13
     **/
    public Map<String, Object> editRole(@RequestParam() Map<String, Object> params) {
        return this.SystemService.editRole(params);
    }

    @RequestMapping("changeRoleStatus")
    @ResponseBody
    /**
     * @Description 修改权限状态
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 10:21
     **/
    public Map<String, Object> changeRoleStatus(@RequestParam() Map<String, String> params) {
        return this.SystemService.changeRoleStatus(params.get("roleid"), params.get("status"));
    }

    @RequestMapping("accountPage")
    @ResponseBody
    /**
     * @Description 管理员列表界面
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 10:39
     **/
    public Map<String, Object> accountPage(@RequestParam() Map<String, String> params) {
        return this.SystemService.accountPage(params);
    }


    @RequestMapping("addAccount")
    @ResponseBody
    /**
     * @Description 添加管理员
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 10:46
     **/
    public Map<String, Object> addAccount(@RequestParam() Map<String, Object> params, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        params.put("creater", user.getId());
        return this.SystemService.addAccount(params);
    }

    @RequestMapping("getAccountById")
    @ResponseBody
    /**
     * @Description 通过id获取管理员
     * @Params [params]
     * @Return com.hx.hxjob.model.SystemUser
     * @Date 2020/1/19 12:39
     **/
    public SystemUser getAccountById(@RequestParam() Map<String, String> params) {
        return this.SystemService.getSystemUser(params.get("userid"));
    }

    @RequestMapping("editAccount")
    @ResponseBody
    /**
    * @Description 编辑管理员
    * @Params [params, session]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 12:41
    **/
    public Map<String, Object> editAccount(@RequestParam() Map<String, Object> params, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        params.put("updater", user.getId());
        return this.SystemService.editAccount(params);
    }
    @RequestMapping("deleteAccount/{userid}")
    @ResponseBody
    /**
    * @Description 删除管理员
    * @Params [userid]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 12:44
    **/
    public Map<String, Object> deleteAccount(@PathVariable String userid) {

        return this.SystemService.deleteAccount(userid);
    }

    @RequestMapping("changeAccount")
    @ResponseBody
    /**
    * @Description 改变管理员状态
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 12:46
    **/
    public Map<String, Object> changeAccount(@RequestParam() Map<String, String> params) {
        return this.SystemService.changeAccount(params.get("id"), params.get("status"));
    }
}
