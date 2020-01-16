<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">
<%--引入静态资源--%>
<%@ include file="include_static_resource.jsp" %>
<script src="${path}/resources/pcPlus/js/good_search.js"></script>
<body>

<script>
    var moreLoad = function () {
        $(".js-load-more-org").css("color","#2c84cc")
        $(".js-load-more-org").css("cursor","pointer")
    }
    var LiveReload = function () {
        $(".js-load-more-org").css("color","-internal-root-color")
    }
</script>

<div class="kj_a">
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>
    <div class="container index" id="container">
        <div class="wrapper">
            <!--右边-->
            <div class="option">
                <dl>
                    <dt>所属行业:</dt>
                    <dd class="b" style="cursor: pointer;" id='industries'>
                        <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                        <c:forEach var='industry' items='${industries}'>
                            <a class="group_body" href="javascript:void(0)"
                               val='${industry.id}'>${industry.name}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <dl>
                    <dt>所在地区:</dt>
                    <dd id='cities'>
                        <a class="group_body" href="javascript:void(0)" style='color:#fb8341' val=''>全部</a>
                        <c:forEach var='city' items='${cities}'>
                            <a class="group_body" href="javascript:void(0)" val='${city.id}'>${city.name}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <em></em>
            </div>

            <!--中间-->
            <section class="con_l job_con_l">
                <ul id="myTab" class=" option_con ">
                    <li class="select"> 全部</li>
                    <li class="hot">&nbsp;热度↓</li>
                </ul>
                <div class="tab-pane fade in active">
                    <%--  <section class="r_con clearfix" id='orgs' style='width:64%'></section>--%>
                    <ul id='orgs'></ul>
                    <ul id="orgsHot" style="display: none;"></ul>
                </div>
                <div class="js-load-more-org" onmousemove="moreLoad()" onmouseleave="LiveReload()" style="text-align: center">点击加载更多</div>
                <%--导航的标签内容切换--%>
                <script>
                    $(function () {
                        $(".option_con li").click(
                            function () {
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

                <em></em>
            </section>
            <!--左边悬浮-->
            <section class="con_r job_con_r">
                <h3 class="bt">我的收藏
                    <span style="font-size: 15px">(机构)</span>
                    <input id="smq" type="hidden" value="${sessionScope.MEMBER.id}">
                    <%--   <span style="font-size: 15px;"><a style="color: red" onclick=orgRefresh(${sessionScope.MEMBER.id})>点击查看</a></span>--%>
                </h3>
                <%--刷新内容--%>
                <ul id="refresh">

                </ul>
                <div class="inform" style="position: relative;">
                    <h3 class="r_tt">请关注我们哦！</h3>
                    <img width="165px" src="${path}/resources/pcPlus/images/erweimaBr.jpg" alt="">
                </div>
            </section>
        </div>
    </div>
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>
<script>
    var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
    $("#3").addClass("active");
</script>
</html>