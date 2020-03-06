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
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>校园智能招聘</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="row " id="login">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="logo">校园智能招聘网站后台管理系统</div>
        <form action="logining" method='post' id='loginForm'>
            <div class="form-group">
                <input class="form-control" placeholder="用户名" id="username" name='userName' type="text" autofocus=""
                       maxLength='32'>
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="密码" id="password" name="password" type="password" value=""
                       maxLength='32'>
            </div>
            <a href="javascript:void(0)" onclick='logining()'><input type="button" class="btn btn-block btn-yellow"
                                                                     value="登录"></a>
        </form>

        <div class="copyright">
            <p>Powered by <a href="#" target="_Blank" style="color: #f0ad4e;">合信码众</a></p>
        </div>

    </div><!-- /.col-->
</div><!-- /.row -->


<script src="resources/js/jQuery-2.1.4.min.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/layui/layui.js"></script>

<script>
    var layer;

    layui.use('layer', function () {
        layer = layui.layer;
        if (message != undefined && message.length > 0) {
            layer.alert(message);
        }
    });

    var logining = function () {
        $("#loginForm").submit();
    };

    var message = '${msg}';

</script>
</body>
</html>

