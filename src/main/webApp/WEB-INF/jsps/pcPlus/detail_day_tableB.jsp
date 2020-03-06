<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘网</title>
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
                <div class="panel-heading"><strong style="font-size: 26px;">考试信息<span style="font-size: 10px"></span></strong></div>

                <!-- Table -->
                <table class="table">
                    <tbody>
                    <tr>
                        <td>考试名称</td>
                        <td>发布机构</td>
                        <td>准考证入口</td>
                        <td>考试结束时间段</td>
                        <td>精选资料</td>
                        <td>考前咨询</td>
                    </tr>
                    <c:forEach items="${examList}" var="list">
                        <tr>
                            <td><a href="#">${list.title}</a></td>
                            <td><a href="#">${list.orgCode}</a></td>
                            <td><a target="_blank" href="${list.canExamInto}">点击获取考试链接</a></td>
                            <td><a href="#">${list.examTime}</a></td>
                            <td><a target="_blank" href="${list.selectData}">点击选择精选资料</a></td>
                            <td><a href="#">${list.examBeforeConsult}</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

    </div>
</div>

</body>
<script>
    $("#6").addClass("active");
</script>
</html>