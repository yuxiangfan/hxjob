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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>error</title>

</head>

<body>
	
	<div style='margin:100px;text-align:center;font-size:26px;'>
		你没有权限访问
		<br />
		<a href='login'>返回登录</a>
	</div>
	

</body>

</html>

