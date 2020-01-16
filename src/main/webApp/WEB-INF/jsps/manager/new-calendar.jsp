<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>贝睿招聘</title>
    <base href="<%=basePath%>"/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/_all-skins.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/morris-0.4.3.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="resources/baidueditor/themes/default/css/ueditor.css" rel="stylesheet" type="text/css"/>
    <script src="resources/js/html5shiv.min.js"></script>
    <script src="resources/js/respond.min.js"></script>
    <script src="resources/baidueditor/ueditor.config.js"></script>
    <script src="resources/baidueditor/ueditor.all.min.js"></script>
    <script src="resources/baidueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <style type="text/css">
        .bt {
            width: 100px;
            height: 32px;
            padding: 0px 5px;
            background-color: #3385ff;
            color: #fff;
            margin-left: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .account .unit {
            margin-top: 10px;
            height: 20px;
        }

        .account .left {
            text-align: right;
            width: 25%;
            display: block;
            float: left;
        }

        .account .right {
            text-align: left;
            width: 60%;
            display: block;
            float: left;
            padding-left: 5px;
        }

        .account .right input {
            width: 100%;
            height: 26px;
        }

        .account .right select {
            width: 100%;
            height: 26px;
        }

        .params {
            padding: 15px;
        }

        .params select {
            width: 75px;
            height: 26px;
        }

        .params input {
            width: 100px;
            height: 26px;
        }

        .ranger {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 5px;
        }

        #table {
            width: 100%;
        }

        #table td {
            line-height: 32px;
            padding: 5px
        }

        #table input {
            width: 460px;
            height: 28px
        }

        #table select {
            width: 460px;
            height: 28px
        }

        #table textarea {
            width: 560px;
            height: 220px
        }

        #table .td1 {
            width: 15%;
            text-align: right;
            padding-right: 15px;
        }

        #table .td2 {
        }

        .applyTable tr {
            float: left;
        }

    </style>

