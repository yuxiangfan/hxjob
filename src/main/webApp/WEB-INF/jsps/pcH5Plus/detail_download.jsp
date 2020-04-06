<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>校园智能招聘网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <link href="css/base.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <link href="css/recruit.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <style>
        .btn_style_xz{
            border: none;
            background-color: #ac6664;
            color: white;
            border-radius: 5px;
            margin-right: 4px;
        }
        .btn_style_zf{
            border: none;
            background-color: #00304F;
            color: white;
            border-radius: 5px;
            margin-right: 4px;
        }
        .btn_style_hy{
            border: none;
            background-color:#4F0000;
            color: white;
            border-radius: 5px;
            margin-right: 4px;
        }
        .btn_style_ff{
            border: none;
            background-color: #9A0002;
            color: white;
            border-radius: 5px;
            margin-right: 4px;
        }
        .com li span{
            font-size: 1.1em;
        }
        .com li{
            border-bottom: 1px solid #f3f3f3;
            padding: 5px 0;
        }
    </style>
</head>
<body class="bg_f5f">

<!--头部文件-->
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

<div class="content-wrap">


    <!--下载专区-->
    <div class="box_a">
        <div class="b_tit">
            <div class="tit"><em></em>下载专区</div>
        </div>
        <div class="bd ">
            <div class="every_see P_index5" style="padding: 10px;">
                <ul class="com">
                   <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button><button class="btn_style_ff ">付费</button><button class="btn_style_zf ">转发下载</button><button class="btn_style_hy ">会员专享</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button><button class="btn_style_ff ">付费</button><button class="btn_style_zf ">转发下载</button><button class="btn_style_hy ">会员专享</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                    <li><span>小编爆料资料大全</span><button class="btn_style_xz " style=" margin-left: 10px">下载</button></li>
                </ul>
            </div>
        </div>
    </div>
            <!--底部-->
    <footer class="br_foot">
        <div class="br_dflex">
            <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
            <div class="br_flex dh" style="margin-left: -36px">
                <a href="#">帮助</a><em></em>
                <a href="${path}/hm/login">登录</a><em></em>
                <a href="${path}/hm/register">注册</a><em></em>
                <p>校园智能招聘<br/>
                       By  合信码众</p>
            </div>
        </div>
    </footer>
</div>

</body>
</html>
