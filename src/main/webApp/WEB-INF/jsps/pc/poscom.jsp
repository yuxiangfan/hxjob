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
		<title>贝睿网——个人测评</title>
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/evaluation.css" />
		<link rel="stylesheet" href="resources/pc/css/component.css" />
		<link rel="stylesheet" href="resources/pc/layui/css/layui.css" />
		<script src="resources/pc/layui/layui.js"></script>
		<script src="resources/business-js/pc/poscom.js"></script>
		<script src="resources/business-js/pc/common.js"></script>
		<style type="text/css">
			.myinput{width:100px;border:none;border-bottom:1px solid}
		</style>
	</head>
	<body>
		<header class="global">
			<div class="header <clearfi></clearfi>x">
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

		<div class="container ps_con clearfix">
			<div class="form-header-group ">
				<div class="header-text httac htvam">
					<h1 class="form-header" data-component="header">
						贝睿职业测评与竞争力排名
					</h1>
					<div class="form-subHeader">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一份来自专业金融职前培训机构-贝睿的一份专业的测评。
					</div>
				</div>
			</div>
			<form class="layui-form" action="">
				<div class="essentialInformation">
					<h2>基本信息:</h2>
					<div class="essentialInformation_form">
						姓名：<input type="text" name='name' class="classA" />
					</div>
					<div class="essentialInformation_form">
						性别：<input type="radio" name="gender" value="男" title="男" checked>
      						<input type="radio" name="gender" value="女" title="女" >
					</div>
					<div class="essentialInformation_form">
						政治背景：<input class="classA" name='political_background' />
					</div>
					<div class="essentialInformation_form">
						生日： <input type="text" class="layui-input" name='birthday' id="test1">
					</div>
					<div class="essentialInformation_form">
						籍贯：<input class="classA" name="native_place" />
					</div>
					<div class="essentialInformation_form">
						联系方式：<input class="classA" name="contact" />
					</div>
				</div>
				<div class="essentialInformation">
					<h2>教育背景: <span class="layui-btn layui-btn-normal" style='float:right' onclick="addEdu()">添加教育背景</span></h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>学校名称</th>
								<th>专业名称</th>
								<th>学位</th>
								<th></th>
							</tr>
						</thead>
						<tbody id='eduBody'>
							
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>实习经历<span class="layui-btn layui-btn-normal" style='float:right' onclick="addExp()">添加实习经历</span></h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>单位类别</th>
								<th>单位名称</th>
								<th>部门名称</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="expBody">
							
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>社会实践<span class="layui-btn layui-btn-normal" style='float:right' onclick="addPro()">添加社会实践</span></h2>
					<table class="layui-table" lay-even lay-skin="nob">
						<thead>
							<tr>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>项目名称</th>
								<th>获奖情况</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="proBody">
							
						</tbody>
					</table>
				</div>
				<div class="essentialInformation">
					<h2>技能证书</h2>
					<div class="layui-form-item">
						<label class="layui-form-label">专业考试证书</label>
						<div class="layui-input-block">
							<input type="checkbox" name="cer1-1" value="CPA全科/CFA三级" title="CPA全科/CFA三级">
							<input type="checkbox" name="cer1-2" value="cpa部分/CFA1-2级别/FRM" title="cpa部分/CFA1-2级别/FRM">
							<input type="checkbox" name="cer1-3" value="司法考试" title="司法考试">
							<input type="checkbox" name="cer1-4" value="从业资格（证券/基金/银行等）" title="从业资格（证券/基金/银行等）">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">语言/计算机类</label>
						<div class="layui-input-block">
							<input type="checkbox" name="cer2-1" value="英语4、6级" title="英语4、6级">
							<input type="checkbox" name="cer2-2" value="托福/雅思" title="托福/雅思">
							<input type="checkbox" name="cer2-3" value="托业" title="托业">
							<input type="checkbox" name="cer2-4" value="office" title="office">
							<input type="checkbox" name="cer2-5" value="c# java" title="c# java">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">奖学金及其他</label>
						<div class="layui-input-block">
							<input type="checkbox" name="cer3-1" value="国家级奖学金/学生干部/大赛获奖" title="国家级奖学金/学生干部/大赛获奖">
							<input type="checkbox" name="cer3-2" value="省部级奖学金/学生干部/大赛获奖" title="省部级奖学金/学生干部/大赛获奖">
							<input type="checkbox" name="cer3-3" value="校级奖学金/学生干部/大赛获奖" title="校级奖学金/学生干部/大赛获奖">
						</div>
					</div>
				</div>
				<div class="essentialInformation">
					<h2>自我评价</h2>
					<div class="layui-form-item">
						<label class="layui-form-label">想要的</label>
						<div class="layui-input-block">
							<input type="checkbox" name="sel1-1" value="多金，能吃苦" title="多金，能吃苦">
							<input type="checkbox" name="sel1-2" value="工作平衡" title="工作平衡">
							<input type="checkbox" name="sel1-3" value="没压力的" title="没压力的">
							<input type="checkbox" name="sel1-4" value="舒服的" title="舒服的">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">职业偏好</label>
						<div class="layui-input-block">
							<input type="checkbox" name="sel2-1" value="投行/并购" title="投行/并购">
							<input type="checkbox" name="sel2-2" value="销售/交易" title="销售/交易">
							<input type="checkbox" name="sel2-3" value="投研" title="投研">
							<input type="checkbox" name="sel2-4" value="投资" title="投资">
							<input type="checkbox" name="sel2-5" value="合规/风险管理" title="合规/风险管理">
							<input type="checkbox" name="sel2-6" value="支持部门" title="支持部门">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">性格描述</label>
						<div class="layui-input-block">
							<input type="checkbox" name="sel3-1" value="勤奋的" title="勤奋的">
							<input type="checkbox" name="sel3-2" value="交际花" title="交际花">
							<input type="checkbox" name="sel3-3" value="女王范" title="女王范">
						</div>
					</div>
				</div>
				<button class="layui-btn layui-btn-normal" style="display: block;width: 80%; margin: 0 auto;" lay-submit lay-filter="formDemo">提交</button>
			</form>
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
		<script>
			var laydate
			layui.use('laydate', function() {
				laydate = layui.laydate;

				//执行一个laydate实例
				laydate.render({
					elem: '#test1' //指定元素
				});
			});
		</script>
	</body>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;
			
			//监听提交
			form.on('submit(formDemo)', function(data) {
				var datas = data.field;
				var edus = [];
				$("#eduBody").find("tr").each(function(){
					var edu = {};
					edu.starttime = $(this).find("td:eq(0)").find('input').val();
					edu.endtime = $(this).find("td:eq(1)").find('input').val();
					edu.school = $(this).find("td:eq(2)").find('input').val();
					edu.major = $(this).find("td:eq(3)").find('input').val();
					edu.degree = $(this).find("td:eq(4)").find('input').val();
					edus.push(edu);
				});
				var exps = [];
				$("#expBody").find("tr").each(function(){
					var exp = {};
					exp.starttime = $(this).find("td:eq(0)").find('input').val();
					exp.endtime = $(this).find("td:eq(1)").find('input').val();
					exp.category = $(this).find("td:eq(2)").find('input').val();
					exp.name = $(this).find("td:eq(3)").find('input').val();
					exp.department = $(this).find("td:eq(4)").find('input').val();
					exps.push(exp);
				});
				var pros = [];
				$("#expBody").find("tr").each(function(){
					var pro = {};
					pros.starttime = $(this).find("td:eq(0)").find('input').val();
					pros.endtime = $(this).find("td:eq(1)").find('input').val();
					pros.project = $(this).find("td:eq(2)").find('input').val();
					pros.prize = $(this).find("td:eq(3)").find('input').val();
					pros.push(pro);
				});
				
				datas.edus = edus;
				datas.exps = exps;
				datas.pros = pros;
				
				var datasStr = JSON.stringify(datas);
				
				console.log(datasStr);
				
				$.ajax({
					url:"pcviews/doposcom",
					data:{"datas":datasStr},
					dataType:'json',
					type:'post',
					success:function(data){
						layer.alert(data.msg);
						if(data.code==-9){
							window.location.href = "pcm/login";
						}
					},
					error:function(data){
						console.log("ERROR");
					}
				});
				
				return false;
			});
		});
	</script>
</html>
