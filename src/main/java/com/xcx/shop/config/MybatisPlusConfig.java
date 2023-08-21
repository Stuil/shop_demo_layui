package com.xcx.shop.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @title: MybatisPlusConfig
 * @description: Mybatis分页配置
 * @author: stuil
 * @copyright: Copyright (c) 2020
 * @version: 1.0
 */

@Configuration
public class MybatisPlusConfig {

    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
