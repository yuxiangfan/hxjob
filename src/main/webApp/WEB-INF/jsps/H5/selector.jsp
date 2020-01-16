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
		<script src="resources/layui/layui.js"></script>
		<script type="text/javascript" src="resources/business-js/H5/selector.js"></script>
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
					<li class="group checked">
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
		<div>
			<div style="border-bottom: 1px solid #eaeaea;background: #f5f7f9;color: #333;
			height: 50px;line-height: 50px;text-indent: 20px;font-size: 14px;">
				<ul class="content_top">
					<li id='new'><a onclick='newlist()'>最新</a></li>
					<li id='hot' style='border-bottom: none;'><a onclick='hotlist()' >最热门</a></li>
				</ul>
			</div>
			<div class='group_list'>
				
			</div>
<!-- 			<div class="jxkc"> -->
<!-- 				<a style="text-decoration:none;cursor: pointer; color: #4f4f4f;"href="m.selected.1.html"> -->
<!-- 					<div class="jxkc_img"> -->
<!-- 						<img src="img/量化.jpg" /> -->
<!-- 					</div> -->
<!-- 					<div class="jxkc_text"> -->
<!-- 						<p>量化投资</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->
<!-- 			<div class="jxkc"> -->
<!-- 				<div class="jxkc_img"> -->
<!-- 					<img src="img/中国工商.png" /> -->
<!-- 				</div> -->
<!-- 				<div class="jxkc_text"> -->
<!-- 					<p>中国工商银行</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="jxkc"> -->
<!-- 				<div class="jxkc_img"> -->
<!-- 					<img src="img/债券.jpg" /> -->
<!-- 				</div> -->
<!-- 				<div class="jxkc_text"> -->
<!-- 					<p>债券市场</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="jxkc"> -->
<!-- 				<div class="jxkc_img"> -->
<!-- 					<img src="img/投行.jpg" /> -->
<!-- 				</div> -->
<!-- 				<div class="jxkc_text"> -->
<!-- 					<p>投行入门案例</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</body>
	<script type="text/javascript">
		var rootPath  = '${systemConfig.domain}/${systemConfig.uploadFile}';
	</script>
</html>

