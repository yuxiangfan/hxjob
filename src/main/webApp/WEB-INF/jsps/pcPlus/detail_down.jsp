<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>

<!--头-->
<header>
    <div class="postion_a">
        <div class="header">
            <img src="images/logo.png" class="h_logo">
            <nav class="font_a">
                <a href="index.jsp#home" class="home">首页</a>
                <a href="index.jsp#job">招聘信息</a>
                <a href="index.jsp#company">机构点评</a>
                <a href="index.jsp#good">校园杂志</a>
                <a href="index.jsp#test">智能职测</a>
                <a href="index.jsp#day">考试日历</a>
            </nav>
            <div class="login">
                <a href="login.jsp">登录</a>
                <em></em>
                <a href="registered.jsp">注册</a>
            </div>
            <div class="h_search">
                <form action="detail_job.jsp" method="get" target="_blank">
                    <input class="h_search_text form-control" name="h_search" type="text" placeholder="搜索职位或公司"
                           autocomplete="off">
                    <input class="h_search_submit" type="submit" value="">
                </form>
            </div>
        </div>
    </div>
</header>

<div class="container" id="container">
    <div class="wrapper">
        <section class="con_r down_con_r  job_con_r">
            <h3 class="bt">所属行业</h3>
            <a class="down_fl" href="#">全部</a>
            <a class="down_fl" href="#">银行</a>
            <a class="down_fl" href="#">基金</a>
            <a class="down_fl" href="#">信托</a>
            <a class="down_fl" href="#">保险</a>
        </section>
        <section class="con_l down_con_l">
            <div class="option detail_option">
                <form>
                    <input class="down_text" type="text">
                    <input class="down_submit" type="submit">
                </form>
            </div>
            <ul>
                <li class="home_con_li down_li">
                    <a class="down_item" href=""><span></span>人工智能视频教程</a>
                </li>
                <li class="home_con_li down_li">
                    <a class="down_item" href=""><span></span>人工智能视频教程</a>
                </li>
                <li class="home_con_li down_li">
                    <a class="down_item" href=""><span></span>人工智能视频教程</a>
                </li>
                <li class="home_con_li down_li">
                    <a class="down_item" href=""><span></span>人工智能视频教程</a>
                </li>
                <li class="home_con_li down_li">
                    <a class="down_item" href=""><span></span>人工智能视频教程</a>
                </li>
            </ul>
            <em></em>
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
            <img src="images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>

</body>
</html>