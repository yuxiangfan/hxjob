package com.hx.hxjob.dao;

import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Industry;
import com.hx.hxjob.model.Organization;

import java.util.List;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 16:52
 */
public interface OrganizationMapper {
    List<Organization> getOrganizations();

    List<City> getCities();

    List<Industry> getIndustries();
}
