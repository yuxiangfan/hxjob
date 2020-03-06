package com.hx.hxjob.controller.common;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Organization;
import com.hx.hxjob.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: com.hx.hxjob.controller.common
 * @description:
 */
@Controller
@RequestMapping("common")
public class CommonController {
    @Resource
    private OrganizationService organizationService;

    @RequestMapping("getOrganizations")
    @ResponseBody
    public List<Organization> getOrganizations() {
        return this.organizationService.getOrganizations();
    }

    @RequestMapping("getCities")
    @ResponseBody
    public List<City> getCities() {
        return this.organizationService.getCities();
    }

    @RequestMapping("getIndustries")
    @ResponseBody
    public List<Industry> getIndustries() {
        return this.organizationService.getIndustries();
    }

    @RequestMapping("uploadImage")
    public void uploadImage(MultipartFile image) {

    }
}
