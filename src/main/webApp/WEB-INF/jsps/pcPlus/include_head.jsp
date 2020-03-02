<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<% pageContext.setAttribute("path", request.getContextPath());%>

<%--搜索使用代码--%>
<script src="${path}/resources/business-js/pc/common.js"></script>

<style>

    .font_a a.active {
        color: #f39a0d; /* 文字颜色 */
        border-bottom-style: solid;
        height: 55px;
        border-bottom-color: #f39a0d;
        text-decoration: none; /* 不显示超链接下划线 */
    }
</style>
<!--头-->
<header>
    <div class="postion_a">
        <div class="header">
            <img src="${path}/resources/pcPlus/images/logo.png" class="h_logo">
            <nav class="font_a">
                <a href="${path}/pcviews/index" id="1" class="home">首页</a>
                <a href="${path}/pcviews/pos" id="2">招聘信息</a>
                <a href="${path}/pcviews/org" id="3">机构点评</a>
                <a href="${path}/pcviews/selector" id="4">校园杂志</a>
                <a href="${path}/pcviews/character" id="5">智能职测</a>
                <a href="${path}/pcviews/calendar" id="6">考试日历</a>
            </nav>

            <div class="unlogin clearfix">
                <div class="login">
                    <a class="submit" ka="head-signin" href="${path}/pcm/login" rel="nofollow"> 登录</a>
                    <a style="display: none" class="info" ka="head-signin" rel="nofollow">${sessionScope.MEMBER.nickname }</a>
                    <a class="center" href="${path}/pcm/personCenter">个人中心</a>
                    <em id="em"></em>
                    <a class="register" href="${path}/pcm/register">注册</a>
                    <em id="em2"></em>
                    <a class="center" class="exit" href="${path}/pcm/personGoOut">退出</a>
                </div>
            </div>
            <div class="h_search" style="top: 15px;">
                <input type="text" name="q" id="header-search" class="h_search_text" valued='${searchContentId}'
                       value="${searchContent}"
                       placeholder="搜索职位或公司" autocomplete="off"/>
                <input class="h_search_submit" value="" type="button" id="search">

            </div>

        </div>
    </div>
</header>
<script>
    var info = $(".info").text();
    if (info == null || info == "" || info.undefined) {
        $(".center").hide();
        $(".submit").show();
        $(".exit").hide();
        $("#em2").hide();
    } else {
        $(".submit").hide();
        $(".center").show();
        $(".register").hide();
        $(".exit").show();
        $("#em").hide();
    }

</script>




