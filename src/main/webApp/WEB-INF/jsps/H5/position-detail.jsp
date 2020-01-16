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
		<link rel="stylesheet" href="resources/pc/css/m.index.1.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
	</head>
	<body>
		<div class="head">
			<a onclick="javascript :history.back(-1);">
				<img src="resources/pc/icon/左箭头%20(1).png" />
			</a>
		</div>
		<div class="head_b">
			<div class="head_img">
				<img src="${systemConfig.domain}/${systemConfig.uploadFile}${pos.organization.logo}">
			</div>
			<div class="head_title">
				<strong>${pos.organization.shortname }</strong><br />
				<span>${pos.organization.cityname }.${pos.department }</span>
				<button style="float: right;" onclick="window.location.href='h5views/tocomment/${pos.organization.code}'">评论</button>
			</div>
		</div>
		<div class="fl">
		</div>
		<div class="comment">
			<h3>公司介绍</h3>
			<div class="content">
				<h4>${pos.organization.fullname }</h4>
				<p>
					${pos.organization.brief }
				</p>
			</div>
			<h3>岗位职责</h3>
			<div class="content">
				${pos.duty }
			</div>
			<h3>岗位要求</h3>
			<div class="content">
				${pos.requirement }
			</div>
			<h3>联系方式</h3>
			<div class="content">
				${pos.contact }
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
	
		$(function(){
			
		});
	
	
	</script>
	
</html>






