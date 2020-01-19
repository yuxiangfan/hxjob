package com.hx.hxjob.controller.manager;

import com.hx.hxjob.model.Position;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.service.OrganizationService;
import com.hx.hxjob.service.PositionService;
import com.hx.hxjob.system.Constant;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description: 职业mvc
 * @created: 2020/01/16 15:10
 */
@RequestMapping("Position")
@Controller
public class PositionController {
    @Autowired
    private PositionService positionService;

    @Autowired
    private OrganizationService organizationService;

    @RequestMapping("list")
    /**
     * @Description 职业获取机构的产业，城市，机构
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/16 17:36
     **/
    public String positionList(Model model) {
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("industries", this.organizationService.getIndustries());
        return "manager/position";
    }

    @RequestMapping("positionPage")
    @ResponseBody
    /**
     * @Description 获取职位列表
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 17:41
     **/
    public Map<String, Object> positionPage(@RequestParam() Map<String, String> params) {
        return this.positionService.getPositionPage(params);
    }

    @RequestMapping("newPosition")
    /**
     * @Description 新增职位————>回显数据
     * @Params [model]
     * @Return java.lang.String
     * @Date 2020/1/16 18:22
     **/
    public String newPosition(Model model) {
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        model.addAttribute("cities", this.organizationService.getCities());
        return "manager/new-position";
    }

    @RequestMapping(value = "addNewPosition", method = RequestMethod.POST)
    @ResponseBody
    /**
     * @Description 新增职位————>插入职位
     * @Params [position, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 18:23
     **/
    public Map<String, Object> addNewPosition(Position position, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        position.setCreater(user.getId());
        return this.positionService.addNewPosition(position);
    }

    @RequestMapping("editPosition/{decEntryId}")
    /**
     * @Description 编辑职位————>回显数据
     * @Params [model, decEntryId]
     * @Return java.lang.String
     * @Date 2020/1/16 19:08
     **/
    public String newPosition(Model model, @PathVariable String decEntryId) throws Exception {
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("decEntryId", decEntryId);
        model.addAttribute("position", this.positionService.getPositionById(decEntryId));
        return "manager/new-position";
    }


    @RequestMapping(value = "editPosition", method = RequestMethod.POST)
    @ResponseBody
    /**
     * @Description 编辑职位————>插入数据
     * @Params [position, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 19:45
     **/
    public Map<String, Object> editPosition(Position position, HttpSession session) {
        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);
        position.setUpdater(user.getId());
        return this.positionService.editPosition(position);
    }

    @RequestMapping(value = "deletePostion/{positionid}")
    @ResponseBody
    /**
    * @Description 删除职位
    * @Params [positionid]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/16 19:54
    **/
    public Map<String, Object> deletePostion(@PathVariable String positionid) {

        return this.positionService.deletePosition(positionid);
    }

    @RequestMapping(value = "importJobExcel")
    @ResponseBody
    /**
    * @Description 职位报表导入
    * @Params [file, model]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/16 20:33
    **/
    public Map<String, Object> importJobExcel(MultipartFile file, Model model) throws Exception {
        Map<String, Object> result = new HashMap<>();
        if (file == null) {
            result.put("code", -1);
            result.put("msg", "您当前未选择任何文件");
            return result;
        }
        System.out.println("myFile:" + file);
        System.out.println("进入导入方法---->" + file.getOriginalFilename());
        /*输出工作表格*/
        List<Position> list = positionService.readJobExcel(file.getInputStream());

        /*对插入的数据进行校验*/
        return positionService.insertJobExcel(file, list);

    }
}
