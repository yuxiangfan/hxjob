package com.hx.hxjob.controller.manager;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description:
 * @created: 2020/01/19 13:29
 */
@Controller
@RequestMapping("commonset")
public class CommonSetController {
    @Autowired
    private OrganizationService organizationService;

    @RequestMapping("clist")
    /**
    * @Description 显示城市界面
    * @Params [params]
    * @Return java.lang.String
    * @Date 2020/1/19 13:30
    **/
    public String citylist(@RequestParam() Map<String, String> params) {
        return "manager/city";
    }

    @RequestMapping("clistPage")
    @ResponseBody
    /**
    * @Description 显示城市列表
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:36
    **/
    public Map<String, Object> citylistPage(@RequestParam() Map<String, String> params) {
        return this.organizationService.getCityPage(params);
    }

    @RequestMapping("addCity")
    @ResponseBody
    /**
    * @Description 新增城市
    * @Params [city]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:41
    **/
    public Map<String, Object> addCity(City city) {
        return this.organizationService.addCity(city);
    }

    @RequestMapping("getCityById")
    @ResponseBody
    /**
    * @Description 根据id选择城市
    * @Params [params]
    * @Return com.hx.hxjob.model.City
    * @Date 2020/1/19 13:44
    **/
    public City getCityById(@RequestParam() Map<String, String> params) {
        return this.organizationService.getCityById(params.get("cid"));
    }

    @RequestMapping("editCity")
    @ResponseBody
    /**
    * @Description 编辑城市
    * @Params [city]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:46
    **/
    public Map<String, Object> editCity(City city) {
        return this.organizationService.editCity(city);
    }
    @RequestMapping("deleteCity/{cid}")
    @ResponseBody
    /**
    * @Description 删除城市
    * @Params [cid]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:48
    **/
    public Map<String, Object> deleteCity(@PathVariable String cid) {
        return this.organizationService.deleteCity(cid);
    }

    @RequestMapping("ilist")
    /**
    * @Description 行业显示页面
    * @Params [params]
    * @Return java.lang.String
    * @Date 2020/1/19 13:52
    **/
    public String industrylist(@RequestParam() Map<String, String> params) {
        return "manager/industry";
    }

    @RequestMapping("industryPage")
    @ResponseBody
    /**
    * @Description 行业显示列表
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:57
    **/
    public Map<String, Object> industrylistPage(@RequestParam() Map<String, String> params) {
        return this.organizationService.getIndustryPage(params);
    }

    @RequestMapping("addIndustry")
    @ResponseBody
    /**
    * @Description 新增行业
    * @Params [industry]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 13:58
    **/
    public Map<String, Object> addIndustry(Industry industry) {
        return this.organizationService.addIndustry(industry);
    }

    @RequestMapping("getIndustryById")
    @ResponseBody
    /**
    * @Description 通过id查找行业
    * @Params [params]
    * @Return com.hx.hxjob.model.Industry
    * @Date 2020/1/19 14:02
    **/
    public Industry getIndustryById(@RequestParam() Map<String, String> params) {
        return this.organizationService.getIndustryById(params.get("cid"));
    }

    @RequestMapping("editIndustry")
    @ResponseBody
    /**
    * @Description 编辑行业
    * @Params [industry]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:10
    **/
    public Map<String, Object> editIndustry(Industry industry) {
        return this.organizationService.editIndustry(industry);
    }
    @RequestMapping("deleteIndustry/{cid}")
    @ResponseBody
    /**
    * @Description 删除行业
    * @Params [cid]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:14
    **/
    public Map<String, Object> deleteIndustry(@PathVariable String cid) {
        return this.organizationService.deleteIndustry(cid);
    }
}
