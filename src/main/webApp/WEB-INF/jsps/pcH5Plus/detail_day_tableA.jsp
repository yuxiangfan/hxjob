<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>校园智能招聘网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pcH5Plus/css/recruit.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
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
            <div class="tit br_flex"><a href="${path}/h5views/index"><i class="a1 "></i><span>首页</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>校园杂志</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>


<div class="content-wrap">

    <section class="review_box recruit_box kz_m_b_20" >
        <!--热门评论-->
        <div class="box_a">
            <div class="bd ">
                <div class="every_see P_index5">
                    <!--		第一个表格-->
                    <!-- Default panel contents -->
                    <div class="panel-heading"><strong style="font-size: 26px;">有证在手 offer不愁</strong></div>

                    <!-- Table -->
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>报名名称</td>
                            <td>机构</td>
                            <td>报名开始时间</td>
                            <td>报名结束时间</td>
                            <td>报名入口</td>
                            <td>考试链接</td>
                        </tr>
                        <c:forEach items="${applyList}" var="list">
                            <tr>
                                <td><a href="#">${list.title}</a></td>
                                <td><a href="#">${list.fullname}</a></td>
                                <td><a href="#">${list.startTime}</a></td>
                                <td><a href="#">${list.endTime}</a></td>
                                <td><a target="_blank" href="${list.canSignInto}">点击获取报名链接</a></td>
                                <c:if test="${list.examStatus==1}">
                                    <td><a href="#">已发布</a></td>
                                </c:if>
                                <c:if test="${list.examStatus==0}">
                                    <td><a href="#">未发布</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </section>

    <!--底部-->
    <footer class="br_foot">
        <div class="br_dflex">
            <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
            <div class="br_flex dh" style="margin-left: -36px">
                <a href="#">帮助</a><em></em>
                <a href="${path}/hm/login">登录</a><em></em>
                <a href="${path}/hm/register">注册</a><em></em>
                <p>校园智能招聘<br/>
                       By  合信码众</p>
            </div>
        </div>
    </footer>

</div>
</body>
</html>
