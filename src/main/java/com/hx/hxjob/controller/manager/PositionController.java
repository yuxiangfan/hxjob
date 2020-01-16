package com.hx.hxjob.controller.manager;

import com.hx.hxjob.service.OrganizationService;
import com.hx.hxjob.service.PositionService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/16 17:41
    **/
    public Map<String, Object> positionPage(@RequestParam() Map<String, String> params) {
        return this.positionService.getPositionPage(params);
    }


}
