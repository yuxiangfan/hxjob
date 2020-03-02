package com.hx.hxjob.interceptors;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {


    @Resource
    private SystemManagerInterceptor systemManagerInterceptor;

    @Resource
    private SystemPageInterceptor systemPageInterceptor;

    @Resource
    private SystemMemberInterceptor systemMemberInterceptor;


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
                .addPathPatterns("/advice/**")
                .addPathPatterns("/load/**");

        registry.addInterceptor(systemPageInterceptor)
                .addPathPatterns("/pcviews/**")
                .addPathPatterns("/h5views/**");

        registry.addInterceptor(systemMemberInterceptor)
                .addPathPatterns("/pcviews/character")
                .addPathPatterns("/pcviews/poscom")
                .addPathPatterns("/pcviews/tocomment/**")
                .addPathPatterns("/h5views/character")
                .addPathPatterns("/h5views/poscom")
                .addPathPatterns("/h5views/tocomment/**");
    }
}
