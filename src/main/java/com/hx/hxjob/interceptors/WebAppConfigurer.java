package com.hx.hxjob.interceptors;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {


    @Resource
    private SystemManagerInterceptor systemManagerInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(systemManagerInterceptor)
                .addPathPatterns("/account/**")
                .addPathPatterns("/commonset/**")
                .addPathPatterns("/position/**")
                .addPathPatterns("/system/**")
                .addPathPatterns("/org/**")
                .addPathPatterns("/test/**")
                .addPathPatterns("/selector/**")
                .addPathPatterns("/member/**")
                .addPathPatterns("/calendar/**")
                .addPathPatterns("/news/**")
                .addPathPatterns("/load/**")
                .addPathPatterns("/news/**");
    }
}
