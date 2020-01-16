<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <title>贝睿-|评公司|搜职位|中国领先的金融信息平台</title>
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcH5Plus/js/good_search.js"></script>
</head>
<body id="index">
<div class="beirui">
    <div class="br_main ease">
        <!--头部-->
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
                    <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>贝睿精选</span><i class="on"></i></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
                </div>
            </div>
        </div>
        <!---->
        <div class="box_a">
            <div class="b_tit">
                <div class="tit"><em></em>最新热门</div>
            </div>
            <div class="bd ">
                <div class="every_see P_index5">
                    <ul class="com" id="group_list">

                        <!--一条-->
                        <%--<li>
                            <a style="padding:0;">
                                <div class="img br_center"><img style="width: 115%;margin-top: 18px" src="images/132.png"></div>
                                <div class="info">
                                    <div class="name br_elli">
                                        <button style="border: none;background-color: white;margin-left: -7px;font-size:1em;margin-top: -5px;display: block;color: #2c84cc;font-weight: bold; "
                                                onclick="javascrtpt:window.location.href='detail_article.html'">国泰君安证券
                                        </button>
                                    </div>
                                </div>
                                <p style="margin-top: -20px;width: 85%;margin-left: 70px" onclick="javascrtpt:window.location.href='detail_article.html'">
                                    中国银行全称是中国银行股份有限公司（Bank of China Limi银行股份有限公司（Bank of China Limited，简称BOC），总行(Head
                                    Office)......
                                </p>

                            </a>
                            <ul class="ul_style" style="margin:10px 0px">
                                <li style="color: #1b6d85;margin-left: 72px;">行业解读[银行]</li>
                                <li>|</li>
                                <li>原创</li>
                                <li>|</li>
                                <li>10分钟</li>
                            </ul>
                            <div style="border-bottom:1px solid #f3f3f3;margin-bottom: 6px"></div>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
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
</body>
<script>
    var imagePath = '${systemConfig.domain}/${systemConfig.uploadFile}';
</script>
</html>