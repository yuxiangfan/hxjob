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
			
			<div style="margin-top: 20px;" class="content_head">
				<div style='height:100%;margin:0 auto;padding:5px;text-align:center;'>
					<img alt="" style='width:100%' src="resources/images/wechat-pay.png">
					<button onclick="pay('${ac.desEntryId}')" style='width:75px;height:36px;border:1px solid #ccc;border-radius:3px;background-color:#897865;color:#fff'>去支付</button>
				</div>
			</div>
	</body>
	<script>
		var pay = function(id){
			layer.alert("支付成功");
		}
	</script>
</html>
