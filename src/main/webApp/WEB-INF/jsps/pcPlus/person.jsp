<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/person.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/bootstrap-3.4.1/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
</head>
<body>
<!--头-->
<header>
    <div class="postion_a">
        <div class="header">
            <img src="images/logo.png" class="h_logo">
            <nav class="font_a">
                <a href="index.jsp#home" class="home">首页</a>
                <a href="index.jsp#job">招聘信息</a>
                <a href="index.jsp#company">机构点评</a>
                <a href="index.jsp#good">贝睿精选</a>
                <a href="index.jsp#test">智能职测</a>
                <a href="index.jsp#day">考试日历</a>
            </nav>
            <div class="login">
                <a href="login.jsp">登录</a>
                <em></em>
                <a href="registered.jsp">注册</a>
            </div>
            <div class="h_search">
                <form action="detail_job.jsp" method="get" target="_blank">
                    <input class="h_search_text form-control" name="h_search" type="text" placeholder="搜索职位或公司"
                           autocomplete="off">
                    <input class="h_search_submit_a" type="submit" value="">
                </form>
            </div>
        </div>
    </div>
</header>

<div class="container" id="container">
    <div class="wrapper row">
        <div class="per_con_l btn-group-vertical col-md-3">
            <button class="btn btn-lg btn-default ">
                <span class="glyphicon glyphicon-user">&nbsp;</span>个人资料
            </button>
            <button class="btn btn-lg btn-default ">
                <span class="glyphicon glyphicon-tags">&nbsp;</span>我的收藏
            </button>
            <button class="btn btn-lg btn-default ">
                <span class="glyphicon glyphicon-envelope">&nbsp;</span>我的消息
            </button>
        </div>
        <div class="per_con_r col-md-9">
            <div class="grxx">
                <h3 class="col-md-12">个人信息</h3>
                <div class="grxx_con row">
                    <div class="col-md-3">
                        <img class="img-thumbnail" src="" alt="">
                        <button class="btn btn-block">修改头像</button>
                        <button class="btn btn-block">修改密码</button>
                    </div>
                    <div class="col-md-9">
                        <form class="form-horizontal" action="" role="form">
                            <!--//昵称-->
                            <div class="form-group">
                                <label for="name" class="control-label col-md-2 pull-left">昵称:</label>
                                <div class="col-md-10">
                                    <input class="form-control" id="name" type="text">
                                </div>
                            </div>
                            <!--//生日-->
                            <div class="form-group">
                                <label for="birthday" class="control-label col-md-2 pull-left">生日:</label>
                                <div class="col-md-10">
                                    <input class="form-control" id="birthday" type="text">
                                </div>
                            </div>
                            <!--性别-->
                            <div class="form-group">
                                <label class="col-md-2 text-right">性别:</label>
                                <div class="col-md-10">
                                    <label class="radio-inline"><input type="radio" name="gender">男</label>
                                    <label class="radio-inline"><input type="radio" name="gender">女</label>
                                </div>
                            </div>
                            <!--//地址-->
                            <div class="form-group">
                                <label for="site" class="control-label col-md-2 pull-left">地址:</label>
                                <div class="col-md-10">
                                    <input class="form-control" id="site" type="text">
                                </div>
                            </div>
                            <!--//手机号-->
                            <div class="form-group">
                                <label for="phone" class="control-label col-md-2 pull-left">手机号:</label>
                                <div class="col-md-10">
                                    <input class="form-control" id="phone" type="number">
                                </div>
                            </div>
                            <!--//邮箱-->
                            <div class="form-group">
                                <label for="email" class="control-label col-md-2 pull-left">邮箱:</label>
                                <div class="col-md-10">
                                    <input class="form-control" id="email" type="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <button class="btn btn-info btn-lg">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--尾-->
<footer>
    <div class="footer">
        <nav>
            <a href="javascript:;">关于我们</a>
            <a href="javascript:;">意见反馈</a>
            <a href="javascript:;">使用帮助</a>
            <a href="javascript:;">用户协议</a>
        </nav>
        <div class="foot_left">
            <p class="foot_ebeirui"><em>贝睿</em>教育</p>
            <p>
                Copyright © 2019 ebeirui.com京ICP备#####
                <span class="ml10">京公网安备############</span>
            </p>
            <p>ebeirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
        </div>
        <div class="foot_right">
            <img src="images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>

</body>
</html>