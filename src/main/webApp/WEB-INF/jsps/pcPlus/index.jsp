<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<!--设置为英文-->
<html lang="en">

<%--引入静态资源--%>
<%@ include file="include_static_resource.jsp" %>
<script src="${path}/resources/pcPlus/js/index.js"></script>
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
<div class="kj_a">

    <%--引入头信息--%>
    <%@ include file="include_head.jsp" %>

    <!--搜索框-->
    <div class="index_gd">
        <section class="banner">

            <h1 id="select1">校园-智能招聘求职专家</h1>
            <dl class="banner_dl">
                <dd>
                    <div class="banner_search">
                        <input type="text" class="b_search_text" id="input-16" placeholder="搜索招聘信息、公司点评、工资、笔面试经验"
                               name="b_search" maxlength="30" autocomplete="off">
                    </div>
                    <div class="ckt_in">
                        <input id='search_index' type="submit" class="ckt_index search" value="搜索">
                    </div>
                </dd>
            </dl>
        </section>
    </div>
    <%--主体--%>
    <div class="container index" id="container">
        <div class="wrapper">
            <section class="con_l home_con_l">
                <!--热门岗位-->
                <h3 class="bt">热门岗位 <a href="${path}/pcviews/pos"><img style="width: 20px" src="${path}/resources/images/more.png"></a></h3>
                <ul id="getIndexPoss">
                    <!--第一条-->
                </ul>
                <em></em>
                <!--热门机构-->
                <h3 class="bt">热门机构 <a href="${path}/pcviews/org"><img style="width: 20px" src="${path}/resources/images/more.png"></a></h3>
                <ul id="getIndexOrgs">

                </ul>
                <em></em>
                <!--热门评价-->
                <h3 class="bt">热门点评</h3>
                <ul class="remarkHot">
                </ul>
                <em></em>
            </section>

            <%--回复信息界面--%>
            <div class='account' style='display:none'>
                <div>
                    <input type="hidden" id='getcode' value=""/>
                    <div class='unit'>
                        <textarea style="margin-left: 30px; margin-top: 20px;" rows="6" cols="45" placeholder="写私信" class="replyData"></textarea>
                    </div>
                </div>
                <div style='text-align:center;margin-top:10px' class="replyOk">
                    <button class='bt' id="replyOk" onclick="replyOk(val,code)" value="">提交</button>
                </div>
            </div>

            <section class="con_r home_con_r">
                <h3 class="bt">贝睿原创</h3>
                <ul class="brOrig">
                </ul>
                <div style="position: relative;" class="inform">
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

    $("#1").addClass("active");
    var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
</script>
</html>