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
		
	</head>
	<body>
		<div class="details_headinfo">
			<div class="head_body">
				<div class="head_img">
					<img style="height: 100%; width: 100%;" src="${systemConfig.domain }/${systemConfig.uploadFile}${data.rows[0].organization.logo }" />
				</div>
				<div class="head_name">
					<h1 style='font-size:28px;color:#000'>${data.rows[0].organization.fullname }</h1>
					<span style=" color:  #666666;">
						${data.rows[0].organization.cityname }&nbsp;|&nbsp;${data.rows[0].organization.industryname }&nbsp;&nbsp;
					</span><br />
					<span style=" color:  #666666;">
						${data.rows[0].organization.brief }
					</span>
				</div>
				<div class="head_score">
					<span style="float:right;">
						综合评分&nbsp;&nbsp;&nbsp;
						<c:set var='scorePecent' value="${data.rows[0].organization.score/0.05}"/>
						<span class="grade_star"><i style="width:${scorePecent}%;"></i></span>
					</span>
				</div>
			</div>
			<div class="head_comment">
				<div class="head_comment_check">
					<ul>
						<li>
							<a href="org/position/${orgcode }"  class="checked">招聘</a>
						</li>
						<li>
							<a href="org/comment/${orgcode }">点评</a>
						</li>
						
					</ul>
				</div>
				
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
		
		
		
	</body>
	<script type="text/javascript">
		
		
	</script>
</html>



