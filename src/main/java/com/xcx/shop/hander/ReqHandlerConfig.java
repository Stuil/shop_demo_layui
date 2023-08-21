package com.xcx.shop.hander;


import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @title:
 * @description: 拦截器
 * @date: 2021/1/28
 * @author: stuil
 * @copyright: Copyright (c) 2020
 * @version: 1.0
 */

public class ReqHandlerConfig implements HandlerInterceptor {

    /**
     * @description: 请求方法拦截  在请求处理之前 进入controller之前
     * @date: 2021/1/28
     * @param:
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 查询是否有session
      /*  SysUser sysUser= (SysUser) request.getSession().getAttribute("userInfo");
        if(sysUser!=null){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/home");*/
        return false;
    }

    /**
     * 请求处理之后进行调用，但是在DispatcherServlet 视图渲染之前（Controller方法调用之后）
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    }
    /**
     * 在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }

}
