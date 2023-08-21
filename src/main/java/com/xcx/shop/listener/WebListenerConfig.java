package com.xcx.shop.listener;

import org.nutz.dao.entity.annotation.Comment;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * @title: WebListenerConfig
 * @description: 监听器
 * @date: 2021/1/28
 * @author: stuil
 * @copyright: Copyright (c) 2020
 * @version: 1.0
 */

@Comment
@WebListener
public class WebListenerConfig implements ServletRequestListener {
    @Override
    public void requestInitialized(ServletRequestEvent servletRequestEvent) {
        System.out.println("---------------------------->请求创建");
    }
    @Override
    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
        System.out.println("---------------------------->请求销毁");
    }
}
