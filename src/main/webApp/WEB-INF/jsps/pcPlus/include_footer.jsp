<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!--尾-->
<footer>
    <div class="footer">
        <nav>
            <a href="javascript:;">关于我们</a>
            <a href="javascript:;">意见反馈</a>
            <a href="javascript:;">使用帮助</a>
            <a href="javascript:;">用户协议</a>
        </nav>
        <div class="foot_left">
            <p class="foot_ebeirui"><em>校园</em>智能招聘</p>
            <p>Powered by <a href="#" target="_Blank" style="color: #f0ad4e">合信码众</a></p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>
