package com.hx.hxjob.controller.manager;

import com.hx.hxjob.model.ArticleCommand;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.SelectorService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description:
 * @created: 2020/01/19 16:00
 */
@Controller
@RequestMapping("selector")
public class SelectorController {
    @Autowired
    private SelectorService selectorService;
    @RequestMapping("list")
    public String list() {
        return "manager/article-curriculum";
    }

    @RequestMapping("command")
    /**
    * @Description 通知所属界面
    * @Params []
    * @Return java.lang.String
    * @Date 2020/1/19 16:02
    **/
    public String command() {
        return "manager/article-command";
    }

    @RequestMapping("pages")
    @ResponseBody
    /**
    * @Description 通知所属列表页
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 16:03
    **/
    public Map<String, Object> pages(@RequestParam() Map<String, String> params) {
        return this.selectorService.getACPage(params);
    }
    @RequestMapping("pages_command")
    @ResponseBody
    public Map<String, Object> pagesCommand(@RequestParam() Map<String, String> params) {
        return this.selectorService.getACoPage(params);
    }
    @RequestMapping("new")
    public String newPage() {
        return "manager/new-article-curriculum";
    }

    /*通知所属*/
    @RequestMapping("new_command")
    public String newPageCommand() {
        return "manager/new-article-command";
    }

    @RequestMapping("addAC")
    @ResponseBody
    public Map<String, Object> addAC(@RequestParam() Map<String, Object> params, MultipartFile image, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.selectorService.addAC(params, image, user);
    }
    /*添加所属*/
    @RequestMapping("addACO")
    @ResponseBody
    public Map<String, Object> addACO(ArticleCommand articleCommand) {
        return this.selectorService.addACO(articleCommand);
    }

    /*编辑添加所属*/
    @RequestMapping("editACO")
    @ResponseBody
    public Map<String, Object> editACO(ArticleCommand articleCommand) {
        return this.selectorService.editACO(articleCommand);
    }

    /*来到编辑所属*/
    @RequestMapping("getCommandById")
    @ResponseBody
    public ArticleCommand getCommandById(@RequestParam() Map<String, String> param) {
        return this.selectorService.getCommandById(param.get("cid"));
    }


    @RequestMapping("edit/{id}")
    public String editPage(@PathVariable String id, Model model) {
        model.addAttribute("articleCurriculum", this.selectorService.getArticleCurriculumById(id));
        return "manager/new-article-curriculum";
    }

    @RequestMapping("editAC")
    @ResponseBody
    public Map<String, Object> editAC(@RequestParam() Map<String, Object> params, MultipartFile image, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        return this.selectorService.editAC(params, image, user);
    }

    @RequestMapping("deleteAC/{id}")
    @ResponseBody
    public Map<String, Object> deleteAC(@PathVariable String id) {

        return this.selectorService.deleteAC(id);
    }

    @RequestMapping("deleteCommand/{cid}")
    @ResponseBody
    public Map<String, Object> deleteCommand(@PathVariable String cid) {
        return this.selectorService.deleteCommand(cid);
    }
}
