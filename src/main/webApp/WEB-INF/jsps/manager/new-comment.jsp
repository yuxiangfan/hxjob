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
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap-theme.min.css">
    <link href="resources/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/_all-skins.css" rel="stylesheet" type="text/css"/>
    <link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/star/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${path}/resources/remak/css/amsify.suggestags.css">
    <link rel="stylesheet" href="${path}/resources/remak/css/normalize.css">
    <link href="resources/css/morris-0.4.3.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/morris-0.4.3.min.css" rel="stylesheet" type="text/css"/>
    <script src="resources/js/html5shiv.min.js"></script>
    <script src="resources/js/respond.min.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/bootstrap-3.4.1/dist/js/bootstrap.min.js"></script>
    <script src="resources/pc/layui/layui.js"></script>
    <script src="${path}/resources/star/js/star-rating.js" type="text/javascript"></script>
    <script src="${path}/resources/remak/js/jquery.amsify.suggestags.js"></script>



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
                <c:if test="${com.id==null }">新增点评</c:if>
                <c:if test="${com.id!=null }">编辑点评</c:if>
            </h1>

        </div>
        <div class="content">
            <div class='ranger'>
                <form class="layui-form" action="" id="remark">
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">用户名</span>
                        <input type="text" name="username" class="form-control" id="username" value="${com.nickname}">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">公司名称</span>
                        <div class="form-group">
                            <select name="orgcode" id="orgcode" class="form-control">
                                <option value="">请选择</option>
                                <c:forEach items="${organizations}" var="organization">
                                    <option value="${organization.code}"
                                            <c:if test="${com.orgcode==organization.code}">selected</c:if>>
                                            ${organization.fullname}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <input type="hidden" name="id" id="id" value="${com.id}">
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">公司地区</span>
                        <div class="form-group">
                            <select name="city" id="city" class="form-control">
                                <option value="">请选择</option>
                                <c:forEach items="${cities}" var="city">
                                    <option value="${city.id}" <c:if test="${com.city==city.id}">selected</c:if>>
                                            ${city.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">岗位状态</span>
                        <%-- <input type="text"  name="postStatus" class="form-control"
                                placeholder="在职-离职-实习">--%>
                        <div class="form-group">
                            <select name="postStatus" id="postStatus" value="${com.postStatus}" class="form-control">
                                <option value="">请选择</option>
                                <option value='应届生' <c:if test="${position.type=='应届生'}">selected</c:if>>应届生</option>
                                <option value='实习生' <c:if test="${position.type=='实习生'}">selected</c:if>>实习生</option>
                                <option value='培训生' <c:if test="${position.type=='培训生'}">selected</c:if>>培训生</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工龄(在职)</span>
                        <input type="number" name="workyear" id="workyear" value="${com.workyear}" placeholder="填写在职时长总和"
                               class="form-control" aria-label="...">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">量化评价(必填)</span>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工资税前</span>
                        <input name="salaryPreTax" id="salaryPreTax" value="${com.salaryPreTax}" type="number" class="form-control"
                               placeholder="为一年的税前工资为基准">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">额外福利</span>
                        <input type="text" name="otherBenefit" id="otherBenefit" value="${com.otherBenefit}" class="form-control"
                               placeholder="五险一金或其他">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">年终奖金</span>
                        <input type="number" id="yearEndMoney" name="yearEndMoney" value="${com.yearEndMoney}" class="form-control"
                               placeholder="为一年的年终奖为基准">
                    </div>
                    <br>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">成长性</span>
                        <div class="form-group">
                            <select name="growth" id="growth" class="form-control">
                                <option value="5">非常快</option>
                                <option value="4">成长快</option>
                                <option value="3">一般</option>
                                <option value="2">成长慢</option>
                                <option value="1">非常缓慢</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工作量</span>
                        <div class="form-group">
                            <select name="workload" id="workload" class="form-control">
                                <option value="5">非常清闲</option>
                                <option value="4">清闲</option>
                                <option value="3">不加班</option>
                                <option value="2">经常加班</option>
                                <option value="1">疯狂加班</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">文化环境</span>
                        <div class="form-group">
                            <select name="culturalContext" id="culturalContext" class="form-control">
                                <option value="5">氛围极好</option>
                                <option value="4">氛围好</option>
                                <option value="3">正常</option>
                                <option value="2">正常</option>
                                <option value="1">极差</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7 ">
                        <div><span class="input-group-addon">综合满意度</span></div>
                        <br>
                        <br>
                        <input id="satisfaction" name="satisfaction" value="4" type="text" class="rating" data-min=0
                               data-max=5 data-step=0.2
                               data-size="xs"
                               required title="">
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">文字评价(必填):</span>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">评价</span>
                        <input name="theme" id="theme" type="text" value="${com.theme}" class="form-control" placeholder="主题">
                        <textarea id="writingEvaluation" name="writingEvaluation" class="textArea form-control"
                                  placeholder="文字描述">${com.writingEvaluation}</textarea>
                        <input value="可选" id="imgUpload" name="imgUpload" type="file" class="form-control">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">评价标签(选填):</span>
                    </div>
                    <br>
                    <input class="form-control" name="evaluateLabel" type="text" id="evaluateLabel"
                           value="压力不大,倒卖军火的不要去,里面都是通缉犯, 还可以,不怕死可以去">
                    <script>
                        $('input[name="evaluateLabel"]').amsifySuggestags({
                            type: 'amsify',
                            tagLimit: 8
                        });
                    </script>
                    <br>
                </form>
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
<script src="resources/business-js/manager/new-comment.js"></script>
<script src="resources/business-js/common.js"></script>
<script src="resources/js/json2.js"></script>


</body>
</html>