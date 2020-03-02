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
    <title>贝睿网</title>
    <link rel="stylesheet" href="resources/pc/css/public.css"/>
    <link rel="stylesheet" href="resources/pc/css/details.css"/>
    <script src="resources/pc/js/jquery-2.1.0.min.js"></script>
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
                <a href="pcviews/selector">校园杂志</a>
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
            <input type="text" name="q" id="header-search" class="h_search_text" placeholder="搜索感兴趣的公司或职位"
                   autocomplete="off"/>
            <input class="h_search_submit" value="" type="button" id="search">
        </div>
    </div>
</header>
<section class="details_head">
    <div class="details_headinfo">
        <div class="head_body">
            <%--logo显示--%>
            <div class="head_img">
                <img style="height: 100%; width: 100%;"
                     src="${systemConfig.domain}/${systemConfig.uploadFile}${pos.organization.logo}"/>
            </div>
            <%--组织名称--%>
            <div class="head_name">
                <h1>${pos.organization.fullname}-${pos.title}</h1>
                <span style="float: left; color: #b7b3b3;">
                    ${pos.organization.brief}
                </span>
            </div>
            <%--综合评分--%>
            <div class="head_score">
						<span style="float:right;">
							综合评分&nbsp;&nbsp;&nbsp;
							<span class="grade_star"><i style="width:${pos.organization.score/0.05}%;"></i></span>
						</span>
            </div>
        </div>
        <div class="head_comment">
            <div class="head_comment_check">
                <ul>
                    <!-- 							<li> -->
                    <!-- 								<a href="javascript:void(0)" class="checked">招聘</a> -->
                    <!-- 							</li> -->
                    <!-- 							<li> -->
                    <%-- 								<a href="pcviews/tocommentlist/${pos.organization.code}">点评</a> --%>
                    <!-- 							</li> -->
                </ul>
            </div>
            <a class="toComment" href="pcviews/tocomment/${pos.organization.code}">我要评价</a>
        </div>
    </div>
</section>
<div class="container ps_con clearfix">
    <h2 class="module_title">
        <p class="f_left">公司介绍</p>
    </h2>
    <section class="module_content">
        <div class="content_profile">
            <strong>${pos.organization.fullname}</strong><br/>
            <div style="margin-top: 10px;">
                <span><div id="place"></div>工作地点：${pos.organization.cityname} </span><span><div
                    id="dept"></div>工作部门：${pos.department} </span>
            </div>
            <div style="margin-top: 20px;">
                <span>${pos.organization.description}</span>
            </div>
        </div>
    </section>
    <h2 class="module_title">
        <p class="f_left">岗位职责</p>
    </h2>
    <section class="module_content">
        <div class="content_profile">
					<span>
                        ${pos.duty }
                    </span>
        </div>
    </section>
    <h2 class="module_title">
        <p class="f_left">岗位要求</p>
    </h2>
    <section class="module_content">
        <div class="content_profile">
					<span>
                        ${pos.requirement }
                    </span>
        </div>
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
