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
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>"/>
<title>贝睿网——登录</title>
	<link href="resources/pc/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="resources/pc/css/login.css" rel="stylesheet" type="text/css"/>
	<!--百度统计-->
        <script>
        var _hmt = _hmt || [];
        (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?7da1657e225ee069bfc18d0b34754e2c";
        var s = document.getElementsByTagName("script")[0]; 
        s.parentNode.insertBefore(hm, s);
        })();
        </script>
</head>

<body>
	
	<div class="row "  id="login">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="logo">贝睿网注册</div>
			<form role="form">
				<fieldset>
					<div style="text-align:center;margin-bottom:15px;">
						<a style="color: #337ab7;" href="h5views/pos">回到首页</a>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="用户名" id="username" type="text" autofocus="">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="密码" id="password" type="password" value="">
					</div>
					<!-- <div class="checkbox">
						<label>
							<input name="remember" type="checkbox" value="Remember Me">记住密码
						</label>
					</div> -->
					<a href="JavaScript:void(0)" onclick='register()'><input type="button" class="btn btn-block btn-yellow" value="注册"></a>
					<a style="color: #FFFFFF;" href="hm/login">已有账号去登录</a>
				</fieldset>
			</form>
			<div class="copyright">
				<p style="color: #FFFFFF;">Powered by <a href="http://www.25175.com" target="_Blank">25175</a></p>
				<p class="statistics"><a href="#">站长统计</a></p>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->
	<script src="resources/js/jQuery-2.1.4.min.js"></script>
	<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resources/layui/layui.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		});
		
		var layer;
		layui.use('layer', function(){
			layer = layui.layer;
		});
		
		var register = function(){
			var username = $("#username").val();
			var password = $("#password").val();
			
			$.ajax({
				url:'pcm/registering',
				data:{"username":username,"password":password},
				dataType:'json',
				type:'post',
				success:function(data){
					if(data.code==0){
						window.location.href = "h5views/pos";
					}
					else{
						layer.alert(data.msg);
					}
				}
			});
			
		};
		
	</script>
	<div style="display:none">
		<script src="http://s23.cnzz.com/stat.php?id=646555&web_id=646555" language="JavaScript"></script>
	</div>
	
</body>
</html>
