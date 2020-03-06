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
    <title>校园智能招聘-注册主页</title>
    <link rel="stylesheet" href="resources/pcPlus/css/style.css">
    <link rel="stylesheet" href="resources/pcPlus/css/login.css">
    <link href="resources/pc/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div class="login-wrap">
    <section class="login_box">
        <div class="login_container">
            <div class="login_logo">
                <a><img src="resources/pcPlus/images/logo.png" alt="logo"></a>
            </div>
            <div class="login_tabs">
                <form class="login-form" id="userInfoForm" method="post" action="#">

                    <%--  <input type="text" id="username" name="username" placeholder="" autocomplete="off" required><br>--%>
                    <div style="height: 35px">
                        <label class="pull-left" for="username">手机号:</label>
                        <input class="form-control" placeholder="手机号" id="username" type="text" autofocus="">
                        <div style="padding-left: 70px" id="readUsername"></div>
                    </div>
                    <%--验证码--%>
                    <div style="height: 35px">
                        <label class="pull-left" for="username">验证码:</label>
                        <input class="form-control" style="width: 20%" id="login_input" type="text" autofocus="">
                        <button class="a_box a_box1"
                                style="position: relative;left: 144px; top: -34px; height: 34px;width: 49px;background: #50D27D;border: none;color: #FFFFFF;">获取
                        </button>
                    </div>
                    <%--   <input type="password" id="password" name="password" placeholder="" autocomplete="off" required><br>--%>
                    <div style="height: 35px">
                        <label class="pull-left" for="password">密&nbsp&nbsp&nbsp码:</label>
                        <input class="form-control" placeholder="密码" id="password" type="password" value="">
                        <div style="padding-left: 70px" id="readPassword"></div>
                    </div>

                    <div style="height: 35px">
                        <label class="pull-left" for="nickname">昵&nbsp&nbsp&nbsp称:</label>
                        <input class="form-control" placeholder="昵称" id="nickname" type="text" value="">
                        <div style="padding-left: 70px" id="readNickname"></div>
                    </div>


                    <%--   <input class="login_submit_btn" type="submit" value="注册">--%>
                    <a href="JavaScript:void(0)" onclick='register()'><input type="button" class="login_submit_btn" value="注册账号"></a>
                    <a href="pcm/login">已有账号去登录</a>
                </form>
            </div>
        </div>
    </section>
</div>
<script src="resources/pcPlus/js/jquery-3.3.1.min.js"></script>
<script src="resources/layui/layui.js"></script>
<script src="resources/pcPlus/js/jquery.cookie.js"></script>
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
        if ($("#readUsername").text() != "验证通过" && $("#readPassword").text() != "验证通过" && $("#readNickname").text() != "验证通过") {
            alert("请按照规范填写");
        } else {
            $.ajax({
                url: 'pcm/registering',
                data: {'username': username, 'password': password, 'nickname': nickname, 'mobile': mobile},
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    if (data.code == 0) {
                        window.location.href = "pcviews/index";
                    } else if (data.code == -1) {
                        layer.alert(data.msg);
                    } else {
                        layer.alert(data.msg);
                    }
                }
            })
        }
    };
    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    });


    /*校验参数信息*/
    //每个输入框都加上焦点触发事件
    $("#username").blur(function usernamea() {
        //获取字符串
        var str = document.getElementById("username").value;
        //判断首字符是否为字母
        var str_one = str.substr(0, 1);
        var str_start = str.length;
        var reg = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if (!reg.test(str)) {
            $("#readUsername").text("输入的手机号不合法");
            $("#readUsername").css("color", "red");
            $("#readUsername").css("font-size", "12px");
        } else {
            $("#readUsername").text("验证通过");
            $("#readUsername").css("color", "green");
        }
    });

    /*检验验证码*/

    //密码js
    $("#password").blur(function passworda() {
            //获取字符串
            var str = document.getElementById("password").value;
            var str_start = str.length;
            var myReg = /[~!@#$%^&*()/\|,.<>?"'();:_+-=\[\]{}]/;
            if (!myReg.test(str)) {
                $("#readPassword").text("密码由字母数字组成,且由7-17位数组成");
                $("#readPassword").css("color", "red");
                $("#readPassword").css("font-size", "12px");
            } else if (str_start < 7 || str_start > 17) {
                $("#readPassword").text("密码由字母数字组成,且由7-17位数组成");
                $("#readPassword").css("color", "red");
                $("#readPassword").css("font-size", "12px");
            } else {
                $("#readPassword").text("验证通过");
                $("#readPassword").css("color", "green");

            }
        }
    );

    $("#nickname").blur(function nickname() {
        var str = document.getElementById("nickname").value;
        var str_start = str.length;
        if (str_start < 2) {
            $("#readNickname").text("昵称不能低于两个字符");
            $("#readNickname").css("color", "red");
            $("#readNickname").css("font-size", "12px");
        } else {
            $("#readNickname").text("验证通过");
            $("#readNickname").css("color", "green");
        }
    })

    //手机号JS
    $("#mobile").blur(function passworda() {
            //获取字符串
            var str = document.getElementById("mobile").value;
            var str_start = str.length;
            var myReg = /^1[3456789]\d{9}$/;
            if (!myReg.test(str)) {
                $("#readMobile").text("输入的手机号不正确");
                $("#readMobile").css("color", "red");
                $("#readMobile").css("font-size", "12px");
            } else {
                $("#readMobile").text("验证通过");
                $("#readMobile").css("color", "green");

            }
        }
    );

    /*手机验证码*/
    $(".a_box1").click(function () {
        checkCode();
    });

    function checkCode() {

        var url = "pcm/usernameCheck";
        var phone = $("#username").val();

        var data = {"phone": phone};
        $.post(url, data, function (res) {
            if (res.code != 200) {
                alert("获取验证码失败!");
            } else if (res.code == 200) {
                $.cookie("check", res.check);
                $.cookie("checktime", "60");
                alert($.cookie("check"));
                $(".a_box").html($.cookie("checktime"));
                $(".a_box1").unbind("click");
                times();
            }
        }, "json");
    }

    var time = $.cookie("checktime");
    if (!(time == null || time == "null" || time.length == 0 || time == 0)) {
        intervalId = setInterval(function () {
            var time = $.cookie("checktime");
            if (Number(time) > 0) {
                time = Number(time) - Number(1);
            }
            if (time == 0) {
                $(".a_box").html("获取");
                $.cookie("checktime", null);
                $.cookie("check", null);
                $('.a_box1').bind("click", function () {
                    checkCode();
                });
                clearInterval(intervalId);
            } else {
                $(".a_box").html(time);
                $.cookie("checktime", time);
            }
        }, 1000);
    } else {
        $(".a_box").html("获取");
    }

    function times() {
        intervalId = setInterval(function () {
            var time = $.cookie("checktime");
            if (Number(time) > 0) {
                time = Number(time) - Number(1);
            }
            if (time == 0) {
                $(".a_box").html("获取");
                $.cookie("checktime", null);
                $.cookie("check", null);
                $('.a_box1').bind("click", function () {
                    checkCode();
                });
                clearInterval(intervalId);
            } else {
                $(".a_box").html(time);
                $.cookie("checktime", time);
            }
        }, 1000);
    }


</script>
</body>
</html>