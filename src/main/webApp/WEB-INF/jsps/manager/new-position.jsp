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
                <c:set var="munu" value="ZPGL"/>
                <c:set var="munuc" value="ZWGL"/>
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
                <c:if test="${decEntryId==null }">新增岗位</c:if>
                <c:if test="${decEntryId!=null }">编辑岗位</c:if>
            </h1>
        </div>
        <div class="content">
            <div class='ranger'>
                <table id='table'>
                    <tr>
                        <td class='td1'>岗位名称<input type='hidden' id='decEntryId' value="${decEntryId }"/></td>
                        <td class='td2'><input id="title" value="${position.title }" maxLength='32'/></td>
                    </tr>
                    <!-- 					<tr> -->
                    <!-- 						<td class='td1'>岗位编号</td> -->
                    <%-- 						<td class='td2'><input id="code" value="${position.code }" maxLength='32'/></td> --%>
                    <!-- 					</tr> -->
                    <tr>
                        <td class='td1'>选择机构</td>
                        <td class='td2'>
                            <select id='orgcode'>
                                <c:forEach items='${organizations}' var='organization'>
                                    <option value="${organization.code}"
                                            <c:if test="${position.orgcode==organization.code}">selected</c:if> >${organization.shortname}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>选择类型</td>
                        <td class='td2'>
                            <select id='type'>
                                <option value='社招' <c:if test="${position.type=='社招'}">selected</c:if>>社招</option>
                                <option value='校招' <c:if test="${position.type=='校招'}">selected</c:if>>校招</option>
                                <option value='实习' <c:if test="${position.type=='实习'}">selected</c:if>>实习</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>工作地点</td>
                        <td class='td2'>
                            <select id='address'>
                                <c:forEach items='${cities}' var='city'>
                                    <option value="${city.id}"
                                            <c:if test="${position.address==city.id}">selected</c:if> >${city.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>工作地点详址</td>
                        <td class='td2'><input id="workplace" maxLength='50' value="${position.workplace}" placeholder="百度地图呈现"/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>所属部门</td>
                        <td class='td2'><input id="department" value="${position.department }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>公司人数</td>
                        <td class='td2'><input id="positionPeopleNumber" value="${position.positionPeopleNumber}"
                                               maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>职位月薪</td>
                        <td class='td2'><input id="monSalary" value="${position.monSalary}" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>经验要求</td>
                        <td class='td2'><input id="experienceRequire" value="${position.experienceRequire }"
                                               maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>学历要求</td>
                        <td class='td2'><input id="educationRequire" value="${position.educationRequire }"
                                               maxLength='32'/>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>类型</td>
                        <td class='td2'><input id="posType" placeholder="兼职，实习，或者全职" value="${position.posType }"
                                               maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>推荐指数</td>
                        <td class='td2'><input id="rindex" value="${position.rindex }" placeHolder='数值范围[0,5]'
                                               maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>是否热门</td>
                        <td class='td2'>
                            <select id="ishot">
                                <option value='NO' <c:if test="${position.ishot=='NO'}">selected</c:if>>否</option>
                                <option value='YES' <c:if test="${position.ishot=='YES'}">selected</c:if>>是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>是否标星</td>
                        <td class='td2'>
                            <select id="isstar">
                                <option value='NO' <c:if test="${position.isstar=='NO'}">selected</c:if>>否</option>
                                <option value='YES' <c:if test="${position.isstar=='YES'}">selected</c:if>>是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>发布时间</td>
                        <td class='td2'><input id="publishtime" value="${position.publishtime }" maxLength='32'/></td>
                    </tr>


                    <tr id="updatetimeTr">
                        <td class='td1'>更新时间</td>
                        <td class='td2'><input id="updatetime" value="${position.updatetime }" maxLength='32'/></td>
                    </tr>

                    <tr>
                        <td class='td1'>下架时间</td>
                        <td class='td2'><input id="shelftime" value="${position.shelftime }" maxLength='32'/></td>
                    </tr>
                    <tr>
                        <td class='td1'>岗位简介说明</td>
                        <td class='td2'><textarea id="posBrief" name="posBrief" style='width:700px' rows=""
                                                  cols="">${position.posBrief }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class='td1'>岗位职责</td>
                        <td class='td2'><textarea id="duty" style='width:700px' rows=""
                                                  cols="">${position.duty }</textarea></td>
                    </tr>
                    <tr>
                        <td class='td1'>岗位要求</td>
                        <td class='td2'><textarea id="requirement" style='width:700px' rows=""
                                                  cols="">${position.requirement }</textarea></td>
                    </tr>
                    <tr>
                        <td class='td1'>薪酬待遇</td>
                        <td class='td2'><textarea id="jobSalary" style='width:700px' rows=""
                                                  cols="">${position.jobSalary}</textarea></td>
                    </tr>
                    <tr>
                        <td class='td1'>联系方式</td>
                        <td class='td2'><textarea id="contact" style='width:700px' rows=""
                                                  cols="">${position.contact }</textarea></td>
                    </tr>
                    <tr>
                        <td class='td1'>备注</td>
                        <td class='td2'><textarea id="remark" style='width:700px' rows=""
                                                  cols="">${position.remark }</textarea></td>
                    </tr>
                    <input id="tr" type="hidden" value="${decEntryId}">
                </table>
                <div style='padding-left:250px;'>
                    <button class='bt' onclick='submit()'>提交</button>
                    <button class='bt' onclick="window.location.href='position/list'">返回</button>
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
<script src="resources/business-js/manager/new-position.js"></script>
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
        laydate.render({
            elem: '#updatetime', type: 'datetime' //指定元素
        });
    });

    var ueDuty = UE.getEditor('duty');
    var ueRequirement = UE.getEditor('requirement');
    var ueContact = UE.getEditor('contact');
    var ueRemark = UE.getEditor('remark');
    var uePosBrief = UE.getEditor('posBrief');

    /*薪酬待遇*/
    var jobSalary = UE.getEditor('jobSalary');
</script>

</body>
</html>