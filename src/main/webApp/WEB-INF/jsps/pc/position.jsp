<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Cache-Control" content="no-transform ">
    <meta name="viewport" content="width=device-width">
    <title>贝睿网——招聘/实习</title>
    <link rel="stylesheet" href="resources/pc/css/public.css"/>
    <link rel="stylesheet" href="resources/pc/css/recruit.css"/>
    <script src="resources/pc/js/jquery-2.1.0.min.js"></script>
    <script src="resources/layui/layui.js"></script>
    <script src="resources/business-js/pc/pos.js"></script>
    <script src="resources/business-js/pc/common.js"></script>
</head>
<body>
<header class="global">
    <div class="header clearfix">
        <a style="float: left;" href="pcviews/index"> <img src="resources/pc/picture/logo_top_1.jpg"
                                                           style="height: 65px;"></a>
        <nav>
            <div class="h_left">
                <a href="pcviews/pos">招聘/实习</a>
                <a href="pcviews/org">机构点评</a>
                <a href="pcviews/character">个人性格测评</a>
                <a href="pcviews/poscom">个人职业测评</a>
                <a href="pcviews/selector">贝睿精选</a>
                <a href="pcviews/about">关于</a>
            </div>
        </nav>
        <div class="unlogin clearfix">
            <div class="login">
                <a ka="head-signin" href="pcm/login" rel="nofollow">登录</a><em></em><a ka="head-signup"
                                                                                      href="pcm/register"
                                                                                      rel="nofollow">注册</a>
            </div>
        </div>
        <div class="h_search">
            <input type="text" name="q" id="header-search" valued='${searchContentId}' value="${searchContent}"
                   class="h_search_text" placeholder="搜索感兴趣的公司或职位" autocomplete="off"/>
            <input class="h_search_submit" value="" type="button" id='search'>
        </div>
    </div>
</header>

<div class="container ps_con clearfix">
    <section class="l_con clearfix">
        <div class="group">
            <h2 class="group_head">职位类别</h2>
            <div style="padding-top: 10px;" id="types">
                <a class="group_body" href="javascript:void(0)" style='color:#fb8341;width:36%' val=''>全部</a>
                <a class="group_body" href="javascript:void(0)" style='width:36%' val='实习岗位'>实习岗位</a>
                <a class="group_body" href="javascript:void(0)" style='width:36%' val='校招岗位'>校招岗位</a>
                <a class="group_body" href="javascript:void(0)" style='width:36%' val='社招岗位'>社招岗位</a>
            </div>
        </div>
        <div class="group">
            <h2 class="group_head">所属行业</h2>
            <div style="padding-top: 10px;" id='industries'>
                <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                <c:forEach var='industry' items='${industries}'>
                    <a class="group_body" href="javascript:void(0)" val='${industry.id}'>${industry.name}</a>
                </c:forEach>
            </div>
        </div>
        <div class="group">
            <h2 class="group_head">所在地区</h2>
            <div style="padding-top: 10px;" id='cities'>
                <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                <c:forEach var='city' items='${cities}'>
                    <a class="group_body" href="javascript:void(0)" val='${city.id}'>${city.name}</a>
                </c:forEach>
            </div>
        </div>

    </section>

    <section class="r_con clearfix" id="poss" style='width:68%'>

    </section>
</div>

<footer>
    <div class="footer_wrapper">
        <div class="copyright">
            <p class="foot_kanzhun"><em>Bei</em>Rui.</p>
            <p class="mt5">
                Copyright © 2019 beirui.com京ICP备14013441号-1
                <span class="ml10">京公网安备11001505034210</span>
            </p>
            <p class="mt5">beirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
            <p class="mt5">顺通网络提供<a style="color: #FFFFFF;" href="http://www.25175.net/web/Default.aspx"
                                    target="_blank">技术支持</a></p>
        </div>

    </div>
</footer>
</body>
</html>


