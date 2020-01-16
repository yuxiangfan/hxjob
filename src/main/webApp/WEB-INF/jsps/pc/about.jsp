<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
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
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta http-equiv="Cache-Control" content="no-transform ">
		<meta name="viewport" content="width=device-width">
		<title>贝睿网</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/about.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/business-js/pc/common.js"></script>
	</head>
	<body>
		<header class="global">
			<div class="header <clearfi></clearfi>x">
				<a style="float: left;" href="pcviews/index"> <img src="resources/pc/picture/logo_top_1.jpg" style="height: 65px;"></a>
				<nav>
					<div class="h_left">
						<a href="pcviews/pos">招聘/实习</a>
						<a href="pcviews/org">机构点评</a>
						<a href="pcviews/character">个人性格测评</a>
						<a href="pcviews/poscom">个人职业测评</a>
						<a href="pcviews/selector">贝睿精选</a>
						<a href="pcviews/about">关于</a>
					</div>
				</nav>
				<div class="unlogin clearfix">
					<div class="login">
						<a ka="head-signin" href="pcm/login" rel="nofollow">登录</a><em></em><a ka="head-signup" href="pcm/register" rel="nofollow">注册</a>
					</div>
				</div>
				<div class="h_search">
					<input type="text" name="q" id="header-search" class="h_search_text" placeholder="搜索感兴趣的公司或职位" autocomplete="off" />
					<input class="h_search_submit" value="" type="button" id="search">
				</div>
			</div>
		</header>
		<section class="details_head">
			<div class="details_headinfo">
				<div class="head_body">
					<div class="head_img">
						<img style="height: 100%; width: 100%;" src="resources/pc/picture/logo_top_1.jpg" />
					</div>
					<div class="head_name">
						<h1>贝睿</h1>
						<span style="float: left; color: #d2d2d2;">
							公司简介就是对公司，对企业的介绍。这种介绍不是一句话带过，也不是长篇大论，是简单扼要的介绍公司的一段文字，让别人初步了解公司的基本情况。
						</span>
					</div>
				</div>
			</div>
		</section>
		<div class="container ps_con clearfix">
			<h2 class="module_title">
				<p class="f_left">经营范围</p>
			</h2>
			<section class="module_content">
				<div class="content_profile">
					<span>
						技术开发、技术咨询（中介除外）、技术服务；基础软件服务；应用软件服务；技术推广；销售计算机硬件及辅助设备。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；...
					</span>
				</div>
			</section>
			<h2 class="module_title">
				<p class="f_left">公司地址</p>
			</h2>
			<section class="module_content">
				<div class="content_profile">
					<span>
					北京：北京市海淀区成府路45号中关村智造大街<br />
					北京：北京市房山区弘安路85号中关村新兴产业前沿技术研究院<br />
					天津：天津市东丽经济技术开发区五经路1号<br />
					</span>
				</div>
			</section>
			<h2 class="module_title">
				<p class="f_left">联系方式</p>
			</h2>
			<section class="module_content">
				<div class="content_profile">
					<div style="margin-top: 20px;">
						<span>
							xxx<br />xxx<br />xxx<br />
						</span>
					</div>
				</div>
			</section>
		</div>
		<footer>
			<div class="footer_wrapper">
				<div class="copyright">
					<p class="foot_kanzhun"><em>Bei</em>Rui.</p>
					<p class="mt5">
						Copyright © 2019 beirui.com京ICP备14013441号-1
						<span class="ml10">京公网安备11001505034210</span>
					</p>
					<p class="mt5">beirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
					<p class="mt5">顺通网络提供<a style="color: #FFFFFF;" href="http://www.25175.net/web/Default.aspx" target="_blank">技术支持</a></p>
				</div>

			</div>
		</footer>
	</body>
</html>




