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
		<link rel="stylesheet" href="resources/layui/css/layui.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
	</head>
	<body>
		<div class="head">
			<a onclick="javascript :history.back(-1);">
				<img src="resources/pc/icon/左箭头%20(1).png" />
			</a>
		</div>
		<div class="head_b">
			<div class="head_img">
				<img src="${systemConfig.domain}/${systemConfig.uploadFile}${org.logo}">
			</div>
			<div class="head_title">
				<strong>${org.fullname }</strong><br />
				<span>行业：${org.industryname }</span>
			</div>
		</div>
		<div class="comment">
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">城市：</label>
					<div class="layui-input-block">
						<select name="city" lay-verify="required">
							<option value=""></option>
							<c:forEach items='${cities }' var='city'>
								<option value='${city.name }'>${city.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门:</label>
					<div class="layui-input-block">
						<input type="text" name="department" required lay-verify="required" placeholder="请输入部门" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">岗位:</label>
					<div class="layui-input-block">
						<input type="text" name="position" required lay-verify="required" placeholder="请输入岗位" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">角色：</label>
					<div class="layui-input-block">
						<select name="workrole" lay-verify="required">
							<option value=""></option>
							<option value="前实习生">前实习生</option>
							<option value="实习生">实习生</option>
							<option value="前员工">前员工</option>
							<option value="在岗员工">在岗员工</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作年限:</label>
					<div class="layui-input-block">
						<input type="text" name="workyear" required lay-verify="required" placeholder="请输入工作年限" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否在岗：</label>
					<div class="layui-input-block">
						<select name="isonduty" lay-verify="required">
							<option value=""></option>
							<option value="YES">是</option>
							<option value="NO">否</option>
			
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">薪资待遇:</label>
					<div class="layui-input-block">
						<input type="text" name="treatment" required lay-verify="required" placeholder="千元/月" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">成长性：</label>
					<div class="layui-input-block">
						<select name="growth" lay-verify="required">
							<option value=""></option>
							<option value="5">极快</option>
							<option value="4">较快</option>
							<option value="3">一般</option>
							<option value="2">较慢</option>
							<option value="1">慢</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作量：</label>
					<div class="layui-input-block">
						<select name="workload" lay-verify="required">
							<option value=""></option>
							<option value="1">高频率加班</option>
							<option value="2">工作日加班</option>
							<option value="3">偶尔加班</option>
							<option value="4">不加班日常饱和</option>
							<option value="5">清闲</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作环境：</label>
					<div class="layui-input-block">
						<select name="environment" lay-verify="required">
							<option value=""></option>
							<option value="5">极优</option>
							<option value="4">舒适</option>
							<option value="3">一般</option>
							<option value="2">堪忧</option>
							<option value="1">恶劣</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">综合评分：</label>
					<div class="layui-input-block">
						<select name="satisfaction" lay-verify="required">
							<option value=""></option>
							<option value="5">非常满意（简直想在这里工作一辈子）</option>
							<option value="4">满意（短期内不考虑跳槽、希望能够拿到offer）</option>
							<option value="3">一般、不满意（一有机会就要跳槽）</option>
							<option value="2">极不满意（一分钟都不想多呆）</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">福利待遇:</label>
					<div class="layui-input-block">
						<input type="text" name="welfare" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">流动率:</label>
					<div class="layui-input-block">
						<input type="text" name="turnoverRate" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">行业地位:</label>
					<div class="layui-input-block">
						<input type="text" name="industryStatus" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别结构:</label>
					<div class="layui-input-block">
						<input type="text" name="genderStructure" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<button class="layui-btn" style="width: 100%;" lay-submit lay-filter="commentForm">提交评论</button>
				</div>
			</form>
		</div>
	</body>
	<script>
			var layer;
			layui.use('layer', function(){
				layer = layui.layer;
			});
			
			var reg_amount = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
		
			layui.use('form', function() {
				var form = layui.form;
				form.on('submit(commentForm)', function(data){
					var field = data.field;
					field.orgcode = '${orgcode}';
				    console.log(JSON.stringify(field));
				    if(!(reg_amount.test(field.treatment))){
				    	layer.msg("待遇格式有误");
				    	return false;
				    }
				    if(parseFloat(field.treatment)>100){
				    	layer.confirm('薪资待遇单位是千元每月，确认提交吗',function(){
				    		 submit(field);
				    	});
				    }else{
				    	 submit(field);
				    }
				    
				    return false;
				});
			});
			
			var submit = function(data){
				$.ajax({
			    	url:'pcviews/userOrgComment',
			    	data:data,
			    	dataType:'json',
			    	type:'post',
			    	async:false,
			    	success:function(data){
			    		if(data.code==-9){
							window.location.href = "hm/login";
						}
						else if(data.code==0){
							layer.alert("您已成功提交评论");
							setTimeout(function(){
								window.location.href = 'h5views/tocommentlist/${orgcode}';
							},1000);
						}
						else if(data.code==-10){
							layer.msg(data.msg);
						}
						else{
							layer.msg(data.msg);
						}
			    	}
			    });
			}
		</script>
</html>


