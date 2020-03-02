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
		<title>贝睿网——精选</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/selected_text.css" />
		<link rel="stylesheet" href="resources/pc/css/selected.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/business-js/pc/selector-detail.js"></script>
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
			<section class="l_con clearfix" style='padding: 0 10px 20px;background-color:#f9f9f9'>
				<div style='height:100%;margin:0 auto;padding:5px;text-align:center;'>
					<div style="text-align:center;font:bold 26px '微软雅黑';margin-bottom:10px;border-bottom:solid 2px #ccc">用微信扫描下面二维码完成支付</div>
					<img alt="" style='width:350px;margin-top:50px;' src="resources/images/pay-qr-code.png">
				</div>
			</section>
			<section class="r_con clearfix">
				<div style="margin-top: 10px; border-bottom: 1px solid #eaeaea;background: #f5f7f9;color: #333;
				height: 50px;line-height: 50px;text-indent: 20px;font-size: 14px;">
					<p>相关课程推荐</p>
				</div>
				<div class='group_recommend'>
<!-- 					<div class="r_box"> -->
<!-- 						<div class="r_box_img"> -->
<!-- 							<img src="img/量化.jpg"/> -->
<!-- 						</div> -->
<!-- 						<div class="r_box_text"> -->
<!-- 							<p style="font-size: 12px;color: #4f4f4f;font-weight: bold;line-height: 20px;">量化投资</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
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
	<script type="text/javascript">
		var rootPath  = '${systemConfig.domain}/${systemConfig.uploadFile}';
	</script>
</html>
