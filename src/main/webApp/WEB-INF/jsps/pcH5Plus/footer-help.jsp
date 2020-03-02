<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>贝睿-使用帮助</title>
    <link rel="stylesheet" href="css/base.css"/>
    <link rel="stylesheet" href="css/profiles.css"/>
</head>
<body>
<!--头部-->
<div class="head">
    <div class="head_container">
        <div class="top">
            <img class="logo_br" src="${path}/resources/pcH5Plus/images/logo_br.png">
            &nbsp;&nbsp
            <a class="a_login" href="${path}/hm/login">登入</a>
        </div>
        <form>
            <div class="serch br_dflex input">
                <div class="br_flex">
                    <input type="search" placeholder="搜公司、找职位" class="key">
                </div>
                <div class="serch_btn input_btn"><input name="btn" class="btn" id='search'></div>
            </div>
        </form>
        <div class="tab br_dflex">
            <div class="tit br_flex"><a href="${path}/h5views/index"><i class="a1 "></i><span>首页</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>校园杂志</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>
<div class="wrapper">
    <div class="content">
        <h2 class="tt_greenline"><i></i>注册规则</h2>
        <dl class="contact interval">
            <dd>1） 用户应当严格遵循贝睿系统设置的注册流程完成注册。</dd>
            <dd>2） 用户在选择其贝睿用户名时应遵守国家法律法规，不得包含违法、涉嫌侵犯他人权利或干扰网站运营秩序等相关信息。</dd>
        </dl>
        <h2 class="tt_greenline"><i></i>如何使用第三方登录</h2>
        <dl class="contact interval">
            <dd>1） 第三方登录是指用其他社交平台帐号登录贝睿，目前支持新浪微博平台和人人平台，您可在登录页点击相应的按钮通过第三方登录贝睿，如果是第一次登录需要授权，贝睿承诺不会泄露您的任何私人信息。</dd>
            <dd>2） 用户在选择其贝睿用户名时应遵守国家法律法规，不得包含违法、涉嫌侵犯他人权利或干扰网站运营秩序等相关信息。</dd>
        </dl>
        <h2 class="tt_greenline"><i></i>忘记密码怎么找回？</h2>
        <dl class="contact interval">
            <dd>1） 在登录页面点击“忘记密码”，进入找回密码页。</dd>
        </dl>
    </div>
</div>
<!--底部-->
<!--底部-->
<footer class="br_foot">
    <div class="br_dflex">
        <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
        <div class="br_flex dh" style="margin-left: -36px">
            <a href="footer-help.jsp">帮助</a><em></em>
            <a href="${path}/hm/login">登录</a><em></em>
            <a href="${path}/hm/register">注册</a><em></em>
            <p>Copyright © 2019 beirui.com<br/>
                贝睿网 版权所有</p>
        </div>
    </div>
</footer>

<script src="js/jquery-2.1.1.min.js"></script>


</body>
</html>