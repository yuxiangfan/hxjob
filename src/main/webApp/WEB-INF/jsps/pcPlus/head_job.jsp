<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">

<%--引入静态资源--%>
<%@ include file="include_static_resource.jsp" %>

<script>
    var moreLoad = function () {
        $(".js-load-more").css("color", "#2c84cc")
        $(".js-load-more").css("cursor", "pointer")
    }
    var LiveReload = function () {
        $(".js-load-more").css("color", "-internal-root-color")
    }
</script>

<body>
<div class="kj_a">
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>

    <div class="container index" id="container">
        <div class="wrapper">
            <div class="option">
                <dl>
                    <dt>类型:</dt>
                    <dd class="a" id="types">
                        <a href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                        <a class="group_body" href="javascript:void(0)" val='毕业生'>毕业生</a>
                        <a class="group_body" href="javascript:void(0)" val='实习生'>实习生</a>
                        <a class="group_body" href="javascript:void(0)" val='培训生'>培训生</a>
                    </dd>
                </dl>
                <dl>
                    <dt>行业:</dt>
                    <dd class="b" style="cursor: pointer;" id='industries'>
                        <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                        <c:forEach var='industry' items='${industries}'>
                            <a class="group_body" href="javascript:void(0)"
                               val='${industry.id}'>${industry.name}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <dl>
                    <dt>地区:</dt>
                    <dd id='cities'>
                        <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                        <c:forEach var='city' items='${cities}'>
                            <a class="group_body" href="javascript:void(0)" val='${city.id}'>${city.name}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <em></em>
            </div>
            <section class="con_l job_con_l">
                <ul class="option_con">
                    <li id="select" class="select">全部</li>
                    <li id="hot" value="aa">&nbsp;热度↓</li>
                </ul>
                <div class="tab-pane fade in active">
                    <ul id="poss"></ul>
                    <ul id="possHot" style="display: none;"></ul>
                </div>
                <div class="js-load-more" onmousemove="moreLoad()" onmouseleave="LiveReload()" style="text-align: center">点击加载更多</div>
            </section>

            <%--导航的标签内容切换--%>
            <script>
                $(function () {
                    $("#2").addClass("active");
                    $(".option_con li").click(function () {
                            var divShow = $(".active").children("ul");
                            if (!$(this).hasClass("select")) {
                                var index = $(this).index();
                                $(this).addClass("select");
                                $(this).siblings("li").removeClass("select");
                                $(divShow[index]).show();
                                $(divShow[index]).siblings("ul").hide();
                            }
                        }
                    );
                })
            </script>

            <section class="con_r job_con_r">
                <h3 class="bt">我的收藏
                    <span style="font-size: 15px">(职业)</span>
                    <input id="smi" type="hidden" value="${sessionScope.MEMBER.id}">
                    <%-- <span style="font-size: 15px;"><a style="color: red" onclick=getPosition(${sessionScope.MEMBER.id})>点击查看</a></span>--%>
                </h3>
                <ul id="getJob">
                </ul>
            </section>
        </div>
    </div>
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>

</html>

