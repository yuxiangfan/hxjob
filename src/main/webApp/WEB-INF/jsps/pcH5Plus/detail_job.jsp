<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>【工商银行招聘信息】-贝睿</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=Kd4FTzjAiPbljiFCZufP1obTzHpe2kjW"></script>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <script src="${path}/resources/pcH5Plus/js/job_search.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <link href="${path}/resources/pcH5Plus/css/recruit.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
</head>
<body class="bg_f5f">

<!--头部文件-->
<!--头部-->
<style>
    #allmap {
        height: 150px;
    }

</style>

<div class="head">
    <div class="head_container">
        <div class="top">
            <img class="logo_br" src="${path}/resources/pcH5Plus/images/logo_br.png">
            &nbsp;&nbsp
            <a class="a_login" href="${path}/hm/login">登入</a>
        </div>
        <form>
            <div class="serch br_dflex input">
                <div class="br_flex">
                    <input type="search" placeholder="搜公司、找职位" class="key">
                </div>
                <div class="serch_btn input_btn"><input name="btn" class="btn" id='search'></div>
            </div>
        </form>
        <div class="tab br_dflex">
            <div class="tit br_flex"><a href="${path}/h5views/index"><i class="a1 "></i><span>首页</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>校园杂志</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>


<div class="content-wrap">

    <div class="br_main" id='page1'>

        <div class="company-head">
            <div class="content">
                <h3 class="">
                    <a class="tit ellipsis">${pos.organization.fullname}</a>
                </h3>
                <p class="text">
                    ${pos.organization.cityname }
                    ·${pos.organization.industryname}
                    ·${pos.positionPeopleNumber}
                </p>
                <ul class="ul_style">
                    <li>${pos.type}</li>
                    <li>|</li>
                    <li>${pos.organization.industryname}</li>
                    <li>|</li>
                    <li>${pos.department}</li>
                    <li>|</li>
                    <li>${pos.code}</li>
                    <li class="ud_time">更新时间：${pos.updatetime}</li>
                    <li>|</li>
                    <li><a><em class="grey_66" onclick=savePosition("${pos.code}")>收藏</em></a></li>
                </ul>
            </div>
        </div>

        <div class="kz_module_head br_dflex kz_m_t_20">
            <div class="l_title br_flex">
                ${pos.organization.fullname}招聘
            </div>
        </div>
        <div>
            <section class="review_box recruit_box kz_m_b_20">
                <div class="userinfo">
                    <dl>
                        <dd class="info">
                            <p class="dd_top br_dflex">
                                <a class="job_name br_flex ellipsis">${pos.title}</a>
                                <a href="" class="job_loc">【工作地点:${pos.organization.cityname}】</a>
                            </p>
                            <p class="dd_bot">
                                职位月薪：${pos.monSalary}
                            </p>
                            <p class="job_claim">
                                <span>经验要求：<em>${pos.experienceRequire}</em></span><i></i>
                                <span>学历要求：<em>${pos.educationRequire}</em></span><i></i>
                                <span>类型：<em>${pos.posType}</em></span>
                            </p>
                        </dd>
                    </dl>
                </div>
                <article>
                    <div class="qa">
                        <a href="" class="question">
                            <p class="question_content grey_66">
                                ${pos.posBrief}
                            </p>
                        </a>
                        <div class="kz_module_head "></div>
                        <c:if test="${pos.duty != null}">
                            <h3>岗位职责:</h3>
                            <p> ${pos.duty}</p>
                            <br>
                        </c:if>
                        <c:if test="${pos.requirement != null}">
                            <h3>任职要求:</h3>
                            <p>${pos.requirement}</p>
                        </c:if>

                        <c:if test="${pos.jobSalary != null}">
                            <h3>薪资报酬</h3>
                            <p>${pos.jobSalary}</p>
                            <br>
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
                            <br>
                        </c:if>

                        <c:if test="${pos.remark != null}">
                            <h3>备注说明:</h3>
                            ${pos.remark}
                            <br>
                        </c:if>

                        <c:if test="${pos.contact != null}">
                            <h3>联系方式:</h3>
                            <p>${pos.contact}</p>
                            <br>
                        </c:if>

                        <div class="kz_module_head "></div>
                        <img src="${path}/resources/pcH5Plus/images/beirui_ma.jpg" class="beirui_2wm">
                        <p> 添加小贝助手，帮您快速修改简历，更快找到好工作！</p>
                    </div>
                </article>
            </section>

            <!--底部-->
            <footer class="br_foot">
                <div class="br_dflex">
                    <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
                    <div class="br_flex dh" style="margin-left: -36px">
                        <a href="footer-help.jsp">帮助</a><em></em>
                        <a href="${path}/hm/login">登录</a><em></em>
                        <a href="${path}/hm/register">注册</a><em></em>
                        <p>Copyright © 2019 beirui.com<br/>
                            贝睿网 版权所有</p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>

</body>
</html>
