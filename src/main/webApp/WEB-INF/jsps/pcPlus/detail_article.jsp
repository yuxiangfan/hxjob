<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <%@ include file="include_static_resource.jsp" %>
</head>
<body>
<div class="kj_a">
    <!--头-->
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>

    <div class="container1" id="container">
        <div class="wrapper">
            <!--中间-->
            <section class="con_l job_con_l">
                <h1>${AdviceDetails.title}</h1>
                <p> ${AdviceDetails.content} </p>
                <img class="detail_img" src="images/1132.png" alt="">
                <em class="dashed"></em>
            </section>

            <!--<右边-->
            <section class="con_r job_con_r">
                <h3 class="bt">下载专区</h3>
                <ul>
                    <li class="home_con_li_a home_word">
                        <a href="${path}/pcviews/detailDownload" target="_blank">
                            <img src="${path}/resources/pcPlus/images/123456.png" alt="">
                        </a>
                        <h4 class="ul_li_h_a">"名称"</h4>
                        <p class="ul_li_h">简介:考试讲义，电子书，培训资料等</p>
                    </li>
                </ul>
                <ul>
                    <li class="home_con_li_a home_word">
                        <a href="${path}/pcviews/detailBeckham">
                            <img src="${path}/resources/pcPlus/images/12345.png" alt="">
                        </a>
                        <h4 class="ul_li_h_a">"小贝+"</h4>
                        <p class="ul_li_h">简介：贝睿的增值服务以及会员体系介绍</p>
                    </li>
                </ul>
                <br>
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
</div>
</body>
<script>
    $("#4").addClass("active");
</script>
</html>