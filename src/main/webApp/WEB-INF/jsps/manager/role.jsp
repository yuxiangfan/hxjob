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
    <script src="resources/js/html5shiv.min.js"></script>
    <script src="resources/js/respond.min.js"></script>
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
    </style>

</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">
    <div class="main-header">
        <a href="javascript:void(0)" class="logo">
            <img src="resources/images/logo.png" style="width: 44px;">
            <span class="logo-lg">校园智能招聘</span>
        </a>
        <div class="navbar navbar-static-top" role="navigation">
            <a href="#" class="glyphicon glyphicon-align-justify" data-toggle="offcanvas" role="button">
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/resources/images/user2-160x160.jpg" class="user-image" alt="User Image"/>
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
                <c:set var="munu" value="ZHGL"/>
                <c:set var="munuc" value="JSGL"/>
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
                角色管理
            </h1>

        </div>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class='params'>
                            名称：<input type='text' name='roleName'/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            状态：<select name='status'>
                            <option value=''>全部</option>
                            <option value='ENABLE'>启用</option>
                            <option value='DISABLE'>禁用</option>
                        </select>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button class='bt' onclick='searchData()'>查询</button>
                            <button class='bt' onclick='reset()'>重置</button>
                        </div>
                        <div class="panel-heading">
                            <a href="JavaScript:void(0)" class="btn btn-default btn-flat" onclick='add()'>新增角色</a>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>角色名称</th>
                                        <th>角色描述</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id='body'>

                                    </tbody>
                                </table>
                                <div id='page' style='text-align:right;padding:10px'></div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class='account' style='display:none'>
        <div>
            <input type="hidden" id='roleid'/>
            <div class='unit'>
                <div class='left'>角色名称</div>
                <div class='right'><input type='text' id='rolename' maxLength=16/></div>
            </div>
            <div class='unit'>
                <div class='left'>角色描述</div>
                <div class='right'><input type='text' id='roleremark' maxLength=16/></div>
            </div>
            <div class='unit'>
                <div class='left'>状态</div>
                <div class='right'>
                    <select id='status'>
                        <option value="ENABLE">启用</option>
                        <option value="DISABLE">禁用</option>
                    </select>
                </div>
            </div>
            <div class='unit'>
                <div class='left'>菜单资源</div>
                <div class='right'>
                    <table id="resources-table" class="layui-table layui-form" style='width:100%'></table>
                </div>
            </div>
        </div>
        <div style='text-align:center;margin-top:10px;clear:both'>
            <button class='bt' id='save'>保存</button>
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
<script src="resources/business-js/manager/role.js"></script>
<script src="resources/business-js/common.js"></script>
<script>
    layui.config({
        base: 'resources/layui/lay/modules/',
    })
    var treetable;
    layui.use(['treetable'], function () {
        treetable = layui.treetable;
    });

</script>


</body>
</html>