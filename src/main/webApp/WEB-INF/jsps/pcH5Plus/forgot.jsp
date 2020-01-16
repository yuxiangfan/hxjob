<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>找回密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <link href="css/base.css" rel="stylesheet" type="text/css">
    <link href="css/login_new.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="login-wrap">
    <div class="beirui_logo"></div>
    <div class="pswd-wrap" >
        <div class="form-item">
<span class="area-code">
<em>+86</em>
<i></i>
<input type="hidden" name="regionCode" value="+86">
</span>
            <input type="text"  class="input_style"  placeholder="请输入手机号码">
        </div>
        <div class="form-item form-item-password">
            <input type="password" class="input_style"  placeholder="请输入注册时填写的姓名" >
            <em class="tag-type"></em>
        </div>
        <div class="form-item form-item-password">
            <input type="password" class="input_style"  placeholder="请输入密码" >
            <em class="tag-type"></em>
        </div>
        <div class="form-item form-item-nc" data-method="post" >
            <div class="no-pswd">
                <a href="#" class="forget" >密码找回</a>
            </div>
            <button class="submit-btn"  onclick="window.location.href = 'login.jsp'">确认</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>