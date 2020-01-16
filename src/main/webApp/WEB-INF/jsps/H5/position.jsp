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
<!-- 		<link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css" /> -->
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
		<script type="text/javascript" src="resources/business-js/H5/pos.js"></script>
		<script src="resources/business-js/H5/common.js"></script>
	</head>
	<body>
		<div class="frame">
			<div class="head_a">
				<!-- <span class="javascript"></span> -->
				<center>贝睿网</center>
				<div class="input">
					<div class="input_text">
						<input type="text" class="text" value='${searchContent }' id='searchContent' placeholder="搜公司、找职位">
					</div>
					<div class="input_btn">
						<input type="button" class="btn" id='search' >
					</div>
				</div>
			</div>
			<div class="head_b">
				<ul>
					<li class="group checked">
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
					<li class="group">
						<a href="h5views/about">
							<img src="resources/pc/icon/gongnengdingyi.png"/><br>
							<span>关于</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="body">
<!-- 				<div class="body_title" > -->
<!-- 					<a href="m.index.1.html"> -->
<!-- 						<div class="body_title_img"> -->
<!-- 							<img src="img/10289bd9f8a8422b5b3bb79c10b77d0c.jpg" /> -->
<!-- 						</div> -->
<!-- 						<div class="body_title_name"> -->
<!-- 							华泰证券 -->
<!-- 						</div> -->
<!-- 						<div class="body_title_comment"> -->
<!-- 							<span class="grade_star"> -->
<!-- 								<i style="width:100.0%;"></i> -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<span class="gt" style=""> -->
<!-- 							<img src="resources/pc/icon/right.png" /> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="body_title"> -->
<!-- 					<a href="#"> -->
<!-- 						<div class="body_title_img"> -->
<!-- 							<img src="img/10289bd9f8a8422b5b3bb79c10b77d0c.jpg" /> -->
<!-- 						</div> -->
<!-- 						<div class="body_title_name"> -->
<!-- 							XXXX -->
<!-- 						</div> -->
<!-- 						<div class="body_title_comment"> -->
<!-- 							<span class="grade_star"> -->
<!-- 								<i style="width:75.0%;"></i> -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<span class="gt"> -->
<!-- 							<img src="icon/right.png" /> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
			</div>
			
			<div id='page' style='text-align:right;padding:10px'></div>
			
		</div>

	</body>
	<script type="text/javascript">
		var baseRoot = '${systemConfig.domain}/${systemConfig.uploadFile}';
	</script>
</html>





