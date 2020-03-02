<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/pcPlus/js/goods_list.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
</head>
<body>

<!--头-->
<%--引入头信息--%>
<%@ include file="include_head.jsp" %>

<div class="container" id="container">
    <div class="wrapper">
        <section class="con_l job_con_l">
            <div class="home_con_li">
                <a href="javascript:;" target="_blank" style="cursor: default">
                    <img src="${path}/resources/pcPlus/images/231.png">
                </a>
                <div class="h_c_l_wrap">
                    <input id="ac" type="hidden" value="${ac.id}">
                    <div>
                        <h3 class="com_name"><a href="javascript:;" style="cursor: default">${ac.title}</a></h3><br>
                    </div>

                    <div class="detail_g_1">
                        <span class="salary" style="height: 25px"><i>${commandNumber}</i>&nbsp;人关注</span>
                    </div>
                    <p>${ac.brief}</p>
                    <div class="btn gz" id="attention" style="position: relative; top: -12px;" onclick="attention(${ac.id})"><a>关注</a></div>
                </div>
            </div>
            <ul class="option_con">
                <li class="select">全部</li>
            </ul>
            <ul id="goods_list">
            </ul>
            <em></em>
        </section>
        <section class="con_r job_con_r">
            <h3 class="bt">热门校园主题</h3>
            <ul id="hotCommand">

                <c:forEach items="${commandNumberOfHot}" var="hot">
                    <li class="home_con_li good_word">
                        <h3><a href=${path}/pcviews/toAdviceList/${hot.id}>${hot.title}</a></h3>
                        <p><span style="display: none;">简介:</span>&nbsp;&nbsp;<span
                                style="margin-top: -20px; overflow: hidden; text-overflow: ellipsis;  display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">${hot.brief}</span>
                        </p>
                        <h4 style="font-size: 20px"><span class="salary">${hot.commandCount}</span> 人关注
                            <span class="btn_pay" onclick=attentionList(${hot.id})><a id="attentionHot${hot.id}">关注</a></span></h4>
                    </li>
                </c:forEach>
            </ul>
        </section>
    </div>
</div>
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
            <p class="foot_ebeirui"><em>贝睿</em>教育</p>
            <p>
                Copyright © 2019 ebeirui.com京ICP备#####
                <span class="ml10">京公网安备############</span>
            </p>
            <p>ebeirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>
<script>
    var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
    $("#4").addClass("active");
</script>
</body>
</html>