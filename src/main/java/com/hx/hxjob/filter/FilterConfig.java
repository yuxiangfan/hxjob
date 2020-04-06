package com.hx.hxjob.filter;


import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

/**
 * 配置自动登录
 */
@Configuration
public class FilterConfig {

    @Resource
    private AutoLoginFilter autoLoginFilter;

    @Bean
    public FilterRegistrationBean registFilter() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(autoLoginFilter);
        registration.addUrlPatterns("/pcviews/*");
        registration.setName("AutoLoginFilter");
        registration.setOrder(1);
        return registration;
    }
}
