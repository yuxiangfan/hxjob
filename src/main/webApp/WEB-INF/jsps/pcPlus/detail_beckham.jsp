<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>


<!DOCTYPE html>
<html lang="en">
<head>
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pc/js/jquery-2.1.0.min.js"></script>
</head>
<body>

<!--头-->
<%@ include file="include_head.jsp" %>

<div class="container" id="container">
    <div class="wrapper">
        <div class="image_black">
            <div class="image_hy">
            </div>
            <div class="left_hy">
                <h1 style="font-size: 24px">金融专家就找贝睿</h1>
                <p>
                    <br>
                    &nbsp;&nbsp;曾有个密友问我，她说：“亲爱的，女生到底是应该嫁给爱情，还是嫁
                    嫁给现实，无非就是自己少奋斗几年。而后用10数年的时间去后悔。
                    不过这么说也算牵强，身边不乏些嫁给现实的朋友，在柴米油盐的生活
                    中不仅慢慢习惯上了对方的存在，那种习惯略带些依赖的味道，并在长
                    此以往的依赖中得了一种病，药石无医-懒癌晚期。”
                    <br>
                    　　她说自己最近认识了一个男生，对方有车有房有存款，只是自己对他
                    不曾看对眼。
                    <br>
                    　　我说；“既然你不喜欢他，那为何要纠结呢。你有没有想过另一半
                    是陪伴你走完一生的人。不喜欢不如直接回绝了人家，两不耽误，各自再
                    找。而你又有赚钱的能力，嘴上总是挂着靠人不如靠己的字眼，既然不靠
                    对方经济补给，那结果自然明了。后来我听说，她之所以苦恼，全因母亲
                    的一席话。
                    曾有个密友问我，她说：“亲爱的，女生到底是应该嫁给爱情，还是嫁
                    嫁给现实，无非就是自己少奋斗几年。而后用10数年的时间去后悔。
                    不过这么说也算牵强，身边不乏些嫁给现实的朋友，在柴米油盐的生活
                    中不仅慢慢习惯上了对方的存在，那种习惯略带些依赖的味道，并在长
                    此以往的依赖中得了一种病，药石无医-懒癌晚期。”
                    <br>
                    　　她说自己最近认识了一个男生，对方有车有房有存款，只是自己对他
                    不曾看对眼。
                    <br>
                    　　我说；“既然你不喜欢他，那为何要纠结呢。你有没有想过另一半
                    是陪伴你走完一生的人。不喜欢不如直接回绝了人家，两不耽误，各自再
                    找。而你又有赚钱的能力，嘴上总是挂着靠人不如靠己的字眼，既然不靠
                    对方经济补给，那结果自然明了。后来我听说，她之所以苦恼，全因母亲
                    的一席话。
                </p>
            </div>
            <div class="right_hy">
                <div class="image_k">
                    <span>满一年优惠100</span>
                </div>
            </div>
            <div class="right_hy">
                <div class="image_k">
                    <span>满一年优惠100</span>
                </div>
            </div>
            <div class="right_hy">
                <div class="image_k">
                    <span>满一年优惠100</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--尾-->
<footer>
    <div class="footer">
        <nav>
            <a href="javascript:;">关于我们</a>
            <a href="javascript:;">意见反馈</a>
            <a href="javascript:;">使用帮助</a>
            <a href="javascript:;">用户协议</a>
        </nav>
        <div class="foot_left">
            <p class="foot_ebeirui"><em>贝睿</em>教育</p>
            <p>
                Copyright © 2019 ebeirui.com京ICP备#####
                <span class="ml10">京公网安备############</span>
            </p>
            <p>ebeirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>
<script>
    $("#4").addClass("active");
</script>
</body>
</html>