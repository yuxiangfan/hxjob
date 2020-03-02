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
		<title>贝睿网——机构点评</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/comment.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/business-js/pc/org.js"></script>
		<script src="resources/layui/layui.js"></script>
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
						<a href="pcviews/selector">校园杂志</a>
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

		<div class="container ps_con clearfix">
			<section class="l_con clearfix">
				<div class="group">
					<h2 class="group_head">所属行业</h2>
					<div style="padding-top: 10px;" id='industries'>
						<a class="group_body" href="javascript:void(0)" style='color:#fb8341' val='' >全部</a>
						<c:forEach var = 'industry' items='${industries}'>
							<a class="group_body" href="javascript:void(0)" val='${industry.id}'>${industry.name}</a>
						</c:forEach>
					</div>
				</div>
				<div class="group">
					<h2 class="group_head">所在地区</h2>
					<div style="padding-top: 10px;" id='cities'>
						<a class="group_body" href="javascript:void(0)" style='color:#fb8341' val='' >全部</a>
						<c:forEach var = 'city' items='${cities}'>
							<a class="group_body" href="javascript:void(0)" val='${city.id}' >${city.name}</a>
						</c:forEach>
					</div>
				</div>
			</section>
			<section class="r_con clearfix" id='orgs' style='width:64%'>
			
<!-- 				<div class="information" style=""> -->
<!-- 					<div class="information_img"> -->
<!-- 						<img style="height: 100%;width: 100%;" src="img/10289bd9f8a8422b5b3bb79c10b77d0c.jpg" /> -->
<!-- 					</div> -->
<!-- 					<div class="information_post"> -->
<!-- 						<div class="information_head"> -->
<!-- 							<a class="h1" href="tocomment.html">华泰证券</a> -->
<!-- 							<span> 平均薪酬：3万/月&nbsp&nbsp&nbsp&nbsp;综合评分：8分</span> -->
<!-- 						</div> -->
<!-- 						<div class="information_body"> -->
<!-- 							<p>标签：商券</p> -->
<!-- 						</div> -->
<!-- 						<div class="information_footer"> -->
<!-- 								<p> -->
<!-- 									行业：券商 &nbsp;&nbsp;&nbsp;贝睿评级：I级 &nbsp;&nbsp;&nbsp;点评数据（550条） -->
<!-- 									<span style="float:right"><a href="#">赞</a> &nbsp;&nbsp; &nbsp;&nbsp;<a href="#">收藏</a> &nbsp;&nbsp; &nbsp;&nbsp;<a href="#">写点评</a> </span> -->
<!-- 								</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
					
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
	<script>
		var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
		
		
	</script>
</html>
