<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>


<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">
<%--引入静态资源--%>

<%@ include file="include_static_resource.jsp" %>
<link href="${path}/resources/pcPlus/js/fullcalendar-3.9.0/fullcalendar.min.css" rel="stylesheet">
<link href="${path}/resources/pcPlus/js/fullcalendar-3.9.0/fullcalendar.print.min.css" rel="stylesheet" media="print">
<script src="${path}/resources/pcPlus/js/fullcalendar-3.9.0/lib/moment.min.js"></script>
<script src="${path}/resources/pcPlus/js/fullcalendar-3.9.0/lib/jquery.min.js"></script>
<script src="${path}/resources/pcPlus/js/fullcalendar-3.9.0/lib/jquery-ui.min.js"></script>
<script src="${path}/resources/pcPlus/js/fullcalendar-3.9.0/fullcalendar.min.js"></script>

<style>

    .date{
        float: right;
        padding-right: 5px;
    }

    table {
        border-color: white;
        border-collapse: collapse;
        color: white;
        clear: both;
    }

    table th {

        padding: 8px;
        border-style: solid;
        border-color: white;
        background-color: #dedede;

    }

    table td {
        padding: 8px;
        border: 5px solid white;
        background-color: #D8BFD8;
        width: 228px;
        height: 150px;
        font-size: 16px;

    }

    table ul {
        margin-bottom: 55px;
    }


</style>


<body>
<div class="kj_a">

    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>

    <div class="container index" id="container">
        <div class="wrapper">
            <%-- <!--中间-->
                 <div id="calendar" class="calendar"></div>--%>

            <%--日期--%>

            <div class="date" style="font-size: 17px">日期:<span class="data"></span></div>


            <%--日历模块--%>
            <table>
                <%--1--%>
                <tr>
                    <td id="p0">
                        <ul>
                            <li id="m1" style="font-size: 30px">1.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="1">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="1">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p1">
                        <ul>
                            <li style="font-size: 30px">2.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="2">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="2">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p2">
                        <ul>
                            <li style="font-size: 30px">3.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="3">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="3">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p3">
                        <ul>
                            <li style="font-size: 30px">4.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="4">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="4">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                </tr>
                <%--2--%>
                <tr>
                    <td id="p4">
                        <ul>
                            <li style="font-size: 30px">5.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="5">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="5">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p5">
                        <ul>
                            <li style="font-size: 30px">6.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="6">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="6">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p6">
                        <ul>
                            <li style="font-size: 30px">7.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="7">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="7">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p7">
                        <ul>
                            <li style="font-size: 30px">8.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="8">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="8">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                </tr>
                <%--3--%>
                <tr>
                    <td id="p8">
                        <ul>
                            <li style="font-size: 30px">9.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="9">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="9">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p9">
                        <ul>
                            <li style="font-size: 30px">10.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="10">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="10">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p10">
                        <ul>
                            <li style="font-size: 30px">11.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="11">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="11">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                    <td id="p11">
                        <ul>
                            <li style="font-size: 30px">12.<span style="font-size: 20px">月</span></li>
                            <li class="apply" value="12">要&nbsp&nbsp报&nbsp&nbsp的&nbsp&nbsp名</li>
                            <li class="exam" value="12">要&nbsp&nbsp考&nbsp&nbsp的&nbsp&nbsp试</li>
                        </ul>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>
<script src="${path}/resources/pcPlus/js/calendar.js">
</script>
<script>
    $("#6").addClass("active");
</script>
<script>
    $(function () {
        var data = new Date();
        var s = data.toLocaleDateString();
        $(".data").html(s);

        var month = data.getMonth();

        $("#p" + month).css("background-color", "#63B8FF");
        $("#p" + month).css("border-style", "groove");


        $("li[class='apply']").click(
            function () {
                window.location.href = "/smartBR/pcviews/openApplyForm/" + $(this).val();
            }
        );
        $("li[class='apply']").mousemove(
            function () {
               $(this).css("color","black")
                $(this).css("text-decoration","underline ")

            }
        );
        $("li[class='apply']").mouseleave(
            function () {
                $(this).css("color","white")
                $(this).css("text-decoration","none ")
            }
        );

        $("li[class='exam']").click(
            function () {
                window.location.href = "/smartBR/pcviews/openExamForm/" + $(this).val();
            }
        )
        $("li[class='exam']").mousemove(
            function () {
                $(this).css("color","black")
                $(this).css("text-decoration","underline ")

            }
        );
        $("li[class='exam']").mouseleave(
            function () {
                $(this).css("color","white")
                $(this).css("text-decoration","none ")
            }
        );



        $("ul li:nth-child(2)").css("text-align","center");
        $("ul li:nth-child(2)").css("cursor","pointer");
        $("ul li:nth-child(3)").css("text-align","center")
        $("ul li:nth-child(3)").css("padding-top","20px")
        $("ul li:nth-child(3)").css("cursor","pointer");
    })
    /*1.获取点击月份*/


</script>
</html>