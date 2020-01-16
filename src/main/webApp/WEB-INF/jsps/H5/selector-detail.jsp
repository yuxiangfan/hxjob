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
		<!-- <link rel="stylesheet" href="css/m.index.1.css" /> -->
		<link rel="stylesheet" href="resources/layui/css/layui.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
		<script type="text/javascript" src="resources/business-js/H5/selector-detail.js"></script>
		<style>
			.head{
				width: 100%;
				height: 40px;
			}
			.head img{
				height: 25px;
				margin-top: 8px;
				margin-left: 1%;
			}
			.head_b{
				width: 100%;
				min-height: 50px;
				display: inline-block;
				/* border-bottom: 1px solid #DBDBDB; */
				padding-bottom: 5px;
			}
			.content_head{
				min-height: 100px;
				width: 100%;
				display: inline-block;
			}
			.head_img{
				width: 30%;
			    float: left;
			}
			.head_img img{
				width: 100%;
			}
			.head_text{
				width: 31%;
			    min-height: 100px;
			    float: left;
			    line-height: 180%;
			    margin-left: 3%;
			}
			p i{
				color: #ff7800;
			}
			.head_text button{
				width: 80%;
				height: 40px;
			    line-height: 40px;
			    color: #fff;
			    text-align: center;
			    border-radius: 2px;
			    float: left;
			    margin: 5px;
			    cursor: pointer;
				border: none;
			}
		</style>
	</head>
	<body>
		<div class="head">
			<a onclick="javascript :history.back(-1);">
				<img src="resources/pc/icon/左箭头%20(1).png" />
			</a>
		</div>
			<div class="content_head">
				<div class="head_img">
					<img src="${systemConfig.domain }/${systemConfig.uploadFile}${ac.image }">
				</div>
				<div class="head_text">
					<h2>${ac.title }</h2>
					<c:if test="${ac.type=='2' }">
						<p>难 度：<i>${ac.difficulty }</i></p>
						<p>章 节 数：<i>${ac.chapters }</i></p>
						<p>时 长：<i>${ac.duration }</i></p>
						<c:if test="${ac.needpay=='YES'}">
							<p>费 用：<i>${ac.amount }</i></p>
						</c:if>
					</c:if>
					<c:if test="${ac.type=='1' }">
						<p>阅 读 数：<i>${ac.readcount }</i></p>
					</c:if>
					
				</div>
				<div class="head_text">
					<c:if test="${ac.collectFlag!=true }">
						<button id='collect' style="background: #717171;" onclick="collect('${ac.desEntryId}')">收藏</button><br />
					</c:if>
					<c:if test="${ac.type=='2' }">
						<button style="background: #ff7800" onclick="toLearn('${ac.desEntryId}')">开始学习</button>
					</c:if>
				</div>
			</div>
			<div style="margin-top: 20px;" class="content_head">
			<c:if test="${ac.type=='2' }">
				<h3 style="border-bottom: 1px solid #000000;">课程简介</h3>
				<br>
				<p>${ac.brief }</p>
			</c:if>
			<c:if test="${ac.type=='1' }">
				<h3 style="border-bottom: 1px solid #000000;">文章详情</h3>
				<br>
				<p>${ac.content }</p>
			</c:if>
			</div>

	</body>
	<script>
		layui.use('form', function() {
			var form = layui.form;
		});
	</script>
</html>
