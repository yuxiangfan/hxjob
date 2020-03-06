<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pcH5Plus/css/login_new.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
</head>
<body>
<div class="login-wrap">
    <div class="beirui_logo"></div>
    <div class="pswd-wrap">
        <div class="form-item">
<span class="area-code">
<input type="hidden" name="regionCode" value="+86">
</span>
            <input id='username' type="text" class="input_style" placeholder="请输入账号">
        </div>
        <div class="form-item form-item-password">
            <input id='password' type="password" class="input_style" placeholder="请输入密码">
            <em class="tag-type"></em>
        </div>
        <div class="form-item form-item-nc" data-method="post">
            <div class="no-pswd">
                <a href="register" class="forget" style="margin-right: 10px;">没有账号?请注册</a>
            </div>
            <button class="submit-btn" onclick='logining()'>进入校园招聘</button>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
    /*处理登录信息*/
    var logining = function () {
        var username = $("#username").val();
        var password = $("#password").val();
        $.ajax({
            url: 'logining',
            data: {"username": username, "password": password},
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == 0) {
                    window.location.href = "${path}/h5views/index";
                } else {
                    layer.alert(data.msg);
                }
            }
        })
    };
</script>
</html>