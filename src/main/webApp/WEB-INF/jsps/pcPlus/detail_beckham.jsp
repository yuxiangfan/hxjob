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
            <div class="left_hy">
                <h1 style="font-size: 24px">校园智能招聘专家</h1>
                <p>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着网络技术的迅速发展,网上求职已凭借其成本低、
                    时效长等优点逐渐成为大,学生求职的主渠道。
                    为满足求职大学生以及企业的要求,搭建一个连接求职大学生与企业的桥梁,利用数据库和先进的开发平台,
                    配置一定的软件和硬件,开发大学生就业求职系统。为大学生和企业提供在线求职、招聘管理平台和周到的网络信息化服务。
                    <br>
                    　&nbsp;&nbsp;&nbsp;&nbsp;人才在各行各业中都是发展的关键,大学生就是人才的代名词,如何能够聘请到具有真才实学的大学生是各个企业非常非常关心的问题,
                    找不到理想的工作、不能发,挥自己的聪明才智也是让大学生烦恼的事情,他们踏入社会的第一节课就是求职。
                    说到求职,首先想到的是招聘会。虽然招聘会是目前人才交流的主要渠道,或者说是主要途径之一,
                    但是他还是远远不能满足现实的需求。
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1)招聘会都是在有限的几天内企 业与大学生进行面对面的交流,尽管有的招聘会会提前贴出海报等宣传,
                    但是还是很多大学生错过机会。有的时候,大学生必须放弃一些重要的事情参加招聘会。
                    (2)由于参加招聘会的人数繁多,并且在整个过程中人员的流动性很大。
                    (3)招聘会人数众多,并且展位有限。因此,网络招聘给求职者和企业带来了很多的便利,推动了社会的发展。
                    求职者只需要在网上发布求职信息,企业人力资料员部人员只需轻点鼠标就可浏览应聘人信息,
                    通过先进发达的网络可以对庞大的求职和招聘信息进行管理,可以方便地进行增、删、改等操作。
                    <br>
                    　&nbsp;&nbsp;&nbsp;&nbsp;为满足求职大学生以及企业的要求,搭建一个连接求职大学生与企业的桥梁,
                    利用数据库和先进的开发平台,配置一定的软件和硬件,
                    开发大学生就业求职系统。该系统具有开放的体系结构、
                    易扩充、易维护、具有良好人机交互界面的特点。选择大学生就业求职网这个题目
                    也是为了能综合运用所学的专业知识,完成一个具体应用及社会服务相结合的项目,
                    通过对它的开发,对个人能力有很大的提高和突破。同时,也能满足就业求职大学生及企业的要求。
                </p>
            </div>
            <div class="right_hy">
                <div class="image_k">
                    <span>
                        <a href="http://localhost:8084/hxjob/pcviews/pos">
                            招聘信息
                        </a>
                    </span>
                </div>
            </div>
            <div class="right_hy">
                <div class="image_k">
                    <span>
                        <a href="http://localhost:8084/hxjob/pcviews/org">
                            机构点评
                        </a>
                    </span>
                </div>
            </div>
            <div class="right_hy">
                <div class="image_k">
                  <span>
                        <a href="http://localhost:8084/hxjob/pcviews/selector">
                            校园杂志
                        </a>
                    </span>
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
            <p class="foot_ebeirui"><em>校园</em>智能招聘</p>
            <p>Powered by <a href="#" target="_Blank" style="color: #f0ad4e">合信码众</a></p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/logo.png" alt="">
        </div>
    </div>
</footer>
<script>
    $("#4").addClass("active");
</script>
</body>
</html>