package com.hx.hxjob.interceptors;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用于pc端和手机端页面切换
 *
 * @author Administrator
 */
@Component
public class SystemPageInterceptor implements HandlerInterceptor {

    private final String[] baseServlet = {"pcviews", "h5views"};

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String rootPath = SystemMemberInterceptor.getPath(request);

        String servlet = request.getServletPath();

        boolean isAjaxRequest = SystemPageInterceptor.isAjaxRequest(request);

        boolean ismobile = SystemMemberInterceptor.checkIsMobile(request);

        if (isAjaxRequest) {
            return true;
        }

        if (ismobile && servlet.contains(baseServlet[0])) {
            String redirect = rootPath + "/" + baseServlet[1] + "/pos";
            response.sendRedirect(redirect);
            return false;
        }
        if (!ismobile && servlet.contains(baseServlet[1])) {
            String redirect = rootPath + "/" + baseServlet[0] + "/index";
            response.sendRedirect(redirect);
            return false;
        }
        return true;
    }

    public static String getPath(HttpServletRequest request) {
        String basePath = request.getScheme() + "://" + request.getServerName();
        int port = request.getServerPort();
        if (port != 80) {
            basePath += ":" + port;
        }
        basePath += request.getContextPath();
        return basePath;
    }

    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
            return true;
        } else {
            return false;
        }
    }
}
