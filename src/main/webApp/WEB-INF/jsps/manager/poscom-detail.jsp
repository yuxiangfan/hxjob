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
		<title>个人测评</title>
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/evaluation.css" />
		<link rel="stylesheet" href="resources/pc/css/component.css" />
		<link rel="stylesheet" href="resources/pc/layui/css/layui.css" />
		<script src="resources/pc/layui/layui.js"></script>
		<script src="resources/business-js/pc/poscom.js"></script>
		
		<style type="text/css">
			.myinput{width:100px;border:none;border-bottom:1px solid}
			.myspan{padding:3px 5px;border:1px solid #d2d2d2;background-color:#d2d2d2;color:#fff }
		</style>
	</head>
	<body>
		
		<div class="container ps_con clearfix">
			<div class="form-header-group ">
				<div class="header-text httac htvam">
					<h1 class="form-header" data-component="header">
						贝睿职业测评与竞争力排名
					</h1>
					
				</div>
			</div>
			<form class="layui-form" action="">
				<div class="essentialInformation">
					<h2>基本信息:</h2>
					<div class="essentialInformation_form">
						姓名：<input type="text" name='name' class="classA" value="${test.name }" readonly />
					</div>
					<div class="essentialInformation_form">
						性别：${test.gender}
					</div>
					<div class="essentialInformation_form">
						政治背景：<input class="classA" name='political_background' value="${test.politicalBackground }" readonly />
					</div>
					<div class="essentialInformation_form">
						生日： <input type="text" class="layui-input" name='birthday' id="test1" value="${test.birthday }" readonly>
					</div>
					<div class="essentialInformation_form">
						籍贯：<input class="classA" name="native_place" value="${test.nativePlace }" readonly />
					</div>
					<div class="essentialInformation_form">
						联系方式：<input class="classA" name="contact" value="${test.contact }" readonly />
					</div>
				</div>
				<div class="essentialInformation">
					<h2>招聘背景</h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>学校名称</th>
								<th>专业名称</th>
								<th>学位</th>
							</tr>
						</thead>
						<tbody id='eduBody'>
							<c:forEach var="edu" items="${test.educationalBackground }">
								<tr>
									<th>${edu.starttime }</th>
									<th>${edu.endtime }</th>
									<th>${edu.school }</th>
									<th>${edu.major }</th>
									<th>${edu.degree }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>实习经历</h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>单位类别</th>
								<th>单位名称</th>
								<th>部门名称</th>
							</tr>
						</thead>
						<tbody id="expBody">
							<c:forEach var="exp" items="${test.internshipExperience }">
								<tr>
									<th>${exp.starttime }</th>
									<th>${exp.endtime }</th>
									<th>${exp.category }</th>
									<th>${exp.name }</th>
									<th>${exp.department }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>社会实践</h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>项目名称</th>
								<th>获奖情况</th>
							</tr>
						</thead>
						<tbody id="proBody">
							<c:forEach var="pro" items="${test.socialPractice }">
								<tr>
									<th>${pro.starttime }</th>
									<th>${pro.endtime }</th>
									<th>${pro.project }</th>
									<th>${pro.prize }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>技能证书</h2>
					<div class="layui-form-item">
						<label class="layui-form-label">专业考试证书</label>
						<div class="layui-input-block">
							<c:forEach var='cer' items='${test.certificate}'>
								<c:if test="${cer.type=='1' }">
									<span class='myspan'>${cer.certificate }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">语言/计算机类</label>
						<div class="layui-input-block">
							<c:forEach var='cer' items='${test.certificate}'>
								<c:if test="${cer.type=='2' }">
									<span class='myspan'>${cer.certificate }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">奖学金及其他</label>
						<div class="layui-input-block">
							<c:forEach var='cer' items='${test.certificate}'>
								<c:if test="${cer.type=='3' }">
									<span class='myspan'>${cer.certificate }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="essentialInformation">
					<h2>自我评价</h2>
					<div class="layui-form-item">
						<label class="layui-form-label">想要的</label>
						<div class="layui-input-block">
							<c:forEach var='sel' items='${test.selfEvaluation}'>
								<c:if test="${sel.type=='1' }">
									<span class='myspan'>${sel.selector }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">职业偏好</label>
						<div class="layui-input-block">
							<c:forEach var='sel' items='${test.selfEvaluation}'>
								<c:if test="${sel.type=='2' }">
									<span class='myspan'>${sel.selector }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">性格描述</label>
						<div class="layui-input-block">
							<c:forEach var='sel' items='${test.selfEvaluation}'>
								<c:if test="${sel.type=='3' }">
									<span class='myspan'>${sel.selector }</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				
			</form>
		</div>
		
		
	</body>
	
</html>
