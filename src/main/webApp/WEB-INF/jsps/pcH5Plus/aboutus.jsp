<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="css/base.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>关于贝睿</title>
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
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>贝睿精选</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>
<div class="wrapper">
    <div class="content">
        <h2 class="tt_greenline"><i></i>关于贝睿</h2>
        <p class="detail">
            贝睿（www.beirui.com）是中国领先的企业点评、雇主品牌展示和员工分享平台。建立于2008年11月，曾用名“分智网”（www.fenzhi.com）。截止到目前，贝睿网注册用户数5800万，月活用户数4146万，企业注册数260万家，官方认证企业16万家，UGC总量超过1521.9万。</p>
        <p class="detail">贝睿每一位小伙伴，身为上班族，心里装有上班族，崇尚“用户至上”。 贝睿平台为用户提供雇主基本信息、雇主评价、薪酬资讯、面试经验、招聘职位等信息。
        </p>
        <p class="detail">其中，雇主基本信息可以由公司管理者认领并维护，也可以由雇员自主提供。</p>
        <p class="detail">其中，雇主评价、薪酬资讯等，由企业员工或离职两年以内的老员工匿名提供。 </p>
        <p class="detail">其中，面试信息由参加面试的候选人提供。</p>
        <p class="detail">其中，贝睿以雇主自主发布、雇主官网发布或平台之间合作的方式，经严格筛选后提供最新职位给用户。</p>
        <h2 class="tt_greenline"><i></i>公司愿景</h2>
        <p class="detail">贝睿倡导员工和雇主之间“参与”、“分享”、“尊重”。 我们坚信，成功的人生离不开高效的事业。高效的事业离不开高效的选择。高效的选择来自全面、真实、新鲜的资讯。</p>
        <p class="detail">在一个数亿人上班，数百万企业运营的国度： “人人为我，我为人人”的“参与”是唯一途径。 “有话就说，实话实说”的“分享”最值得崇尚。 雇主、雇员彼此尊重可以令这块国土每天美好多一点。
            相信，有了大家的参与，必定会有更多公司重视员工感受，必定会有更多公司优化员工关系，必定会有更多公司提升招聘效率。 </p>
        <p class="detail"> 我们每天为此努力。</p>
        <h2 class="tt_greenline"><i></i>联系我们</h2>
        <dl class="contact">
            <dt>客服支持：beirui.com</dt>
            <dd>工作时间：周一到周五，上午9：00至19：00</dd>
            <dd>微信公众号：贝睿网</dd>
        </dl>
    </div>
</div>
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
</body>
</html>