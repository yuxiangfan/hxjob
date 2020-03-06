<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘网</title>
    <%@ include file="include_static_resource.jsp" %>
    <link href="${path}/resources/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/business-js/pc/common.js"></script>
    <script src="${path}/resources/pcPlus/js/comment.js"></script>

</head>
<style>
    #replyOk {
        background-color: #2c84cc;
        text-align: center;
        color: #fff;
        border-radius: 3px;
        white-space: nowrap;
        border: 0;
        cursor: pointer;
        margin-left: 280px;
        width: 50px;
        height: 29px;
    }
</style>
<body>
<%--引入头信息--%>
<div class="kj_a">
    <%@ include file="include_head.jsp" %>

    <div class="container" id="container">
        <div class="wrapper">
            <div class="head">
                <div class="home_con_li detail_job">
                    <a href="javascript:;" style="cursor: default">
                        <img src="${path}${org.logo}">
                    </a>
                    <input type="hidden" id="score1" value="${org.score}">
                    <script>
                        $(function () {
                            var score = $("#score1").val() / 0.05;
                            $("#score").css("width", score + '%');
                        })
                    </script>
                    <div class="h_c_l_wrap">
                        <div>
                            <h3 class="com_name"><a href="javascript:;" style="cursor: default">${org.fullname}</a>
                                <span style="float:right;" class="grade_star"><i id="score"></i></span>
                            </h3>
                        </div>
                        <p>${org.brief}</p>
                        <ul>
                            <li>待遇:&nbsp;&nbsp;<span>${org.treatment}</span>分</li>
                            <li>成长性:&nbsp;&nbsp;<span>${org.growth}</span>分</li>
                            <li>工作量:&nbsp;&nbsp;<span>${org.workload}</span>分</li>
                            <li>文化环境:&nbsp;&nbsp;<span>${org.culturalContext}</span>分</li>
                            <li>综合满意度:&nbsp;&nbsp;<span>${org.satisfaction}</span>分</li>
                            <li class="btn">
                                <a class="toComment" href="${path}/pcviews/tocomment/${orgcode }">我要评价</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <script>
                    if (${whetherRemark.whetherRemark==false}) {
                        $(".toComment").html("您已评价");
                        $(".toComment").parent().css("background", "grey");
                    }
                </script>
                <em class="blank"></em>
            </div>
            <section class="con_l job_con_l">
                <div class="option detail_option d_c_l">
                    <dl>
                        <dt>大家说:</dt>
                        <dd id="everyone_say">
                        </dd>
                    </dl>
                    <dl>
                        <dt>排序:</dt>
                        <dd class="option_con">
                            <a class="option_all select" href="javascript:;">全部</a>
                            <a id="select1" href="javascript:;">只看毕业生</a>
                            <a href="javascript:;">只看实习生</a>
                            <a href="javascript:;">只看培训生</a>
                        </dd>
                    </dl>
                </div>
                <script>
                    $(".option_con  a ").click(function () {
                        $(".option_con a").css("color", "#828282");
                        $(this).css("color", "#7cb228");
                    })
                </script>
                <%--显示评论信息--%>
                <div class="tab-pane fade in active">
                    <ul id="comments"></ul>
                    <ul id="recommend" style="display: none">2</ul>
                    <ul id="onJob" style="display: none;">3</ul>
                    <ul id="practice" style="display: none">4</ul>
                </div>
                <script>
                    $(".option_con a").click(
                        function () {
                            var divShow = $(".active").children("ul");
                            if (!$(this).hasClass("select")) {
                                var index = $(this).index();
                                $(this).addClass("select");
                                $(this).siblings("a").removeClass("select");
                                $(divShow[index]).show();
                                $(divShow[index]).siblings("ul").hide();
                            }
                        })
                </script>
                <em></em>
            </section>
            <script> var orgcode = '${orgcode}';</script>
            <%--回复信息界面--%>
            <div class='account' style='display:none'>
                <div>
                    <input type="hidden" id='cid'/>
                    <div class='unit'>
                        <textarea style="margin-left: 30px; margin-top: 20px;" rows="6" cols="45" placeholder="写私信"
                                  class="replyData"></textarea>
                    </div>
                </div>
                <div style='text-align:center;margin-top:10px' class="replyOk">
                    <button class='bt' id="replyOk" onclick="replyOk(val,orgcode)" value="">提交</button>
                </div>
            </div>

            <section class="con_r job_con_r">
                <h3 class="bt">相似机构</h3>
                <ul class="br">
                    <c:forEach items="${similar}" var="similar">
                        <li class="home_con_li home_word">
                            <h4><a style="color: #2c84cc" href="${path}/pcviews/tocommentlist/${similar.code}"
                                   target="_blank">${similar.shortname}-${similar.fullname}</a></h4>
                          <p class="similarP">${similar.brief}</p>
                        </li>
                    </c:forEach>
                </ul>
            </section>
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

</div>
</body>
<script type="text/javascript">
    var orgcode = '${orgcode}';
    $("#3").addClass("active");
</script>
</html>