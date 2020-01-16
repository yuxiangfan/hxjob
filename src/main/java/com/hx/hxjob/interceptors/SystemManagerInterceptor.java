package com.hx.hxjob.interceptors;


import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.system.Constant;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 用于系统后台用户
 *
 * @author Administrator
 */
@Component
public class SystemManagerInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String rootPath = SystemManagerInterceptor.getPath(request);

        String servlet = request.getServletPath();


        HttpSession session = request.getSession();

        SystemUser user = (SystemUser) session.getAttribute(Constant.SYSTEM_USER);

        if (user == null) {
            String redirect = rootPath + "/login";
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

}
