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
<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘</title>
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
    </style>

</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">
    <div class="main-header">
        <a href="javascript:void(0)" class="logo">
            <img src="resources/images/logo.png" style="width: 65px;">
            <span class="logo-lg">校园智能招聘</span>
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
                <c:set var="munu" value="ZGGL"/>
                <c:set var="munuc" value="CGGL"/>
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
                <c:if test="${org==null }">新增机构</c:if>
                <c:if test="${org!=null }">编辑机构</c:if>
            </h1>

        </div>
        <div class="content">
            <div class='ranger'>
                <table id='table'>
                    <tr>
                        <td class='td1'>机构全称<input type='hidden' id='code' value="${org.code }"/></td>
                        <td class='td2'><input id="fullname" value="${org.fullname }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>机构简称</td>
                        <td class='td2'><input id="shortname" value="${org.shortname }" maxLength='32'/></td>
                    </tr>
                    <!-- 					<tr> -->
                    <!-- 						<td class='td1'>机构代码</td> -->
                    <!-- 						<td class='td2'> -->
                    <%-- 							<input id="code" value="${org.code }" maxLength='32'/> --%>
                    <!-- 						</td> -->
                    <!-- 					</tr> -->
                    <tr>
                        <td class='td1'>LOGO</td>
                        <td class='td2'>
                            <input type='file' id='uploadLogo'/>
                            <input type='hidden' id='logo' value="${parh}${org.logo }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>LOGO预览</td>
                        <td class='td2'>
                            <img style='max-width:200px'
                                 src='${path}${org.logo }' alt='未找到图片'
                                 id='logoImage'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>机构人数</td>
                        <td class='td2'>
                            <input type='text' id='orgPeopleNumber' placeholder="选择范围" value="${org.orgPeopleNumber }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>城市</td>
                        <td class='td2'>
                            <select id='city'>
                                <c:forEach items='${cities}' var='city'>
                                    <option value="${city.id}"
                                            <c:if test="${org.city==city.id}">selected</c:if> >${city.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>行业</td>
                        <td class='td2'>
                            <select id='industry'>
                                <c:forEach items='${industries}' var='industry'>
                                    <option value="${industry.id}"
                                            <c:if test="${org.industry==industry.id}">selected</c:if> >${industry.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>标签</td>
                        <td class='td2'>
                            <input id="tags" value="${org.tags }" maxLength='128'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>评级</td>
                        <td class='td2'>
                            <input id="grade" value="${org.grade }" maxLength='16'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>评分</td>
                        <td class='td2'>
                            <input id="score" value="${org.score }" maxLength='16'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>平均薪资</td>
                        <td class='td2'>
                            <input id="salary" placeholder="以K为单位，例如5K就是5000" value="${org.salary }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>待遇(自己调整,录入到成长性,工作环境等)</td>
                        <td class='td2'>
                            <input id="treatment" type="number" value="${org.treatment }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>是否热门</td>
                        <td class='td2'>
                            <select id="ishot">
                                <option value='NO' <c:if test="${org.ishot=='NO'}">selected</c:if>>否</option>
                                <option value='YES' <c:if test="${org.ishot=='YES'}">selected</c:if>>是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>发布时间</td>
                        <td class='td2'><input id="publishtime" value="${org.publishtime }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>下架时间</td>
                        <td class='td2'><input id="shelftime" value="${org.shelftime }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>简介</td>
                        <td class='td2'>
                            <textarea id='brief' style="width:700px" rows="" cols="">${org.brief }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>详细描述</td>
                        <td class='td2'>
                            <textarea id='description' style="width:700px" rows=""
                                      cols="">${org.description }</textarea>
                        </td>
                    </tr>


                </table>
                <div style='padding-left:250px;'>
                    <button class='bt' onclick='submit()'>提交</button>
                    <button class='bt' onclick="window.location.href='org/list'">返回</button>
                </div>
            </div>

        </div>
    </div>

    <!--右下角-->

    <div class="main-footer">
        <strong class="text-danger">校园智能招聘</strong>
    </div>


</div><!-- ./wrapper -->
<script src="resources/js/jQuery-2.1.4.min.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.metisMenu.js"></script>
<script src="resources/js/app.min.js" type="text/javascript"></script>
<script src="resources/layui/layui.js"></script>
<script src="resources/business-js/manager/new-organization.js"></script>
<script src="resources/business-js/common.js"></script>
<script src="resources/js/json2.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#publishtime', type: 'datetime' //指定元素
        });
        laydate.render({
            elem: '#shelftime', type: 'datetime' //指定元素
        });
    });

    var file = null;

    $(function () {
        $("#uploadLogo").on('change', function () {
            file = document.getElementById("uploadLogo").files[0];
            document.getElementById("logoImage").src = window.URL.createObjectURL(file);
        });
    })
    var ueDescription = UE.getEditor('description');
</script>


</body>
</html>