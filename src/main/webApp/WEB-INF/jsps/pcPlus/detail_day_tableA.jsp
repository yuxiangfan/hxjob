<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
</head>
<body>

<style type="text/css">

    .h_search_text {
        outline: none;
        width: 253px;
        height: 34px;
        line-height: 34px;
        padding: 0 40px 0 10px;
        background: white;
        color: black;
    }

    #choose-box-wrapper {
        width: 652px;
        background: #000;
        background-color: rgba(0, 0, 0, 0.5);
        padding: 10px;
        border-radius: 5px;
        display: none;
    }

    #choose-box-title span {
        font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
    }

    #choose-a-province, #choose-a-school {
        margin: 5px 8px 10px 8px;
        border: 1px solid #C3C3C3;
    }

    #choose-a-province a:hover {
        text-decoration: underline;
        cursor: pointer;
    }

    #choose-a-school {
        overflow-x: hidden;
        overflow-y: auto;
        height: 200px;
    }

    #choose-box-bottom {
        background: #F0F5F8;
        padding: 8px;
        text-align: right;
        border-top: 1px solid #CCC;
        height: 40px;
    }

</style>


<!--要考的试-->

<!--头-->
<%@ include file="include_head.jsp" %>

<div class="container1" id="container">
    <div class="wrapper">

        <div class="panel panel-default">
            <!--		第一个表格-->
            <!-- Default panel contents -->
            <div class="panel-heading"><strong style="font-size: 26px;">报名信息<span style="font-size: 10px">(提示：若未发布考试信息，需等待时日，才能获取考试链接)</span></strong></div>

            <!-- Table -->
            <table class="table">
                <tbody>
                <tr>
                    <td>报名名称</td>
                    <td>发布机构</td>
                    <td>报名时间段</td>
                    <td>报名入口</td>
                   <%-- <td>考试链接</td>--%>
                </tr>
                <c:forEach items="${applyList}" var="list">
                    <tr>
                        <td><a href="#">${list.title}</a></td>
                        <td><a href="#">${list.orgCode}</a></td>
                        <td><a href="#">${list.applyTime}</a></td>
                        <td><a target="_blank" href="${list.canSignInto}">点击获取报名链接</a></td>
                     <%--   <c:if test="${list.examStatus==1}">
                            <td><a href="#">已发布</a></td>
                        </c:if>
                        <c:if test="${list.examStatus==0}">
                            <td><a href="#">未发布</a></td>
                        </c:if>--%>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>


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
            <img src="${path}/resources/pcPlus/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>
</body>
<script>
    $("#6").addClass("active");
</script>
</html>