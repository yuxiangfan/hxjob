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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta content="telephone=no, email=no" name="format-detection" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="HandheldFriendly" content="true" />
		<meta name="MobileOptimized" content="320" />
		<meta name="screen-orientation" content="portrait" />
		<meta name="x5-orientation" content="portrait" />
		<meta name="keywords" content="贝睿网" />
		<meta name="description" content="贝睿网" />
		<title>贝睿网</title>
		<link rel="stylesheet" href="resources/pc/css/m.public.css" />
		<link rel="stylesheet" href="resources/pc/css/m.sort.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/business-js/H5/common.js"></script>
	</head>
	<body>
		<div class="frame">
			<div class="head_a">
				<!-- <span class="javascript"></span> -->
				<center>贝睿网</center>
				<div class="input">
					<div class="input_text">
						<input type="text" class="text" placeholder="搜公司、找职位">
					</div>
					<div class="input_btn">
						<input type="button" class="btn" id='search'>
					</div>
				</div>
			</div>
			<div class="head_b">
				<ul>
					<li class="group ">
						<a href="h5views/pos">
							<img src="resources/pc/icon/hezuohuobanmiyueguanli.png"/><br>
							<span>招聘</span>
						</a>
					</li>
					<li class="group ">
						<a href="h5views/org">
							<img src="resources/pc/icon/peiwangyindao.png"/><br>
							<span>点评</span>
						</a>
					</li>
					<li class="group checked">
						<a href="h5views/totest">
							<img src="resources/pc/icon/ceshishenqing.png"/><br>
							<span>测评</span>
						</a>
					</li>
					<li class="group">
						<a href="h5views/selector">
							<img src="resources/pc/icon/biaodanzujian-biaoge.png"/><br>
							<span>精选</span>
						</a>
					</li>
					<li class="group">
						<a href="h5views/about">
							<img src="resources/pc/icon/gongnengdingyi.png"/><br>
							<span>关于</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="body">
			<div class="body_title" >
				<a href="h5views/character">
					<div class="body_title_name">
						个人性格测评
					</div>
					<div class="body_title_comment">
						<h6>这是一份来自专业金融职前培训机构-贝睿的一份基于性格色彩学的测评，它将有助于测试者深入了解自己的深层次性格，从而帮助自己得到更好的职业定位。</h6>
					</div>
					<span class="gt" style="">
						<img src="resources/pc/icon/right.png" />
					</span>
				</a>
			</div>
			<div class="body_title" >
				<a href="h5views/poscom">
					<div class="body_title_name">
						个人职业测评
					</div>
					<div class="body_title_comment">
						<h6>这是一份来自专业金融职前培训机构-贝睿的一份专业的测评。</h6>
					</div>
					<span class="gt" style="">
						<img src="resources/pc/icon/right.png" />
					</span>
				</a>
			</div>
			
		</div>
	</body>
</html>
