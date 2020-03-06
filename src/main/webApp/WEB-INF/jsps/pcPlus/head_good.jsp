<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">

<style>
    .js-load-more-good {
        text-align: center;
        position: relative;
        bottom: 155px;
        padding-right: 318px;
    }
</style>
<script>
    var moreLoad = function () {
        $(".js-load-more-good").css("color","#2c84cc")
        $(".js-load-more-good").css("cursor","pointer")
    }
    var LiveReload = function () {
        $(".js-load-more-good").css("color","-internal-root-color")
    }
</script>

<%--引入静态资源--%>
<%@ include file="include_static_resource.jsp" %>
<script src="${path}/resources/pcPlus/js/good_search.js"></script>
<script src="${path}/resources/pcPlus/js/index.js"></script>
<body>
<div class="kj_a">
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>
    <div class="container index" id="container">
        <div class="wrapper">
            <section class="con_l home_con_l">
                <ul class="group_list">

                </ul>
                <em></em>
            </section>

            <section class="con_r home_con_r">
                <h3 class="bt">最新校园杂志</h3>
                <ul class="newAdvice">
                </ul>
            </section>
        </div>
        <div class="js-load-more-good" onmousemove="moreLoad()" onmouseleave="LiveReload()" style="text-align: center">点击加载更多</div>
    </div>
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>
<script>
    var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
    $("#4").addClass("active");
</script>
</html>