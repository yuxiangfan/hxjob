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
		<title>校园智能招聘</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/tocomment.css" />
		<link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
		<script src="resources/business-js/pc/comment-list.js"></script>
		
	</head>
	<body>
		
		
		
		<div class="details_headinfo">
			<div class="head_body">
				<div class="head_img">
					<img style="height: 100%; width: 100%;" src="${systemConfig.domain }/${systemConfig.uploadFile}${org.logo }" />
				</div>
				<div class="head_name">
					<h1>${org.fullname }</h1>
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
							<a href="org/position/${orgcode }" >招聘</a>
						</li>
						<li>
							<a href="org/comment/${orgcode }" class="checked">点评</a>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="body">
			<h1 class="module_title">
				<p class="f_left">${org.shortname }点评</p>
			</h1>
			<div class="body_title">
				<dl id="radio_topLeft" style='margin-bottom:25px;'>
					工作环境:
					<span class="grade_star"><i style="width:100.0%;"></i></span>
					
				</dl>
				<dl id="radio_topRight" style='margin-bottom:25px;'>
					职业发展:
					<span class="grade_star"><i style="width:100.0%;"></i></span>
					
				</dl>
				<dl id="radio_lowerLeft" style='margin-bottom:25px;'>
					工作强度:
					<span class="grade_star"><i style="width:100.0%;"></i></span>
					
				</dl>
				<dl id="radio_lowerRight" style='margin-bottom:25px;'>
					企业文化:
					<span class="grade_star"><i style="width:100.0%;"></i></span>
					
				</dl>
			</div>
			
			<div id="comments">
				<div class="body_title">
					<div class="body_title_head">
						<span> 
							<img src="picture/i_header02.png">
							<p>匿名用户</p>
						</span>
					</div>
					<div class="body_title_body">
						<div>
							<a>行业步入瓶颈，覆巢之下安有完卵。</a>
						</div>
						<p>行业经历了井喷式增长后，已经充分市场化了，用给客户甜头的老方...</p>
					</div>
				</div>
				<div class="body_title">
					<div class="body_title_head">
						<span> 
							<img src="picture/i_header02.png">
							<p>匿名用户</p>
						</span>
					</div>
					<div class="body_title_body">
						<span>
							<a>有竞争力的年轻人值得来的公司</a>
						</span>
						<p></p>
					</div>
				</div>
			</div>
			<div id='page' style='text-align:right;padding:10px'></div>
			
			
		</div>
		
		
		
		
	</body>
	<script type="text/javascript">
		
	var orgcode = '${orgcode}';
		
	</script>
</html>



