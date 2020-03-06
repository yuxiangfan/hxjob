package com.hx.hxjob.filter;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.service.MemberService;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.CookieUtils;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 自动登录监听器
 * */
@Component
public class AutoLoginFilter implements Filter {

    @Resource
    private MemberService memberService;

    @Override
    public void init(javax.servlet.FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        /*监听监听器触发时间*/
        long start = System.currentTimeMillis();
        chain.doFilter(request, response);
        System.out.println("Execute cost=" + (System.currentTimeMillis() - start));

        /*1、判断当前用户是否已经登陆*/
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        if (httpServletRequest.getSession().getAttribute(Constant.MEMBER) == null) {
            /*2、判断对应cookie 是否存在 ---- 将cookie 查询写为工具类*/
            String username = CookieUtils.getCookie(httpServletRequest, "USERNAME");
            String userpwd = CookieUtils.getCookie(httpServletRequest, "USERPWD");
            if (username != null && userpwd != null) {
                // 找到了自动登陆cookie
                Member member = memberService.getLogin(username, userpwd);
                if (member != null) {
                    HttpSession session = httpServletRequest.getSession();
                    session.setAttribute(Constant.MEMBER, member);
                    System.out.println("AutoLoginFilter");
                }
            }
        }
    }

    @Override
    public void destroy() {

    }
}











