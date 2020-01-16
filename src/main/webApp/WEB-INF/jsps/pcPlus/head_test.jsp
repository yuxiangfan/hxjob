<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">

<%--引入静态资源--%>
<%@ include file="include_static_resource.jsp" %>

<body>
<div class="kj_a">
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>
    <div class="container index" id="container">
        <div class="wrapper">
            <section class="con_l job_con_l">
                <div class="test_con open_test" onclick="character()">
                    <p class="bt">贝睿性格测试初阶</p>
                    <p>简介:原型为彩色性格测试,经过贝睿团队多次测试改版,可简易方便地测出被测试者性格的优劣势.</p>
                </div>
                <div class="test_con job_test" onclick="compete()">
                    <p class="bt">职业竞争力测试2019版</p>
                    <p>简介:贝睿原创职业竞争力测试指南,可清晰明了地了解求职者的江湖地位...</p>
                </div>
                <div class="test_con disabled_test">
                    <p class="bt">更多测试工具密集开发ing</p>
                </div>
            </section>
            <section class="con_r home_con_r">
                <h3 class="bt">下载专区</h3>
                <ul>
                    <li class="home_con_li_a home_word">
                        <a href="${path}/pcviews/detailDownload">
                            <img src="${path}/resources/pcPlus/images/123456.png" alt="">
                        </a>
                        <h4 class="ul_li_h">"名称"</h4>
                        <p class="ul_li_p">简介:考试讲义，电子书，培训资料等</p>
                    </li>
                </ul>
                <ul>
                    <li class="home_con_li_a home_word">
                        <a href="${path}/pcviews/detailBeckham">
                            <img src="${path}/resources/pcPlus/images/12345.png" alt="">
                        </a>
                        <h4 class="ul_li_h">"小贝+"</h4>
                        <p class="ul_li_p">简介：贝睿的增值服务以及会员体系介绍</p>
                    </li>
                </ul>
            </section>
        </div>
    </div>
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>
<script>
    $("#5").addClass("active");
    //5.test页js
    var character = function () {
        window.location.href = "toCharacter/";
    };
    var compete = function () {
        window.location.href = "poscom/";
    }
</script>
</html>
