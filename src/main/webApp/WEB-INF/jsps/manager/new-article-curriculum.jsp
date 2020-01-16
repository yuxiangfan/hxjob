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

        .kc {
            display: none
        }

        .pa {
            display: none
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
                <c:set var="munu" value="JXGL"/>
                <c:set var="munuc" value="JXLB"/>
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
                <c:if test="${decEntryId==null }">新增精选</c:if>
                <c:if test="${decEntryId!=null }">编辑精选</c:if>
            </h1>

        </div>
        <div class="content">
            <div class='ranger'>
                <table id='table'>
                    <tr>
                        <td class='td1'>类型</td>
                        <td class='td2'>
                            <select id='type'>
                                <option value="1" <c:if test="${articleCurriculum.type=='1'}">selected</c:if>>文章
                                </option>
                                <option value="2" <c:if test="${articleCurriculum.type=='2'}">selected</c:if>>课程
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr class='kc'>
                        <td class='td1'>难度</td>
                        <td class='td2'><input id="difficulty" value="${articleCurriculum.difficulty }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr class='kc'>
                        <td class='td1'>时长</td>
                        <td class='td2'><input id="duration" value="${articleCurriculum.duration }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr class='kc'>
                        <td class='td1'>章节数</td>
                        <td class='td2'><input id="chapters" value="${articleCurriculum.chapters }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr class='kc'>
                        <td class='td1'>是否需要支付</td>
                        <td class='td2'>
                            <select id='needpay'>
                                <option value="NO" <c:if test="${articleCurriculum.needpay=='NO'}">selected</c:if>>否
                                </option>
                                <option value="YES" <c:if test="${articleCurriculum.needpay=='YES'}">selected</c:if>>是
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr class='pa'>
                        <td class='td1'>支付金额</td>
                        <td class='td2'>
                            <input id="amount" value="${articleCurriculum.amount }" maxLength='8' type='number'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>名称<input type='hidden' id='decEntryId'
                                                 value="${articleCurriculum.desEntryId }"/></td>
                        <td class='td2'><input id="title" value="${articleCurriculum.title }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>作者</td>
                        <td class='td2'><input id="author" value="${articleCurriculum.author }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>封面图</td>
                        <td class='td2'>
                            <input type='file' id='uploadLogo'/>
                            <input type='hidden' id='image' value="${articleCurriculum.image }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>封面图预览</td>
                        <td class='td2'>
                            <img style='max-width:200px'
                                 src='${systemConfig.domain }/${systemConfig.uploadFile }${articleCurriculum.image }'
                                 alt='未找到图片' id='logoImage'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>是否热门</td>
                        <td class='td2'>
                            <select id="ishot">
                                <option value='NO' <c:if test="${articleCurriculum.ishot=='NO'}">selected</c:if>>否
                                </option>
                                <option value='YES' <c:if test="${articleCurriculum.ishot=='YES'}">selected</c:if>>是
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>是否推荐</td>
                        <td class='td2'>
                            <select id="isrecommend">
                                <option value='NO' <c:if test="${articleCurriculum.isrecommend=='NO'}">selected</c:if>>
                                    否
                                </option>
                                <option value='YES'
                                        <c:if test="${articleCurriculum.isrecommend=='YES'}">selected</c:if>>是
                                </option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td class='td1'>发布时间</td>
                        <td class='td2'><input id="publishtime" value="${articleCurriculum.publishtime }"
                                               maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>下架时间</td>
                        <td class='td2'><input id="shelftime" value="${articleCurriculum.shelftime }" maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>简介</td>
                        <td class='td2'>
                            <textarea id='brief' style="width:700px" rows=""
                                      cols="">${articleCurriculum.brief }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>内容</td>
                        <td class='td2'>
                            <textarea id='content' style="width:700px" rows=""
                                      cols="">${articleCurriculum.content }</textarea>
                        </td>
                    </tr>

                </table>
                <div style='padding-left:250px;'>
                    <button class='bt' onclick='submit()'>提交</button>
                    <button class='bt' onclick="window.location.href='selector/list'">返回</button>
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
<script src="resources/business-js/manager/new-article-curriculum.js"></script>
<script src="resources/business-js/common.js"></script>
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
    });

    var ueBrief = UE.getEditor('brief');
    var ueContent = UE.getEditor('content');

</script>


</body>
</html>