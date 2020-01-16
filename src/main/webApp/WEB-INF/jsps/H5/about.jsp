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
					<li class="group">
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
					<li class="group checked">
						<a href="h5views/about">
							<img src="resources/pc/icon/gongnengdingyi.png"/><br>
							<span>关于</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<section class="details_head">
			<div class="details_headinfo">
				<div class="head_body">
					<div class="head_img">
						<img style="height: 100%; width: 100%;" src="resources/pc/img/10289bd9f8a8422b5b3bb79c10b77d0c.jpg" />
					</div>
					<div class="head_name">
						<span style="float: left; color: #323232;">
							公司简介就是对公司，对企业的介绍。这种介绍不是一句话带过，也不是长篇大论，是简单扼要的介绍公司的一段文字，让别人初步了解公司的基本情况。
						</span>
					</div>
				</div>
			</div>
		</section>
		<div class="container ps_con clearfix">
			<h2 class="module_title">
				经营范围
			</h2>
			<section class="module_content">
				<div class="content_profile">
					<span>
						技术开发、技术咨询（中介除外）、技术服务；基础软件服务；应用软件服务；技术推广；销售计算机硬件及辅助设备。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；...
					</span>
				</div>
			</section>
			<h2 class="module_title">
				公司地址
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
				联系方式
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
	</body>
</html>
