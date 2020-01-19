package com.hx.hxjob.controller.manager;

import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.model.Organization;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.OrganizationService;
import com.hx.hxjob.service.PositionService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description:
 * @created: 2020/01/16 20:32
 */
@Controller
@RequestMapping("org")
public class OrganizationController {
    @Autowired
    private SystemConfig systemConfig;

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private PositionService positionService;

    @RequestMapping("list")
    /**
     * @Description 回显系统配置，行业，城市
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/16 20:38
     **/
    public String organization(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("industries", this.organizationService.getIndustries());
        model.addAttribute("cities", this.organizationService.getCities());
        return "manager/organization";
    }

    @RequestMapping("orgPage")
    @ResponseBody
    /**
     * @Description 显示机构列表
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 20:40
     **/
    public Map<String, Object> getOrganizationPage(@RequestParam() Map<String, String> params) {
        return this.organizationService.getOrgPage(params);
    }

    @RequestMapping("newOrg")
    /**
     * @Description 新增机构————>回显数据
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/16 20:45
     **/
    public String newOrganization(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("industries", this.organizationService.getIndustries());
        model.addAttribute("cities", this.organizationService.getCities());
        return "manager/new-organization";
    }

    @RequestMapping("addNewOrg")
    @ResponseBody
    /**
     * @Description 新增机构————>插入数据
     * @Params [params, logo, session, request]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 20:48
     **/
    public Map<String, Object> addNewOrg(@RequestParam() Map<String, Object> params, MultipartFile logo, HttpSession session, HttpServletRequest request) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.organizationService.addNewOrg(params, logo, user, request);
    }

    @RequestMapping("toEditOrg/{code}")
    /**
     * @Description 修改机构————> 回显数据
     * @Params [code, model]
     * @Return java.lang.String
     * @Date 2020/1/16 21:08
     **/
    public String editOrg(@PathVariable String code, Model model) {
        model.addAttribute("org", this.organizationService.getOrganization(code));
        model.addAttribute("industries", this.organizationService.getIndustries());
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("systemConfig", this.systemConfig);
        return "manager/new-organization";
    }

    @RequestMapping("editOrg")
    @ResponseBody
    /**
     * @Description 修改机构————> 插入数据
     * @Params [params, logo, session, request]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 21:19
     **/
    public Map<String, Object> editOrg(@RequestParam() Map<String, Object> params, MultipartFile logo, HttpSession session, HttpServletRequest request) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.organizationService.editOrg(params, logo, user, request);
    }

    @RequestMapping("deleteOrg/{code}")
    @ResponseBody
    /**
     * @Description 删除机构————>删除数据
     * @Params [code]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 21:26
     **/
    public Map<String, Object> deleteOrg(@PathVariable String code) {
        return this.organizationService.deleteOrg(code);
    }

    @RequestMapping("comment")
    /**
     * @Description 点评回显
     * @Params [code, model]
     * @Return java.lang.String
     * @Date 2020/1/16 21:36
     **/
    public String commentList(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("cities", this.organizationService.getCities());
        return "manager/comment";
    }

    @RequestMapping("commentPage")
    @ResponseBody
    /**
     * @Description 显示点评列表
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 21:38
     **/
    public Map<String, Object> getCommentPage(@RequestParam() Map<String, String> params) {
        return this.organizationService.getCommentPage(params);
    }

    @RequestMapping("newComment")
    /**
     * @Description 新增点评————> 回显数据
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/16 21:44
     **/
    public String newComment(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        return "manager/new-comment";
    }

    @RequestMapping("addNewComment")
    @ResponseBody
    /**
     * @Description 新增点评————> 插入数据
     * @Params [params, imgUpload, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 21:49
     **/
    public Map<String, Object> addNewComment(@RequestParam() Map<String, Object> params, MultipartFile imgUpload, HttpSession session) {
        return this.organizationService.addNewComment(params, imgUpload);
    }

    @RequestMapping("toEditComment/{id}")
    /**
     * @Description 修改点评————>回显数据
     * @Params [id, model]
     * @Return java.lang.String
     * @Date 2020/1/16 21:59
     **/
    public String editComment(@PathVariable String id, Model model) {
        model.addAttribute("com", this.organizationService.toEditCommentById(id));
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("systemConfig", this.systemConfig);
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        return "manager/new-comment";
    }

    @RequestMapping("editComment")
    @ResponseBody
    /**
     * @Description 修改点评————>插入数据
     * @Params [params, imgUpload]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 22:03
     **/
    public Map<String, Object> editComment(@RequestParam() Map<String, Object> params, MultipartFile imgUpload) {
        return this.organizationService.editComment(params, imgUpload);
    }

    @RequestMapping("deleteComment/{id}")
    @ResponseBody
    /**
     * @Description 删除点评
     * @Params [id]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 9:12
     **/
    public Map<String, Object> deleteComment(@PathVariable String id) {
        return this.organizationService.deleteComment(id);
    }

    @RequestMapping(value = "importOrgExcel")
    @ResponseBody
    /**
     * @Description 机构报表导入
     * @Params [file]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/19 9:19
     **/
    public Map<String, Object> importOrgExcel(MultipartFile file) throws Exception {
        Map<String, Object> result = new HashMap<>();
        if (file == null) {
            result.put("code", -1);
            result.put("msg", "您当前未选择任何文件");
            return result;
        }
        System.out.println("myFile:" + file);
        System.out.println("进入导入方法---->" + file.getOriginalFilename());
        /*输出工作报表*/
        List<Organization> list = organizationService.readOrgExcel(file.getInputStream());
        return organizationService.insertOrgExcel(list, file);
    }
}
