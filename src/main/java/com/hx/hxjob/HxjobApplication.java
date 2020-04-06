package com.hx.hxjob;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ServletComponentScan
@MapperScan("com.hx.hxjob.dao")
@EnableScheduling
public class HxjobApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // 用main方法执行的Application启动类
        return builder.sources(HxjobApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(HxjobApplication.class, args);
    }

}
