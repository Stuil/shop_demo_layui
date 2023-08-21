package com.xcx.shop.hander;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @title: LoginHandlerConfig
 * @description:
 * @date: 2021/1/28
 * @author: stuil
 * @copyright: Copyright (c) 2020
 * @version: 1.0
 */

@Configuration
public class LoginHandlerConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册TestInterceptor拦截器
        InterceptorRegistration registration = registry.addInterceptor(new ReqHandlerConfig());
        //所有路径都被拦截
        registration.addPathPatterns("/**");
        //添加不拦截路径
        /**
         登录
         html静态资源
         js静态资源
         css静态资源
         */
        registration.excludePathPatterns(
                "/home",
                "/callBack1",
                "/callBack",
                "/login",
                "/register",
                "/**/*.html",
                "/**/*.js",
                "/**/*.css",
                "/**/*.woff",
                "/**/*.ttf"
        );
    }
}
