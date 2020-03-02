package com.hx.hxjob.interceptors;


import com.hx.hxjob.model.Member;
import com.hx.hxjob.system.Constant;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * 用于H5页面openid和用户检查
 *
 * @author Administrator
 */
@Component
public class SystemMemberInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String rootPath = SystemMemberInterceptor.getPath(request);

        boolean ismobile = SystemMemberInterceptor.checkIsMobile(request);

        HttpSession session = request.getSession();

        Member member = (Member) session.getAttribute(Constant.MEMBER);

        if (member == null) {
            String redirect = "";
            if (ismobile) {
                redirect = rootPath + "/hm/login";
            }
            if (!ismobile) {
                redirect = rootPath + "/pcm/login";
            }
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

    public static boolean checkIsMobile(HttpServletRequest request) {
        List<String> mobileAgents = Arrays.asList("ipad", "iphone os", "rv:1.2.3.4", "ucweb", "android", "windows ce", "windows mobile");
        String ua = request.getHeader("User-Agent").toLowerCase();
        for (String sua : mobileAgents) {
            if (ua.indexOf(sua) > -1) {
                return true;//手机端
            }
        }
        return false;//PC端
    }

}
