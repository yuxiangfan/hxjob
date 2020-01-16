<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>"/>
    <title>贝睿科技-登录主页</title>
    <link rel="stylesheet" href="resources/pcPlus/css/style.css">
    <link rel="stylesheet" href="resources/pcPlus/css/login.css">
    <link href="resources/pc/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--百度统计-->
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?7da1657e225ee069bfc18d0b34754e2c";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body>

<div class="login-wrap">
    <section class="login_box">

        <div class="login_container">
            <div class="login_logo">
                <a href="#"><img src="resources/pcPlus/images/logo.png" alt="logo"></a>
            </div>
            <div class="login_tabs">
                <form class="login-form" id="userInfoForm" method="post" action="#">
                    <label class="pull-left" for="username">手机号:</label>
                    <%--  <input type="text" id="username" name="username" placeholder="" autocomplete="off" required><br>--%>
                    <div>
                        <input class="form-control" placeholder="登录" name="mobile" autocomplete="off" required
                               id='username' type="text" autofocus="">
                    </div>

                    <%-- <input type="password" id="password" name="password" placeholder="" autocomplete="off" required><br>--%>
                    <div>
                        <label class="pull-left" for="password">密&nbsp&nbsp&nbsp码:</label>
                        <input class="form-control" placeholder="密码" name="password" autocomplete="off" required
                               id='password' type="password" value="">
                    </div>

                    <a style="float: left;margin-left: 60px;"><input style="float: left;width: 24px;" type="checkbox" id="autoLogin" value="YES"/>自动登录</a>

                    <a src="#" class="forgetPassword" style="float: right; color: #337ab7">忘记密码？</a>

                    <%--  <input class="login_submit_btn" type="submit" value="进入贝睿">--%>
                    <a href="javascript:void(0)" onclick='logining()'><input type="button"
                                                                             class="login_submit_btn"
                                                                             value="进入贝睿"></a>
                    <a href="pcm/register">没有账号，请注册</a>
                    <span style="position: relative;left: 125px;">第三方登录</span>
                    <div style="position: relative;left: 170px"><a src="#"><img src="resources/pcPlus/images/QQ.png"
                                                                                style="height: 15%;width: 15%;cursor:pointer;"></a>
                        <a src="#"><img src="resources/pcPlus/images/WeChat.png"
                                        style="height: 15%;width: 15%;cursor:pointer;"></a>
                        <a src="#"><img src="resources/pcPlus/images/phone.png"
                                        style="height: 15%;width: 15%;cursor:pointer;"></a></div>

                </form>
            </div>
        </div>
    </section>
</div>
<script src="resources/pcPlus/js/jquery-3.3.1.min.js"></script>
<script src="resources/layui/layui.js"></script>
<script>
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
    /*处理登录信息*/
    var logining = function () {
        var username = $("#username").val();
        var password = $("#password").val();
        var autoLogin = $("#autoLogin").val();
        $.ajax({
            url: 'pcm/logining',
            data: {"username": username, "password": password, "autoLogin": autoLogin},
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == 0) {
                    window.location.href = "pcviews/index";
                } else {
                    layer.alert(data.msg);
                }
            }
        })
    };

    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    });
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    });
</script>
</body>
</html>