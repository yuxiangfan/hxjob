package com.hx.hxjob.service;

import com.hx.hxjob.dao.OrganizationMapper;
import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Organization;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/16 15:15
 */
@Service
public class OrganizationService {
    @Resource
    private OrganizationMapper organizationMapper;

    public List<Organization> getOrganizations() {
        List<Organization> organizations = this.organizationMapper.getOrganizations();
        return organizations;
    }

    public List<City> getCities() {
        List<City> cities = this.organizationMapper.getCities();
        return cities;
    }

    public List<Industry> getIndustries() {
        List<Industry> industries = this.organizationMapper.getIndustries();
        return industries;
    }

}
