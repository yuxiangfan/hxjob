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
    <title>贝睿网——首页</title>
    <link rel="stylesheet" href="resources/pc/css/public.css?version=1.0"/>
    <link rel="stylesheet" href="resources/pc/css/index.css"/>
    <link rel="stylesheet" href="resources/pc/css/component.css"/>
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
                <a href="pcviews/selector">贝睿精选</a>
                <a href="pcviews/about">关于</a>
            </div>
        </nav>
        <div class="unlogin clearfix">
            <div class="login">
                <a class="submit" ka="head-signin" href="pcm/login" rel="nofollow"> 登录</a>
                <a class="info" ka="head-signin" href="pcm/login"
                   rel="nofollow">${sessionScope.MEMBER.nickname }</a>
                <em></em>
                <a ka="head-signup" href="pcm/register" rel="nofollow">注册</a>
            </div>
        </div>
        <div class="h_search">
            <input type="text" name="q" id="header-search" class="h_search_text" placeholder="搜索感兴趣的公司或职位"
                   autocomplete="off"/>
            <input class="h_search_submit" value="" type="button" id='search'>
        </div>
    </div>
</header>
<section class="banner clearfix" style="background-image:url(resources/pc/picture/b-v3.jpg);">
    <h1>金融公司，就找贝睿</h1>
    <dl class="banner_dl">
        <dd>
            <div class="search_container">
                <div class="custom_div">
                    <input class="input__field input__field--yoko" type="text" id="input-16">
                    <label class="input__label input__label--yoko" for="input-16">
                    </label>
                    <button class="search" id='search_index'></button>
                    <!-- <input name="stype" id="BSSSType" value="" type="hidden">
                        <input ka="banner-search" type="submit" class="btn_o_l" value="搜索"> -->
                </div>
            </div>
        </dd>
    </dl>
    <p>
        查看超过5,608,972家公司的员工匿名点评、工资和面试经验
    </p>
</section>
<div class="container ps_con clearfix">
    <section class="l_con clearfix">
        <h3 class="tt"><img src="resources/pc/picture/热门工作列表.jpg" alt="热门工作列表"></h3>
        <ul class="search_hangye">
            <c:forEach items='${hotPoss.rows }' var='hotpos'>
                <li><a href="javascript:void(0)" onclick="gp('${hotpos.name}','${hotpos.id}')">${hotpos.name}</a></li>
            </c:forEach>
        </ul>
    </section>
    <section class="r_con clearfix">
        <h3 class="tt"><img src="resources/pc/picture/新闻.jpg"></h3>
        <ul class="comment  scroll_inner" style="top: 0px;">
            <li class="comment_item">
                <a href="#">
                    <div class="newsIcon"></div>
                    <span class="news_title">“新闻新闻”</span><br>
                    <span class="news_synopsis">——新闻简介新闻简介</span>
                </a>
            </li>
        </ul>
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
<script type="text/javascript">
    var gp = function (gpname, gpid) {
        gpname = escape(escape(gpname));
        gpid = escape(escape(gpid));
        window.location.href = "pcviews/pos?sc=" + gpname + "&scd=" + gpid;
    };
    var info = $(".info").text();
    if (info == null || info == "" || info.undefined) {
        $(".info").hide();
        $(".submit").show();
    } else {
        $(".info").show();
        $(".submit").hide();
    }
</script>
</html>