</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">
    <div class="main-header">
        <a href="javascript:void(0)" class="logo">
            <img src="resources/images/logo.png" style="width: 44px;">
            <span class="logo-lg">贝睿招聘</span>
        </a>
        <div class="navbar navbar-static-top" role="navigation">
            <a href="#" class="glyphicon glyphicon-align-justify" data-toggle="offcanvas" role="button">
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="resources/images/user2-160x160.jpg" class="user-image" alt="User Image"/>
                            <span class="hidden-xs">${sessionScope.SYSTEM_USER.realName }</span><span
                                class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-footer">
                                <a href="http://www.25175.net/" target="_Blank"
                                   class="btn btn-default btn-flat">技术支持</a>
                            </li>

                            <li class="user-footer">
                                <a href="JavaScript:void(0)" onclick="editpsd()"
                                   class="btn btn-default btn-flat">密码修改</a>
                            </li>

                            <li class="user-footer">
                                <a href="loginout" class="btn btn-default btn-flat">退出</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-sidebar">
        <div class="sidebar">
            <ul class="sidebar-menu">
                <c:set var="munu" value="XWGL"/>
                <c:set var="munuc" value="XWLB"/>
                <c:forEach var='res' items='${sessionScope.SYSTEM_USER.systemRole.systemResources }'>
                    <li class=" treeview <c:if test='${munu==res.resourcesCode }'>active</c:if>">
                        <a href="${res.resources }">
                            <i class="glyphicon ${res.icon }"></i> <span>${res.resourcesName }</span>
                        </a>
                        <ul class="treeview-menu">
                            <c:forEach var='ch' items='${res.children }'>
                                <li <c:if test='${munuc==ch.resourcesCode }'>class='active'</c:if>><a
                                        href="${ch.resources }">${ch.resourcesName }</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- /.sidebar -->
    </div>

    <div class="content-wrapper">
        <div class="content-header">
            <h1>
                <c:if test="${Calendar.applyCode==null }">新增考试日历</c:if>
                <c:if test="${Calendar.applyCode!=null }">编辑考试日历</c:if>
            </h1>

        </div>
        <div class="content">
            <div class='ranger'>

                <%--<tr>
                    <td class='td1'>名称<input type='hidden' id='id' value="${news.id }"/></td>
                    <td class='td2'><input id="title" value="${news.title }" maxLength='32'/></td>
                </tr>--%>

                <TABLE ID="table">
                    <tr>
                        <td class='td1'>发布机构</td>

                        <td class='td2'>
                            <input id="code" name="code" lay-verify="required" value="${Calendar.orgCode }" maxLength='32'/>
                            <input type="hidden" id="applyCode" name="applyCode" value="${Calendar.applyCode}">
                        </td>

                    </tr>
                    <tr>
                        <td class="td1">主题</td>
                        <td class='td2'><input id="title" name="title" value="${Calendar.title }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class="td1">报名入口</td>
                        <td class='td2'><input id="applyInto" value="${Calendar.applyInto }" placeholder="前缀加上https://" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>报名时间段</td>
                        <td class='td2'><input id="applyTime" value="${Calendar.applyTime }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>考试状态（根据是否发布了准考证）</td>
                        <td class='td2'>
                            <select id="examStatus">
                                <option value='0' <c:if test="${Calendar.examStatus=='0'}">selected</c:if>>未发布</option>
                                <option value='1' <c:if test="${Calendar.examStatus=='1'}">selected</c:if>>已发布</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="exam">
                        <td class='td1'>考试主题</td>
                        <td class='td2'>
                            <input id="examTitle" name="examTitle" value="${Calendar.examTitle }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr class="exam">
                        <td class='td1'>考试内容</td>
                        <td class='td2'><input id="content" value="${Calendar.content }" maxLength='32'/></td>
                    </tr>
                    <tr class="exam">
                        <td class='td1'>考试时间段</td>
                        <td class='td2'><input id="examTime" value="${Calendar.examTime }" maxLength='32'/></td>
                    </tr>
                    <tr class="exam">
                        <td class='td1'>考试入口</td>
                        <td class='td2'><input id="examInto" value="${Calendar.examInto }" maxLength='32'/></td>
                    </tr>
                    <tr class="exam">
                        <td class="td1">选择资料链接</td>
                        <td class="td2"><input id="selectData" value="${Calendar.selectData}" maxlength="32"></td>
                    </tr>
                    <tr class="exam">
                        <td class="td1">考前咨询（不填）</td>
                        <td class="td2"><input id="examBeforeConsult" value="${Calendar.examBeforeConsult}" maxlength="32"></td>
                    </tr>
                </table>
                <script>
                    $('.exam').css('display', 'none');
                    $("#examStatus").on('change', function () {
                        if ($(this).val() == '1') {
                            $('.exam').show();
                        } else {
                            $('.exam').hide();
                        }
                    });
                    if ($("#examStatus").val() == '1') {
                        $('.exam').show();
                    }
                </script>
                <div style='padding-left:250px;'>
                    <button class='bt' onclick='submit()'>提交</button>
                    <button class='bt' onclick="window.location.href='news/list'">返回</button>
                </div>
            </div>

        </div>
    </div>

    <div class="main-footer">
        <strong class="text-danger">贝睿招聘</strong>
    </div>


</div><!-- ./wrapper -->
<script src="resources/js/jQuery-2.1.4.min.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.metisMenu.js"></script>
<script src="resources/js/app.min.js" type="text/javascript"></script>
<script src="resources/layui/layui.js"></script>
<script src="resources/business-js/manager/new-calendar.js"></script>
<script src="resources/business-js/common.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        laydate.render({
            elem: '#applyTime'
            , range: true
        });
        laydate.render({
            elem: '#examTime'
            , range: true
        });

    });

</script>
</body>
</html>