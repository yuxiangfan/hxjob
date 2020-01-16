<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>【工商银行招聘信息】-贝睿</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <title>贝睿-|评公司|搜职位|中国领先的金融信息平台</title>
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pcH5Plus/css/recruit.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pc/css/recruit.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcH5Plus/js/comment.js"></script>
</head>


<style>
    .btn {
        width: 80px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background-color: #2c84cc;
        box-shadow: 2px 2px 3px #CCC;
        cursor: pointer;
        border-radius: 3px;
        color: #fff;
        margin: 0;
        font-size: 14px;
        margin-top: 10px;
        margin-right: 17px;
    }
</style>
<body class="bg_f5f">

<!--头部文件-->
<!--头部-->
<div class="head">
    <div class="head_container">
        <div class="top">
            <img class="logo_br" src="${path}/resources/pcH5Plus/images/logo_br.png">
            &nbsp;&nbsp
            <a class="a_login" href="${path}/hm/login">登入</a>
        </div>
        <form>
            <div class="serch br_dflex input">
                <div class="br_flex">
                    <input type="search" placeholder="搜公司、找职位" class="key">
                </div>
                <div class="serch_btn input_btn"><input name="btn" class="btn" id='search'></div>
            </div>
        </form>
        <div class="tab br_dflex">
            <div class="tit br_flex"><a href="${path}/h5views/index"><i class="a1 "></i><span>首页</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>贝睿精选</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
            <div class="tit br_flex"><ahref="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>

<div class="content-wrap">

    <div class="br_main" id='page1'>

        <div class="company-head">
            <div class="logo">
                <a href="">
                    <img src="${path}${org.logo}">
                </a>
            </div>
            <input type="hidden" id="score1" value="${org.score}">
            <script>
                $(function () {
                    var score = $("#score1").val() / 0.05;
                    $("#score").css("width", score + '%');
                })
            </script>
            <div class="content">
                <div style="position: relative">
                    <div class="star_nr" style="position: absolute;left: 210px;top:5px;"><span style="float:right;" class="grade_star_h5"><i
                            id="score"></i><em></em></span></div>
                </div>
                <h3 class="">
                    <a class="tit ellipsis">${org.fullname}</a> <a class="toComment btn" href="${path}/h5views/tocomment/${orgcode }">我要评价</a>
                </h3>
                <p class="text">
                    ${org.cityname}
                    ·${org.industryname}
                    ·${org.orgPeopleNumber}人
                </p>
                <ul class="ul_style" style="margin-bottom: 10px">
                    <li>待遇:&nbsp;&nbsp;<span>4</span>分</li>
                    <li>成长性:&nbsp;&nbsp;<span>4.2</span>分</li>
                    <li>工作量:&nbsp;&nbsp;<span>4</span>分</li>
                    <li>文化环境:&nbsp;&nbsp;<span>4</span>分</li>
                    <li>综合满意度:&nbsp;&nbsp;<span>4</span>分</li>
                </ul>

            </div>
            <div style="border-bottom:1px solid #f3f3f3;">

            </div>
            <p>大家说：</p>
            <ul class="ul_style" id="ul_style">

            </ul>
            <div style="border-bottom:1px solid #f3f3f3;margin-bottom: 6px">
                <ul class="ul_style sort" style="margin-top: 20px;font-size: 1.1em">
                    <li style="color: #7cb228">全部</li>
                    <li>推荐</li>
                    <li>只看在职</li>
                    <li>只看实习</li>
                </ul>
            </div>
        </div>
    </div>
    <script> var orgcode = '${orgcode}'</script>
    <section class="review_box recruit_box kz_m_b_20">
        <!--热门评论-->
        <div class="box_a" style="bottom: 29px; position: relative">
            <div class="bd ">
                <div class="every_see P_index5">
                    <ul class="com"></ul>
                    <ul id="recommend" class="com" style="display: none">2</ul>
                    <ul id="onJob" class="com" style="display: none;">3</ul>
                    <ul id="practice" class="com" style="display: none">4</ul>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(".sort  li ").click(function () {
            $(".sort li").css("color", "#828282");
            $(this).css("color", "#7cb228");
        })
    </script>
    <script>
        $(".sort li").click(
            function () {
                var divShow = $(".every_see").children("ul");
                if (!$(this).hasClass("select")) {
                    var index = $(this).index();
                    $(this).addClass("select");
                    $(this).siblings("li").removeClass("select");
                    $(divShow[index]).show();
                    $(divShow[index]).siblings("ul").hide();
                }
            })
    </script>
    <!--底部-->
    <footer class="br_foot">
        <div class="br_dflex">
            <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
            <div class="br_flex dh" style="margin-left: -36px">
                <a href="footer-help.jsp">帮助</a><em></em>
                <a href="${path}/hm/login">登录</a><em></em>
                <a href="${path}/hm/register">注册</a><em></em>
                <p>Copyright © 2019 beirui.com<br/>
                    贝睿网 版权所有</p>
            </div>
        </div>
    </footer>

</div>
</body>

</html>
