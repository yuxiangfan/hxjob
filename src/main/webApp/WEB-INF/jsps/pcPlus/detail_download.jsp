<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘网</title>
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pc/js/jquery-2.1.0.min.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
    <link href="${path}/resources/layui/css/layui.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%@ include file="include_head.jsp" %>
<script>
    $("#4").addClass("active");
</script>
<div class="container">
    <div class="wrapper">
        <!--左边-->
        <section class="con_l home_con_l">

            <!--	    下载专区的链接-->
            <div class="list-group">
                <a href="#" class="list-group-item active"> 下载专区 </a>
                <ul id="downList">

                </ul>

            </div>

            <%--分页栏--%>
            <tbody id='body'>

            </tbody>

            <div id='page' style='text-align:right;padding:10px'></div>
        </section>
        <!--右边悬浮-->
        <section class="con_d home_con_r">
            <h3 class="bt">校园杂志</h3>
            <ul>
                <li class="home_con_li home_word">
                    <p><a href="detail_article.jsp" target="_blank">"正规是好事,但是比考试还费时间"</a></p>
                    <p>——面试京东网络客服</p>
                </li>
                <li class="home_con_li home_word">
                    <p><a href="detail_article.jsp" target="_blank">"正规是好事,但是比考试还费时间"</a></p>
                    <p>——面试京东网络客服</p>
                </li>
                <li class="home_con_li home_word">
                    <p><a href="detail_article.jsp" target="_blank">"正规是好事,但是比考试还费时间"</a></p>
                    <p>——面试京东网络客服</p>
                </li>
            </ul>
            <div class="inform">
                <h3 class="r_tt">请关注我们哦！</h3>
                <img src="${path}/resources/pcPlus/images/erweimaBr.jpg" alt="">
            </div>
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
</body>

<script>

    $(function () {

        var laypage;
        layui.use('laypage', function () {
            laypage = layui.laypage;
            download()
        });

        var layer;
        layui.use('layer', function () {
            layer = layui.layer;
        });


        /*下载分页*/
        var total = 0;
        var current = 1;
        var currentIndex;
        var currPage;
        var download = function (curr) {
            if (curr == null || curr == undefined) {
                currPage = 1;
            } else {
                currPage = curr;
            }
            /*数据列表*/
            $.ajax({
                url: 'downList',
                data: {"page": currPage},
                dataType: 'json',
                success: function (data) {
                    $("#body").html('');
                    if (data != null) {
                        total = data.total;
                        var list = data.rows;
                        for (var i = 0; i < data.rows.length; i++) {
                            var validTime = list[i].validTime;
                            var pay = list[i].pay;
                            var member = list[i].member;
                            if (validTime == "all") {
                                validTime = "永久有效"
                            } else if (validTime == "seven") {
                                validTime = "7天有效"
                            } else {
                                validTime = "永久有效"
                            }
                            if (pay == "YES") {
                                pay = "付费下载"
                            } else {
                                pay = "免费下载"
                            }
                            if (member == "YES") {
                                member = "会员专享"
                            } else {
                                member == null;
                            }
                            var add =
                                "  <li>\n" +
                                "                        <div href=\"#\" class=\"list-group-item\">\n" +
                                "                            <span>"+list[i].title+"</span>\n" +

                                "                            <a class=\"badge badge\" style=\"background-color: #9A0002\">付费</a>" +
                                "                            <a class=\"badge badge\" style=\"background-color: #4F0000\">会员专享</a>" +
                                "                            <a class=\"badge badge\" style=\"background-color: grey\">转发下载</a>" +
                                "                            <a class=\"badge badge\" style=\"background-color: grey\">"+validTime+"</a>" +
                                "                            <a class=\"badge badge\" style=\"background-color: grey\" target=\"_blank\" href=" + list[i].link + ">点击下载</a>" +
                                "</div>" +
                                " </li>";
                            $("#downList").append(add);
                        }
                        if (curr == null || curr == undefined || curr == 1) {
                            paging(data.total);
                        }
                    }
                }
            });
        };
        var paging = function (totalCount) {
            laypage.render({
                elem: 'page'
                , count: totalCount
                , limit: 15
                , jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    console.log(first);
                    current = obj.curr;
                    //首次不执行
                    if (!first) {
                        getPositions(obj.curr);
                    }
                }
            });
        };


    })
</script>

</html>