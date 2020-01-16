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
		
		<meta charset="utf-8">
		<base href="<%=basePath%>"/>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta http-equiv="Cache-Control" content="no-transform ">
		<meta name="viewport" content="width=device-width">
		<title>贝睿网</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/tocomment.css" />
		<link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="resources/pc/css/recruit.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
		<script src="resources/business-js/pc/comment-list.js"></script>
		<script src="resources/business-js/pc/common.js"></script>
	</head>
	<body>
		<header class="global">
			<div class="header clearfix">
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
		
		
		<div class="details_headinfo">
			<div class="head_body">
				<div class="head_img">
					<img style="height: 100%; width: 100%;" src="${systemConfig.domain }/${systemConfig.uploadFile}${org.logo }" />
				</div>
				<div class="head_name">
					<h1 style='font-size:28px;color:#000'>${org.fullname }</h1>
					<span style=" color:  #666666;">
						${org.cityname }&nbsp;|&nbsp;${org.industryname }&nbsp;&nbsp;
					</span><br />
					<span style=" color:  #666666;">
						${org.brief }
					</span>
				</div>
				<div class="head_score">
					<span style="float:right;">
						综合评分&nbsp;&nbsp;&nbsp;
						<c:set var='scorePecent' value="${org.score/0.05}"/>
						<span class="grade_star"><i style="width:${scorePecent}%;"></i></span>
					</span>
				</div>
			</div>
			<div class="head_comment">
				<div class="head_comment_check">
					<ul>
						<li>
							<a href="pcviews/poslist/${orgcode }" class="checked" >招聘</a>
						</li>
						<li>
							<a href="pcviews/tocommentlist/${orgcode }" >点评</a>
						</li>
						
					</ul>
				</div>
				<a class="toComment" href="pcviews/tocomment/${orgcode }">我要评价</a>
			</div>
		</div>
		
		
		<div class="body">
			
			<div >
				<c:forEach var='pos' items="${data.rows }">
					<div class="clear"></div>
					<div class="job_post" style='width:100%'>
						<div class="job_post_tit">
							<h2>
								<i>【${pos.organization.cityname }】</i><a href="pcviews/posDetail/${pos.code }" target="_blank"> ${pos.organization.shortname } - ${pos.title }</a> 
								<span style="float:right;"> 
									<span class="grade_star"><i style="width:${pos.rindex/0.05}%;"></i></span>（贝睿评级）
								</span>
							</h2>
						</div>
						<div class="job_post_body">
							${pos.duty }
						</div>
						<div class="job_post_meta">
							<p>
								<span>部门：${pos.department }</span>
								<span>发布时间：${pos.publishtime }</span>
								<span style="float:right"><a href="pcviews/posDetail/${pos.code }" target="_blank"> ....详情</a></span></p>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
				
				
				
			</div>
			
			<div id='page' style='text-align:right;padding:10px'></div>
			
			
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
		
		
	</script>
</html>



