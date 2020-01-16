<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
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
            <input type="text" class="input_style" id="username" placeholder="请输入账号">
            <div id="readUsername"></div>
        </div>

        <div class="form-item form-item-password">
            <input type="password" class="input_style" id="password" placeholder="请输入密码">
            <div id="readPassword"></div>
        </div>

        <div class="form-item form-item-password">
            <input type="password" class="input_style" id="nickname" placeholder="请输入昵称">
            <em class="tag-type"></em>
        </div>
        <div class="form-item form-item-password">
            <input type="text" class="input_style" id="mobile" placeholder="请输入手机号">
            <em class="tag-type"></em>
            <div id="readMobile"></div>
        </div>

        <div class="form-item form-item-nc" data-method="post">
            <button class="submit-btn" onclick='register()' onclick="window.location.href = 'index.html'">注册账号</button>
        </div>
        <a  href="login">已有账号去登录</a>
    </div>
</div>
</body>
<script>
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });


    var register = function () {
        var username = $("#username").val();
        var password = $("#password").val();
        var nickname = $("#nickname").val();
        var mobile = $("#mobile").val();
        if ($("#readUsername").text() != "" && $("#readPassword") != "") {
            alert("请按照规范填写");
        } else {
            $.ajax({
                url: 'registering',
                data: {'username': username, 'password': password, 'nickname': nickname, 'mobile': mobile},
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    if (data.code == 0) {
                        window.location.href = "${path}/h5views/index";
                    } else if (data.code == -1) {
                        layer.alert(data.msg);
                    } else {
                        layer.alert(data.msg);
                    }
                }
            })
        }
    };

    /*校验参数信息*/
    //每个输入框都加上焦点触发事件
    $("#username").blur(function usernamea() {
        //获取字符串
        var str = document.getElementById("username").value;
        //判断首字符是否为字母
        var str_one = str.substr(0, 1);
        var str_start = str.length;
        var reg = /^[A-Za-z]/;
        if (!reg.test(str_one)) {
            $("#readUsername").text("用户名由字母数字组成,开头必须是字母");
            $("#readUsername").css("color", "red");
            $("#readUsername").css("font-size", "12px");
        } else if (str_start < 6 || str_start > 18) {
            $("#readUsername").text("用户名由6~18位组成");
            $("#readUsername").css("color", "red");
            $("#readUsername").css("font-size", "12px");
        } else {
            $("#readUsername").hide();
            $("#readUsername").text("");
        }
    });

    //密码js
    $("#password").blur(function passworda() {
            //获取字符串
            var str = document.getElementById("password").value;
            var str_start = str.length;
            var myReg = /[~!@#$%^&*()/\|,.<>?"'();:_+-=\[\]{}]/;
            if (!myReg.test(str)) {
                $("#readPassword").text("密码由字母数字组成");
                $("#readPassword").css("color", "red");
                $("#readPassword").css("font-size", "12px");
            } else if (str_start < 7 || str_start > 17) {
                $("#readPassword").text("密码由7~17位组成");
                $("#readPassword").css("color", "red");
                $("#readPassword").css("font-size", "12px");
            } else {
                $("#readPassword").hide();
                $("#readPassword").text("");
            }
        }
    );

</script>
</html>