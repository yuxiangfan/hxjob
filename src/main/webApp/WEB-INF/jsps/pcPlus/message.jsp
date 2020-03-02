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

    <!--局部修改-->
    <style type="text/css">
        .li_image {
            height: 20%;
            width: 20%;
            position: absolute;
            left: 40px;
            top: 30px;
        }

        .p_dn_a {
            position: absolute;
            width: 530px;
            right: 80px;
            top: 105px;
        }

        .home_con_li {
            background-color: beige;
            width: 100%;
            height: 280px;
            margin-bottom: 10px;
        }

        .div_from {
            margin-top: 200px;
        }

        .li_a_sx {
            color: white !important;
            position: absolute;
            left: 20px;
            top: 5px;
        }

        .div_h3 {
            font-size: 24px !important;
            position: absolute;
            left: 145px;
            top: 50px;
        }

        .div_p {
            position: absolute;
            font-size: 12px;
            left: 200px;
            top: 59px;

        }

        .div_p_gq {
            position: absolute;
            font-size: 10px;
            left: 200px;
            top: 48px;
        }

        .badge {
            font-size: 12px;
            width: 70px;
            padding: 0px;
            margin: 0px;
            height: 8px;
            position: absolute;
            left: 145px;
            top: 82px;
            background-color: #1b6d85;
            color: white;
        }

        .salary {
            position: absolute;
            left: 145px;
            top: 29px;
        }

        .div_span_yx {
            position: absolute;
            z-index: 10;
            left: 10px;
            top: 10px;

        }

        .div_ly {
            background-color: #1b6d85;
            margin-left: 20%;
            height: 120px;
            width: 600px;
        }

        .div_image {
            width: 15%;
            border-radius: 100px;
            position: absolute;
            top: 300px;
            left: 200px;
        }

        .div_image_yuan {
            position: absolute;
            width: 23%;
            top: 300px;
            left: 80px;
        }

        .div_ul {
            padding-top: 60px;
            margin-left: 175px;
            line-height: 25px;
            font-size: 18px;
            color: white;
        }

        .div_span_name {
            position: absolute;
            left: 320px;
            top: 320px;
            color: white;
            font-size: 24px;
        }

        .div_span_gl {
            position: absolute;
            left: 310px;
            top: 310px;
            color: white;

        }
        .div_from {
            position: absolute;
            left: 260px;
            top: 260px;
        }
    </style>
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
                <a href="index.jsp#good">校园杂志</a>
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

<!--中间内容-->
<div class="container" id="container">

    <div class="wrapper row">

        <!--左边-->
        <div id="div_diplay" class="per_con_l btn-group-vertical col-md-3">
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

        <!--右边-->
        <div class="per_con_r col-md-9">

            <div style="background-color: #f6f6f6;width: 100%;height: 600px;margin-bottom: 10px;">

                <!--第一条-->
                <li class="home_con_li">
                    <a href="detail_company.jsp" target="_blank">
                        <img class="li_image" src="images/1111.png" alt="#">
                    </a>

                    <div class="h_c_l_wrap li_div">
                        <div>
                            <a href="message.jsp" class="li_a_sx">私信</a>
                        </div>
                        <div>
                            <h3 class="div_h3"><span><strong>啊呆</strong></span></h3>
                            <p class="div_p_gq">个性签名:</p>
                            <p class="div_p">苦海无涯,苦做舟;学海无边,书做舟;学无止境啊</p>
                            <span class="badge">在职三年</span>
                            <span class="salary">国泰君安证券</span>
                        </div>
                        <p class="p_dn_a">中国银行全称是中国银行股份有限公司（Bank of China Limi银行股份有限公司（Bank of China
                            Limited，简称BOC），总行(Head
                            Office)位于北京复兴门内大街1号，是五大国有商业银行股份有限公司（Bank of China Limited，简称BOC），总行(Head
                            Office)位于北京复兴门内大街1号，是五大国有商业ted，简称BOC），总行(Head
                            Office)位于北京复兴门内大街1号，是五大国有商业银行之一。中国银行的业务范围涵盖商哈后哈哈哈哈
                        </p>
                    </div>
                </li>

                <!--其他用户留言-->
                <div class="div_ly">
                    <img src="images/h1.png" alt="" class="div_image_yuan">
                    <img class="div_image" src="images/beibei.jpg" alt="#">
                    <span class="badge div_span_gl">在职三年</span>
                    <span class="div_span_name">beibei</span>
                    <ul class="div_ul">
                        <li><strong>回复阿呆:</strong></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还行吧,作为单位很ok,福利不错,待遇ok</li>
                    </ul>
                </div>

                <!--<表单></表单>-->
                <div class="div_from">
                    <form role="form">
                        <div class="form-group">
                            <textarea class="form-control" rows="3" style="width: 400px;"
                                      placeholder="写下您的留言哦~"></textarea>
                        </div>
                    </form>
                    <button type="button" class="btn btn-warning" style="margin-left:90%;">确认</button>
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