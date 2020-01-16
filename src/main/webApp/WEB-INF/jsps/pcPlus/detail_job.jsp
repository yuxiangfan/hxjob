<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=Kd4FTzjAiPbljiFCZufP1obTzHpe2kjW"></script>
    <%@ include file="include_static_resource.jsp" %>

</head>
<style>
    #allmap {
        height: 250px;
    }

    .BMap_cpyCtrl {
        display: none;
    }

    .anchorBL {
        display: none;
    }
</style>
<body>
<div class="kj_a">
    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>

    <div class="container" id="container">
        <div class="wrapper">
            <div class="head">
                <div class="home_con_li detail_job">
                    <a href="javascript:;" style="cursor: default">
                        <img src="${path}${pos.organization.logo}">
                    </a>
                    <input type="hidden" id="score1" value="${pos.organization.score}">
                    <script>
                        $(function () {
                            var score = $("#score1").val() / 0.05;
                            $("#score").css("width", score + '%');
                        })
                    </script>
                    <div class="h_c_l_wrap">
                        <div>
                            <h3 class="job_name">
                                <a href="javascript:;" style="cursor: default">【<span
                                        class="a_span">${pos.organization.cityname}</span>】${pos.organization.fullname}-${pos.title}
                                </a>
                                <span class="grade_star" style="float:right;"><i id="score"></i></span>
                            </h3>
                        </div>
                        <p>${pos.organization.brief}</p>
                        <input type="hidden" id="posCode" value="${pos.code}">
                        <ul>
                            <li>${pos.type}</li>
                            <li>${pos.organization.industryname}</li>
                            <li><span>编号：</span>${pos.code}</li>
                            <li>${pos.publishtime}</li>
                            <li><a id="saveJob" onclick=savePositionDetail("${pos.code}")>收藏</a></li>
                        </ul>
                    </div>
                </div>
                <em class="blank"></em>
            </div>
            <section class="con_l home_con_l" id="posDetail">
                <c:if test="${pos.duty != null}">
                    <h3>岗位职责:</h3>
                    ${pos.duty}
                    <em class="dashed"></em>
                </c:if>

                <c:if test="${pos.requirement != null}">
                    <h3>任职要求:</h3>
                    ${pos.requirement}
                    <em class="dashed"></em>
                </c:if>

                <c:if test="${pos.jobSalary != null}">
                    <h3>薪资报酬</h3>
                    ${pos.jobSalary}
                    <em class="dashed"></em>
                </c:if>

                <c:if test="${pos.workplace != null}">
                    <h3>工作地点</h3>
                    ${pos.workplace}
                    <div id="allmap"></div>
                    <script type="text/javascript">
                        var map = new BMap.Map("allmap");
                        map.centerAndZoom("${pos.workplace}", 15);
                        map.enableScrollWheelZoom(true);
                    </script>
                    <em class="dashed"></em>
                </c:if>


                <c:if test="${pos.remark != null}">
                    <h3>备注说明:</h3>
                    ${pos.remark}
                    <em class="dashed"></em>
                </c:if>

                <c:if test="${pos.contact != null}">
                    <h3>联系方式:</h3>
                    <p>${pos.contact}</p>
                    <em class="dashed"></em>
                </c:if>

                <div class="line_div"></div>
                <img class="no_2d" style=" position: relative;left: 235px;" src="${path}/resources/pcPlus/images/beirui_ma.jpg" alt="">
                <p style="font-size: 10px;text-align: center">
                    添加小贝助手，帮您快速修改简历，更快找到好工作！
                </p>
                <em class="dashed"></em>
            </section>

            <section class="con_r home_con_r">
                <h3 class="bt">贝睿原创</h3>
                <ul class="br">
                    <c:forEach items="${brOriginal2}" var="brOriginal2">
                        <li class="home_con_li home_word">
                            <h4><a href="${path}/pcviews/toNewsDetails/${brOriginal2.id}" target="_blank">${brOriginal2.title}</a></h4>
                            <p>${brOriginal2.editor}</p>
                        </li>
                    </c:forEach>
                </ul>
                <div style="position: relative;" class="inform">
                    <h3 class="r_tt">请关注我们哦！</h3>
                    <img width="165px" src="${path}/resources/pcPlus/images/erweimaBr.jpg" alt="">
                </div>
            </section>
        </div>
    </div>
    <!--尾-->
    <%--尾部--%>
    <jsp:include page="include_footer.jsp"/>
</div>
</body>
<script src="${path}/resources/pcPlus/js/goods_list.js"></script>
<script>
    $("#2").addClass("active");
    /*根据不同岗位显示不同信息*/

</script>
</html>