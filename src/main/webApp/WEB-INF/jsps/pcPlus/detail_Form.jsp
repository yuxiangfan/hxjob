<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap-theme.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/bootstrap-3.4.1/dist/js/bootstrap.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/pcPlus/js/companySearching.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/schoolJS/school.js"></script>
    <link rel="stylesheet" href="${path}/resources/pc/css/public.css"/>
    <script src="${path}/resources/pc/layui/layui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <script src="${path}/resources/pcPlus/js/detail_Form.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

</head>
<style type="text/css">
    .font_a {
        padding-left: 15%;
    }

    .h_search_text {
        outline: none;
        width: 253px;
        height: 34px;
        line-height: 34px;
        padding: 0 40px 0 10px;
        background: white;
        color: black;
    }

    #choose-box-wrapper {
        width: 652px;
        background: #000;
        background-color: rgba(0, 0, 0, 0.5);
        padding: 10px;
        border-radius: 5px;
        display: none;
    }

    #choose-box {
        border: 1px solid #005EAC;
        width: 631px;
        background: #fff;
    }

    #choose-box-title {
        background: #3777BC;
        color: white;
        padding: 4px 10px 5px;
        font-size: 14px;
        font-weight: 700;
        margin: 0;
    }

    #choose-box-title span {
        font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
    }

    #choose-a-province, #choose-a-school {
        margin: 5px 8px 10px 8px;
        border: 1px solid #C3C3C3;
    }

    #choose-a-province a {
        display: inline-block;
        height: 18px;
        line-height: 18px;
        color: #005EAC;
        text-decoration: none;
        font-size: 9pt;
        font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
        margin: 2px 5px;
        padding: 1px;
        text-align: center;
    }

    #choose-a-province a:hover {
        text-decoration: underline;
        cursor: pointer;
    }

    #choose-a-province .choosen {
        background: #005EAC;
        color: white;
    }

    #choose-a-school {
        overflow-x: hidden;
        overflow-y: auto;
        height: 200px;
    }

    #choose-a-school a {
        height: 18px;
        line-height: 18px;
        color: #005EAC;
        text-decoration: none;
        font-size: 9pt;
        font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
        float: left;
        width: 160px;
        margin: 4px 12px;
        padding-left: 10px;
        background: url(70278/2012072500060712.gif) no-repeat 0 9px;
    }

    #choose-a-school a:hover {
        background: #005EAC;
        color: #fff;
    }

    #choose-box-bottom {
        background: #F0F5F8;
        padding: 8px;
        text-align: right;
        border-top: 1px solid #CCC;
        height: 40px;
    }

    #choose-box-bottom input {
        vertical-align: middle;
        text-align: center;
        background: #005EAC;
        color: white;
        border-top: 1px solid #B8D4E8;
        border-left: 1px solid #B8D4E8;
        border-right: 1px solid #114680;
        border-bottom: 1px solid #114680;
        cursor: pointer;
        width: 60px;
        height: 25px;
        margin-right: 6px;
    }
</style>
<body>

<%--引入头信息--%>
<%@ include file="include_head.jsp" %>

<div class="container" id="container">

    <div class="wrapper">


        <!--	表格-->
        <div class="container-fluid" style="padding-top: 10px;" id="gradeForm">
            <div class="row">
                <div class="col-xs-12">
                    <p style="text-align: center;font-size: 30px">智能职位职测表</p>
                    <div class="table-responsible" style="margin-top: 30px">
                        <p>说明：这份职能职测表，会根据您的填写信息并提交后进行相应的打分，请如实准确的填写这份职测表，才会给您精确的分数和职业定位。</p>
                        <p style="margin-left: 43px;">当合法校验上的文字都为<span style="color: green">绿</span>色时，才能提交信息</p>
                        <table class="table table-bordered" align="center" style="table-layout:fixed;width: 960px;">
                            <thead>
                            <tr class="info">
                                <th style="width:120px">大类</th>
                                <th style="width:130px">字段</th>
                                <th style="width:130px">实例</th>
                                <th style="width:200px">实际填写</th>
                                <th style="width:150px">合法校验</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td rowspan="5" class="info">1、基本信息类</td>
                                <td>姓名(必填)</td>
                                <td>张三</td>
                                <td><input id="name" name="name" type="text" class="form-control"></td>
                                <td><span class="can_name"></span></td>
                            </tr>
                            <input type="hidden" name="memberid" id="memberid" value="${sessionScope.MEMBER.id}">
                            <tr>
                                <td>性别</td>
                                <td>男</td>
                                <td>
                                    <form>
                                        <select id="gender" name="gender" style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;">
                                            <option value="" selected="selected">请选择</option>
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </form>
                                </td>
                                <td><span class="can_gender"></span></td>
                            </tr>
                            <tr>
                                <td>年龄（出生日期）</td>
                                <td>1988/2/1</td>
                                <td><input id="birthday" name="birthday" type="date" class="form-control layui-input"></td>
                                <td><span class="can_birthday"></span></td>
                            </tr>
                            <tr>
                                <td>籍贯</td>
                                <td>浙江杭州</td>
                                <td><input id="native_place" name="native_place" type="text" class="form-control"></td>
                                <td><span class="can_native_place"></span></td>
                            </tr>
                            <tr>
                                <td>政治面貌</td>
                                <td>中共党员</td>
                                <td>
                                    <form>
                                        <select id="political_background" name="cars"
                                                style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;">
                                            <option value="" selected="selected">请选择</option>
                                            <option value="中共党员">中共党员</option>
                                            <option value="其他党派">其他党派</option>
                                            <option value="群众">群众</option>
                                            <option value="其他">其他</option>
                                        </select>
                                    </form>
                                </td>
                                <td><span class="can_political_background"></span></td>
                            </tr>
                            <tr>
                                <td rowspan="6" class="info">2、教育背景</td>
                                <td>本科学校</td>
                                <td>清华大学</td>
                                <td>
                                    <input type="text" class="form-control" name="school" id="school" value="请选择大学"
                                           onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}"
                                           onclick="pop(this)"/>
                                </td>
                                <td><span class="can_school"></span></td>
                            </tr>
                            <tr>
                                <td>本科专业</td>
                                <td>财务管理</td>
                                <td>
                                    <select id="major_ben" name="major_ben" style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;"
                                            class="form-control">
                                        <option value="">请选择</option>
                                        <option value="金融学/国际金融">金融学/国际金融</option>
                                        <option value="金融工程/计量经济学">金融工程/计量经济学</option>
                                        <option value="经济学/国际贸易">经济学/国际贸易</option>
                                        <option value="财务管理/会计">财务管理/会计</option>
                                        <option value="统计学/数学">统计学/数学</option>
                                        <option value="法学">法学</option>
                                        <option value="计算机科学/软件工程">计算机科学/软件工程</option>
                                        <option value="物理/化学/生物等基础学科">物理/化学/生物等基础学科</option>
                                        <option value="工商管理">工商管理</option>
                                        <option value="企业管理">企业管理</option>
                                        <option value="市场营销">市场营销</option>
                                        <option value="电子商务">电子商务</option>
                                        <option value="信息系统">信息系统</option>
                                        <option value="外语">外语</option>
                                        <option value="历史">历史</option>
                                        <option value="中文">中文</option>
                                        <option value="艺术类">艺术类</option>
                                        <option value="社会学">社会学</option>
                                        <option value="心理学">心理学</option>
                                        <option value="其他文史类专业">其他文史类专业</option>
                                    </select>
                                </td>
                                <td class="can_major_ben"></td>
                            </tr>
                            <tr>
                                <td>硕士学校</td>
                                <td>北京大学</td>
                                <td>
                                    <input type="text" class="form-control" name="school_plus" id="school_plus" value="请选择大学"
                                           onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}"
                                           onclick="pop(this)"/>
                                </td>
                                <td class="can_school_plus"></td>
                            </tr>
                            <tr>
                                <td>硕士专业</td>
                                <td>财务管理</td>
                                <td>
                                    <select id="major_shuo" name="major_shuo" style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;">
                                        <option value="">请选择</option>
                                        <option value="金融学/国际金融">金融学/国际金融</option>
                                        <option value="金融工程/计量经济学">金融工程/计量经济学</option>
                                        <option value="经济学/国际贸易">经济学/国际贸易</option>
                                        <option value="财务管理/会计">财务管理/会计</option>
                                        <option value="统计学/数学">统计学/数学</option>
                                        <option value="法学">法学</option>
                                        <option value="计算机科学/软件工程">计算机科学/软件工程</option>
                                        <option value="物理/化学/生物等基础学科">物理/化学/生物等基础学科</option>
                                        <option value="工商管理">工商管理</option>
                                        <option value="企业管理">企业管理</option>
                                        <option value="市场营销">市场营销</option>
                                        <option value="电子商务">电子商务</option>
                                        <option value="信息系统">信息系统</option>
                                        <option value="外语">外语</option>
                                        <option value="历史">历史</option>
                                        <option value="中文">中文</option>
                                        <option value="艺术类">艺术类</option>
                                        <option value="社会学">社会学</option>
                                        <option value="心理学">心理学</option>
                                        <option value="其他文史类专业">其他文史类专业</option>
                                    </select>
                                </td>
                                <td class="can_major_shuo"></td>
                            </tr>
                            <tr>
                                <td>博士学校（要加入学时间的标签）</td>
                                <td>北京大学</td>
                                <td><input id="school_big" type="text" name="school_big" class="form-control"></td>
                                <td class="can_school_big"></td>
                            </tr>
                            <tr>
                                <td>博士专业</td>
                                <td>金融学</td>
                                <td><input id="major_bo" type="text" name="major_bo" class="form-control"></td>
                                <td class="can_major_bo"></td>
                            </tr>
                            <tr>
                                <td rowspan="4" class="info">3、证书技能</td>
                                <td>专业考试证书</td>
                                <td>可以选填,没有则不填</td>
                                <td>
                                    <p><input type="checkbox" id="skill_book1" name="skill_book1" class="nationBook" value="CPA全科|CFA三级|美精算师"/>CPA全科|CFA三级|美精算师
                                    </p>
                                    <p><input type="checkbox" name="skill_book2" id="skill_book2" class="nationBook" value="司法|CPA1-2级|FRM"/>司法|CPA1-2级|FRM</p>
                                    <p><input type="checkbox" name="skill_book3" id="skill_book3" class="nationBook" value="司法考试"/>司法考试</p>
                                    <p><input type="checkbox" name="skill_book4" id="skill_book4" class="nationBook" value="从业资格"/>从业资格</p>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>是否有语言类证书（四六级、托福托业等)</td>
                                <td>可以选填，没有则不填</td>
                                <td>
                                    <p><input type="checkbox" id="language_book1" name="language_book1" class="nationBook" value="英文4/6级"/>英文4/6级 </p>
                                    <p><input type="checkbox" id="language_book2" name="language_book2" class="nationBook" value="托福/雅思"/>托福/雅思</p>
                                    <p><input type="checkbox" id="language_book3" name="language_book3" class="nationBook" value="托业"/>托业</p>
                                    <p><input type="checkbox" id="language_book4" name="language_book5" class="nationBook" value="Office"/>Office</p>
                                    <p><input type="checkbox" id="language_book5" name="language_book5" class="nationBook" value="C# JAVA"/>C# JAVA</p>
                                    <p><input type="checkbox" id="language_book6" name="language_book6" class="nationBook" value="无"/>无</p>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>奖学金、学生干部、荣誉证书</td>
                                <td>可以选填，没有则不填</td>
                                <td>
                                    <p><input type="checkbox" name="nation_book1" id="nation_book1" class="nationBook" value="国家级奖学金/学生干部/大赛获奖"/>国家级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book2" id="nation_book2" class="nationBook" value="省级部奖学金/学生干部/大赛获奖"/>省级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book3" id="nation_book3" class="nationBook" value="校级奖学金/学生干部/大赛获奖"/>校级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book4" id="nation_book4" class="nationBook" value="无或其他"/>无或其他</p>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>其他技能（运动员、钢琴、游泳等）、大赛</td>
                                <td>可以选填，没有则不填</td>
                                <td><input id="high_book" name="high_book" type="text" class="form-control"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td rowspan="6" class="info">4、实习等（最多填3个）</td>
                                <td>实习单位1</td>
                                <td>中信证券</td>
                                <td><select id="practice_unit_one" name="practice_unit_one" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option value="">请选择</option>
                                    <option value="爱建证券有限责任公司">爱建证券有限责任公司</option>
                                    <option value="安信证券股份有限公司">安信证券股份有限公司</option>
                                    <option value="北京高华证券有限责任公司">北京高华证券有限责任公司</option>
                                    <option value="渤海证券股份有限公司">渤海证券股份有限公司</option>
                                    <option value="财达证券股份有限公司">财达证券股份有限公司</option>
                                    <option value="财富证券有限责任公司">财富证券有限责任公司</option>
                                    <option value="财通证券股份有限公司">财通证券股份有限公司</option>
                                    <option value="财通证券资产管理有限公司">财通证券资产管理有限公司</option>
                                    <option value="长城国瑞证券有限公司">长城国瑞证券有限公司</option>
                                    <option value="长城证券股份有限公司">长城证券股份有限公司</option>
                                    <option value="长江证券（上海）资产管理有限公司">长江证券（上海）资产管理有限公司</option>
                                    <option value="长江证券承销保荐有限公司">长江证券承销保荐有限公司</option>
                                    <option value="长江证券股份有限公司">长江证券股份有限公司</option>
                                    <option value="网信证券有限责任公司">网信证券有限责任公司</option>
                                    <option value="川财证券有限责任公司">川财证券有限责任公司</option>
                                    <option value="大通证券股份有限公司">大通证券股份有限公司</option>
                                    <option value="大同证券有限责任公司">大同证券有限责任公司</option>
                                    <option value="德邦证券股份有限公司">德邦证券股份有限公司</option>
                                    <option value="第一创业证券承销保荐有限责任公司">第一创业证券承销保荐有限责任公司</option>
                                    <option value="第一创业证券股份有限公司">第一创业证券股份有限公司</option>
                                    <option value="东北证券股份有限公司">东北证券股份有限公司</option>
                                    <option value="东方花旗证券有限公司">东方花旗证券有限公司</option>
                                    <option value="东方证券股份有限公司">东方证券股份有限公司</option>
                                    <option value="东海证券股份有限公司">东海证券股份有限公司</option>
                                    <option value="东莞证券股份有限公司">东莞证券股份有限公司</option>
                                    <option value="东吴证券股份有限公司">东吴证券股份有限公司</option>
                                    <option value="东兴证券股份有限公司">东兴证券股份有限公司</option>
                                    <option value="方正证券股份有限公司">方正证券股份有限公司</option>
                                    <option value="高盛高华证券有限责任公司">高盛高华证券有限责任公司</option>
                                    <option value="光大证券股份有限公司">光大证券股份有限公司</option>
                                    <option value="广发证券股份有限公司">广发证券股份有限公司</option>
                                    <option value="广发证券资产管理（广东）有限公司">广发证券资产管理（广东）有限公司</option>
                                    <option value="广州证券股份有限公司">广州证券股份有限公司</option>
                                    <option value="国都证券股份有限公司">国都证券股份有限公司</option>
                                    <option value="国海证券股份有限公司">国海证券股份有限公司</option>
                                    <option value="国金证券股份有限公司">国金证券股份有限公司</option>
                                    <option value="国开证券股份有限公司">国开证券股份有限公司</option>
                                    <option value="国联证券股份有限公司">国联证券股份有限公司</option>
                                    <option value="国盛证券有限责任公司">国盛证券有限责任公司</option>
                                    <option value="国泰君安证券股份有限公司">国泰君安证券股份有限公司</option>
                                    <option value="国信证券股份有限公司">国信证券股份有限公司</option>
                                    <option value="国元证券股份有限公司">国元证券股份有限公司</option>
                                    <option value="中天国富证券有限公司">中天国富证券有限公司</option>
                                    <option value="海通证券股份有限公司">海通证券股份有限公司</option>
                                    <option value="恒泰长财证券有限责任公司">恒泰长财证券有限责任公司</option>
                                    <option value="恒泰证券股份有限公司">恒泰证券股份有限公司</option>
                                    <option value="红塔证券股份有限公司">红塔证券股份有限公司</option>
                                    <option value="宏信证券有限责任公司">宏信证券有限责任公司</option>
                                    <option value="华安证券股份有限公司">华安证券股份有限公司</option>
                                    <option value="华宝证券有限责任公司">华宝证券有限责任公司</option>
                                    <option value="华创证券有限责任公司">华创证券有限责任公司</option>
                                    <option value="华福证券有限责任公司">华福证券有限责任公司</option>
                                    <option value="华金证券股份有限公司">华金证券股份有限公司</option>
                                    <option value="华林证券有限责任公司">华林证券有限责任公司</option>
                                    <option value="华龙证券股份有限公司">华龙证券股份有限公司</option>
                                    <option value="华融证券股份有限公司">华融证券股份有限公司</option>
                                    <option value="华泰联合证券有限责任公司">华泰联合证券有限责任公司</option>
                                    <option value="华泰证券(上海）资产管理有限公司">华泰证券(上海）资产管理有限公司</option>
                                    <option value="华泰证券股份有限公司">华泰证券股份有限公司</option>
                                    <option value="华西证券股份有限公司">华西证券股份有限公司</option>
                                    <option value="华鑫证券有限责任公司">华鑫证券有限责任公司</option>
                                    <option value="华英证券有限责任公司">华英证券有限责任公司</option>
                                    <option value="江海证券有限公司">江海证券有限公司</option>
                                    <option value="金通证券有限责任公司">金通证券有限责任公司</option>
                                    <option value="金元证券股份有限公司">金元证券股份有限公司</option>
                                    <option value="九州证券股份有限公司">九州证券股份有限公司</option>
                                    <option value="开源证券股份有限公司">开源证券股份有限公司</option>
                                    <option value="联讯证券股份有限公司">联讯证券股份有限公司</option>
                                    <option value="民生证券股份有限公司">民生证券股份有限公司</option>
                                    <option value="摩根士丹利华鑫证券有限责任公司">摩根士丹利华鑫证券有限责任公司</option>
                                    <option value="南京证券股份有限公司">南京证券股份有限公司</option>
                                    <option value="平安证券股份有限公司">平安证券股份有限公司</option>
                                    <option value="中泰证券（上海）资产管理有限公司">中泰证券（上海）资产管理有限公司</option>
                                    <option value="中泰证券股份有限公司">中泰证券股份有限公司</option>
                                    <option value="国融证券股份有限公司">国融证券股份有限公司</option>
                                    <option value="瑞信方正证券有限责任公司">瑞信方正证券有限责任公司</option>
                                    <option value="瑞银证券有限责任公司">瑞银证券有限责任公司</option>
                                    <option value="山西证券股份有限公司">山西证券股份有限公司</option>
                                    <option value="上海东方证券资产管理有限公司">上海东方证券资产管理有限公司</option>
                                    <option value="上海光大证券资产管理有限公司">上海光大证券资产管理有限公司</option>
                                    <option value="上海国泰君安证券资产管理有限公司">上海国泰君安证券资产管理有限公司</option>
                                    <option value="上海海通证券资产管理有限公司">上海海通证券资产管理有限公司</option>
                                    <option value="上海华信证券有限责任公司">上海华信证券有限责任公司</option>
                                    <option value="上海证券有限责任公司">上海证券有限责任公司</option>
                                    <option value="申万宏源西部证券有限公司">申万宏源西部证券有限公司</option>
                                    <option value="申万宏源证券承销保荐有限责任公司">申万宏源证券承销保荐有限责任公司</option>
                                    <option value="申万宏源证券有限公司">申万宏源证券有限公司</option>
                                    <option value="世纪证券有限责任公司">世纪证券有限责任公司</option>
                                    <option value="首创证券有限责任公司">首创证券有限责任公司</option>
                                    <option value="太平洋证券股份有限公司">太平洋证券股份有限公司</option>
                                    <option value="天风证券股份有限公司">天风证券股份有限公司</option>
                                    <option value="万和证券股份有限公司">万和证券股份有限公司</option>
                                    <option value="万联证券股份有限公司">万联证券股份有限公司</option>
                                    <option value="五矿证券有限公司">五矿证券有限公司</option>
                                    <option value="西部证券股份有限公司">西部证券股份有限公司</option>
                                    <option value="西藏东方财富证券股份有限公司">西藏东方财富证券股份有限公司</option>
                                    <option value="西南证券股份有限公司">西南证券股份有限公司</option>
                                    <option value="湘财证券有限责任公司">湘财证券有限责任公司</option>
                                    <option value="新时代证券股份有限公司">新时代证券股份有限公司</option>
                                    <option value="信达证券股份有限公司">信达证券股份有限公司</option>
                                    <option value="兴业证券股份有限公司">兴业证券股份有限公司</option>
                                    <option value="兴证证券资产管理有限公司">兴证证券资产管理有限公司</option>
                                    <option value="银河金汇证券资产管理有限公司">银河金汇证券资产管理有限公司</option>
                                    <option value="银泰证券有限责任公司">银泰证券有限责任公司</option>
                                    <option value="英大证券有限责任公司">英大证券有限责任公司</option>
                                    <option value="招商证券股份有限公司">招商证券股份有限公司</option>
                                    <option value="招商证券资产管理有限公司">招商证券资产管理有限公司</option>
                                    <option value="浙江浙商证券资产管理有限公司">浙江浙商证券资产管理有限公司</option>
                                    <option value="浙商证券股份有限公司">浙商证券股份有限公司</option>
                                    <option value="中德证券有限责任公司">中德证券有限责任公司</option>
                                    <option value="中国国际金融股份有限公司">中国国际金融股份有限公司</option>
                                    <option value="中国民族证券有限责任公司">中国民族证券有限责任公司</option>
                                    <option value="中国银河证券股份有限公司">中国银河证券股份有限公司</option>
                                    <option value="中国中投证券有限责任公司">中国中投证券有限责任公司</option>
                                    <option value="中航证券有限公司">中航证券有限公司</option>
                                    <option value="中山证券有限责任公司">中山证券有限责任公司</option>
                                    <option value="中天证券股份有限公司">中天证券股份有限公司</option>
                                    <option value="中信建投证券股份有限公司">中信建投证券股份有限公司</option>
                                    <option value="中信证券（山东）有限责任公司">中信证券（山东）有限责任公司</option>
                                    <option value="中信证券股份有限公司">中信证券股份有限公司</option>
                                    <option value="中银国际证券股份有限公司">中银国际证券股份有限公司</option>
                                    <option value="中邮证券有限责任公司">中邮证券有限责任公司</option>
                                    <option value="中原证券股份有限公司">中原证券股份有限公司</option>
                                    <option value="联储证券有限责任公司">联储证券有限责任公司</option>
                                    <option value="国盛证券资产管理有限公司">国盛证券资产管理有限公司</option>
                                    <option value="东证融汇证券资产管理有限公司">东证融汇证券资产管理有限公司</option>
                                    <option value="渤海汇金证券资产管理有限公司">渤海汇金证券资产管理有限公司</option>
                                    <option value="申港证券股份有限公司">申港证券股份有限公司</option>
                                    <option value="华菁证券有限公司">华菁证券有限公司</option>
                                    <option value="汇丰前海证券有限责任公司">汇丰前海证券有限责任公司</option>
                                    <option value="东亚前海证券有限责任公司">东亚前海证券有限责任公司</option>
                                    <option value="中信信托有限责任公司">中信信托有限责任公司</option>
                                    <option value="重庆国际信托有限公司">重庆国际信托有限公司</option>
                                    <option value="兴业国际信托有限公司">兴业国际信托有限公司</option>
                                    <option value="上海国际信托有限公司">上海国际信托有限公司</option>
                                    <option value="交银国际信托有限公司">交银国际信托有限公司</option>
                                    <option value="中融国际信托有限公司">中融国际信托有限公司</option>
                                    <option value="昆仑信托有限责任公司">昆仑信托有限责任公司</option>
                                    <option value="平安信托有限责任公司">平安信托有限责任公司</option>
                                    <option value="华宝信托有限责任公司">华宝信托有限责任公司</option>
                                    <option value="建信信托有限责任公司">建信信托有限责任公司</option>
                                    <option value="大连华信信托股份有限公司">大连华信信托股份有限公司</option>
                                    <option value="中航信托股份有限公司">中航信托股份有限公司</option>
                                    <option value="华能贵诚信托有限公司">华能贵诚信托有限公司</option>
                                    <option value="西藏信托有限公司">西藏信托有限公司</option>
                                    <option value="长安国际信托股份有限公司">长安国际信托股份有限公司</option>
                                    <option value="中国对外经济贸易信托有限公司">中国对外经济贸易信托有限公司</option>
                                    <option value="五矿国际信托有限公司">五矿国际信托有限公司</option>
                                    <option value="百瑞信托有限责任公司">百瑞信托有限责任公司</option>
                                    <option value="广东粤财信托有限公司">广东粤财信托有限公司</option>
                                    <option value="四川信托有限公司">四川信托有限公司</option>
                                    <option value="中铁信托有限责任公司">中铁信托有限责任公司</option>
                                    <option value="新时代信托股份有限公司">新时代信托股份有限公司</option>
                                    <option value="渤海国际信托有限公司">渤海国际信托有限公司</option>
                                    <option value="光大兴陇信托有限责任公司">光大兴陇信托有限责任公司</option>
                                    <option value="国民信托有限公司">国民信托有限公司</option>
                                    <option value="北方国际信托股份有限公司">北方国际信托股份有限公司</option>
                                    <option value="国投泰康信托有限公司">国投泰康信托有限公司</option>
                                    <option value="山东省国际信托有限公司">山东省国际信托有限公司</option>
                                    <option value="北京国际信托有限公司">北京国际信托有限公司</option>
                                    <option value="上海爱建信托投资有限责任公司">上海爱建信托投资有限责任公司</option>
                                    <option value="安徽国元信托有限责任公司">安徽国元信托有限责任公司</option>
                                    <option value="华鑫国际信托有限公司">华鑫国际信托有限公司</option>
                                    <option value="江苏省国际信托有限责任公司">江苏省国际信托有限责任公司</option>
                                    <option value="中海信托股份有限公司">中海信托股份有限公司</option>
                                    <option value="陕西省国际信托股份有限公司">陕西省国际信托股份有限公司</option>
                                    <option value="中诚信托有限责任公司">中诚信托有限责任公司</option>
                                    <option value="紫金信托有限责任公司">紫金信托有限责任公司</option>
                                    <option value="华融国际信托有限责任公司">华融国际信托有限责任公司</option>
                                    <option value="厦门国际信托有限公司">厦门国际信托有限公司</option>
                                    <option value="安信信托股份有限公司">安信信托股份有限公司</option>
                                    <option value="陆家嘴信托有限公司">陆家嘴信托有限公司</option>
                                    <option value="云南国际信托有限公司">云南国际信托有限公司</option>
                                    <option value="国通信托有限责任公司">国通信托有限责任公司</option>
                                    <option value="中江国际信托股份有限公司">中江国际信托股份有限公司</option>
                                    <option value="天津信托有限责任公司">天津信托有限责任公司</option>
                                    <option value="万向信托有限公司">万向信托有限公司</option>
                                    <option value="中国民生信托有限公司">中国民生信托有限公司</option>
                                    <option value="中粮信托有限责任公司">中粮信托有限责任公司</option>
                                    <option value="中原信托有限公司">中原信托有限公司</option>
                                    <option value="大业信托有限责任公司">大业信托有限责任公司</option>
                                    <option value="新华信托股份有限公司">新华信托股份有限公司</option>
                                    <option value="中国金谷国际信托有限责任公司">中国金谷国际信托有限责任公司</option>
                                    <option value="中建投信托有限责任公司">中建投信托有限责任公司</option>
                                    <option value="吉林省信托有限责任公司">吉林省信托有限责任公司</option>
                                    <option value="中泰信托有限责任公司">中泰信托有限责任公司</option>
                                    <option value="苏州信托有限公司">苏州信托有限公司</option>
                                    <option value="浙商金汇信托股份有限公司">浙商金汇信托股份有限公司</option>
                                    <option value="华澳国际信托有限公司">华澳国际信托有限公司</option>
                                    <option value="湖南省信托有限责任公司">湖南省信托有限责任公司</option>
                                    <option value="国联信托股份有限公司">国联信托股份有限公司</option>
                                    <option value="东莞信托有限公司">东莞信托有限公司</option>
                                    <option value="杭州工商信托股份有限公司">杭州工商信托股份有限公司</option>
                                    <option value="山西信托有限责任公司">山西信托有限责任公司</option>
                                    <option value="新疆长城新盛信托有限责任公司">新疆长城新盛信托有限责任公司</option>
                                    <option value="华宸信托有限责任公司">华宸信托有限责任公司</option>
                                    <option value="国泰基金管理有限公司">国泰基金管理有限公司</option>
                                    <option value="南方基金管理股份有限公司">南方基金管理股份有限公司</option>
                                    <option value="华夏基金管理有限公司">华夏基金管理有限公司</option>
                                    <option value="华安基金管理有限公司">华安基金管理有限公司</option>
                                    <option value="博时基金管理有限公司">博时基金管理有限公司</option>
                                    <option value="鹏华基金管理有限公司">鹏华基金管理有限公司</option>
                                    <option value="长盛基金管理有限公司">长盛基金管理有限公司</option>
                                    <option value="嘉实基金管理有限公司">嘉实基金管理有限公司</option>
                                    <option value="大成基金管理有限公司">大成基金管理有限公司</option>
                                    <option value="富国基金管理有限公司">富国基金管理有限公司</option>
                                    <option value="易方达基金管理有限公司">易方达基金管理有限公司</option>
                                    <option value="宝盈基金管理有限公司">宝盈基金管理有限公司</option>
                                    <option value="融通基金管理有限公司">融通基金管理有限公司</option>
                                    <option value="银华基金管理股份有限公司">银华基金管理股份有限公司</option>
                                    <option value="长城基金管理有限公司">长城基金管理有限公司</option>
                                    <option value="银河基金管理有限公司">银河基金管理有限公司</option>
                                    <option value="泰达宏利基金管理有限公司">泰达宏利基金管理有限公司</option>
                                    <option value="国投瑞银基金管理有限公司">国投瑞银基金管理有限公司</option>
                                    <option value="万家基金管理有限公司">万家基金管理有限公司</option>
                                    <option value="金鹰基金管理有限公司">金鹰基金管理有限公司</option>
                                    <option value="招商基金管理有限公司">招商基金管理有限公司</option>
                                    <option value="华宝基金管理有限公司">华宝基金管理有限公司</option>
                                    <option value="摩根士丹利华鑫基金管理有限公司">摩根士丹利华鑫基金管理有限公司</option>
                                    <option value="国联安基金管理有限公司">国联安基金管理有限公司</option>
                                    <option value="海富通基金管理有限公司">海富通基金管理有限公司</option>
                                    <option value="长信基金管理有限责任公司">长信基金管理有限责任公司</option>
                                    <option value="泰信基金管理有限公司">泰信基金管理有限公司</option>
                                    <option value="天治基金管理有限公司">天治基金管理有限公司</option>
                                    <option value="景顺长城基金管理有限公司">景顺长城基金管理有限公司</option>
                                    <option value="广发基金管理有限公司">广发基金管理有限公司</option>
                                    <option value="兴全基金管理有限公司">兴全基金管理有限公司</option>
                                    <option value="诺安基金管理有限公司">诺安基金管理有限公司</option>
                                    <option value="中海基金管理有限公司">中海基金管理有限公司</option>
                                    <option value="光大保德信基金管理有限公司">光大保德信基金管理有限公司</option>
                                    <option value="华富基金管理有限公司">华富基金管理有限公司</option>
                                    <option value="上投摩根基金管理有限公司">上投摩根基金管理有限公司</option>
                                    <option value="东方基金管理有限责任公司">东方基金管理有限责任公司</option>
                                    <option value="中银基金管理有限公司">中银基金管理有限公司</option>
                                    <option value="东吴基金管理有限公司">东吴基金管理有限公司</option>
                                    <option value="国海富兰克林基金管理有限公司">国海富兰克林基金管理有限公司</option>
                                    <option value="天弘基金管理有限公司">天弘基金管理有限公司</option>
                                    <option value="华泰柏瑞基金管理有限公司">华泰柏瑞基金管理有限公司</option>
                                    <option value="新华基金管理股份有限公司">新华基金管理股份有限公司</option>
                                    <option value="汇添富基金管理股份有限公司">汇添富基金管理股份有限公司</option>
                                    <option value="工银瑞信基金管理有限公司">工银瑞信基金管理有限公司</option>
                                    <option value="交银施罗德基金管理有限公司">交银施罗德基金管理有限公司</option>
                                    <option value="中信保诚基金管理有限公司">中信保诚基金管理有限公司</option>
                                    <option value="建信基金管理有限责任公司">建信基金管理有限责任公司</option>
                                    <option value="华商基金管理有限公司">华商基金管理有限公司</option>
                                    <option value="汇丰晋信基金管理有限公司">汇丰晋信基金管理有限公司</option>
                                    <option value="中邮创业基金管理股份有限公司">中邮创业基金管理股份有限公司</option>
                                    <option value="信达澳银基金管理有限公司">信达澳银基金管理有限公司</option>
                                    <option value="诺德基金管理有限公司">诺德基金管理有限公司</option>
                                    <option value="中欧基金管理有限公司">中欧基金管理有限公司</option>
                                    <option value="金元顺安基金管理有限公司">金元顺安基金管理有限公司</option>
                                    <option value="浦银安盛基金管理有限公司">浦银安盛基金管理有限公司</option>
                                    <option value="农银汇理基金管理有限公司">农银汇理基金管理有限公司</option>
                                    <option value="民生加银基金管理有限公司">民生加银基金管理有限公司</option>
                                    <option value="西部利得基金管理有限公司">西部利得基金管理有限公司</option>
                                    <option value="平安大华基金管理有限公司">平安大华基金管理有限公司</option>
                                    <option value="富安达基金管理有限公司">富安达基金管理有限公司</option>
                                    <option value="方正富邦基金管理有限公司">方正富邦基金管理有限公司</option>
                                    <option value="长安基金管理有限公司">长安基金管理有限公司</option>
                                    <option value="国金基金管理有限公司">国金基金管理有限公司</option>
                                    <option value="安信基金管理有限责任公司">安信基金管理有限责任公司</option>
                                    <option value="德邦基金管理有限公司">德邦基金管理有限公司</option>
                                    <option value="华宸未来基金管理有限公司">华宸未来基金管理有限公司</option>
                                    <option value="红塔红土基金管理有限公司">红塔红土基金管理有限公司</option>
                                    <option value="英大基金管理有限公司">英大基金管理有限公司</option>
                                    <option value="江信基金管理有限公司">江信基金管理有限公司</option>
                                    <option value="太平基金管理有限公司">太平基金管理有限公司</option>
                                    <option value="华润元大基金管理有限公司">华润元大基金管理有限公司</option>
                                    <option value="前海开源基金管理有限公司">前海开源基金管理有限公司</option>
                                    <option value="东海基金管理有限责任公司">东海基金管理有限责任公司</option>
                                    <option value="中加基金管理有限公司">中加基金管理有限公司</option>
                                    <option value="兴业基金管理有限公司">兴业基金管理有限公司</option>
                                    <option value="中融基金管理有限公司">中融基金管理有限公司</option>
                                    <option value="国开泰富基金管理有限责任公司">国开泰富基金管理有限责任公司</option>
                                    <option value="中信建投基金管理有限公司 ">中信建投基金管理有限公司</option>
                                    <option value="上银基金管理有限公司">上银基金管理有限公司</option>
                                    <option value="鑫元基金管理有限公司">鑫元基金管理有限公司</option>
                                    <option value="兴银基金管理有限责任公司 ">兴银基金管理有限责任公司</option>
                                    <option value="国寿安保基金管理有限公司">国寿安保基金管理有限公司</option>
                                    <option value="圆信永丰基金管理有限公司">圆信永丰基金管理有限公司</option>
                                    <option value="中金基金管理有限公司">中金基金管理有限公司</option>
                                    <option value="北信瑞丰基金管理有限公司">北信瑞丰基金管理有限公司</option>
                                    <option value="红土创新基金管理有限公司">红土创新基金管理有限公司</option>
                                    <option value="嘉合基金管理有限公司">嘉合基金管理有限公司</option>
                                    <option value="创金合信基金管理有限公司">创金合信基金管理有限公司</option>
                                    <option value="九泰基金管理有限公司">九泰基金管理有限公司</option>
                                    <option value="泓德基金管理有限公司">泓德基金管理有限公司</option>
                                    <option value="金信基金管理有限公司">金信基金管理有限公司</option>
                                    <option value="新疆前海联合基金管理有限公司">新疆前海联合基金管理有限公司</option>
                                    <option value="新沃基金管理有限公司">新沃基金管理有限公司</option>
                                    <option value="中科沃土基金管理有限公司">中科沃土基金管理有限公司</option>
                                    <option value="富荣基金管理有限公司">富荣基金管理有限公司</option>
                                    <option value="汇安基金管理有限责任公司">汇安基金管理有限责任公司</option>
                                    <option value="先锋基金管理有限公司">先锋基金管理有限公司</option>
                                    <option value="中航基金管理有限公司">中航基金管理有限公司</option>
                                    <option value="华泰保兴基金管理有限公司">华泰保兴基金管理有限公司</option>
                                    <option value="鹏扬基金管理有限公司">鹏扬基金管理有限公司</option>
                                    <option value="恒生前海基金管理有限公司">恒生前海基金管理有限公司</option>
                                    <option value="格林基金管理有限公司">格林基金管理有限公司</option>
                                    <option value="南华基金管理有限公司">南华基金管理有限公司</option>
                                    <option value="凯石基金管理有限公司">凯石基金管理有限公司</option>
                                    <option value="国融基金管理有限公司">国融基金管理有限公司</option>
                                    <option value="东方阿尔法基金管理有限公司">东方阿尔法基金管理有限公司</option>
                                    <option value="恒越基金管理有限公司">恒越基金管理有限公司</option>
                                    <option value="弘毅远方基金管理有限公司">弘毅远方基金管理有限公司</option>
                                    <option value="博道基金管理有限公司">博道基金管理有限公司</option>
                                    <option value="国家开发银行">国家开发银行</option>
                                    <option value="进出口银行">进出口银行</option>
                                    <option value="农业发展银行">农业发展银行</option>
                                    <option value="中国工商银行">中国工商银行</option>
                                    <option value="中国建设银行">中国建设银行</option>
                                    <option value="中国银行">中国银行</option>
                                    <option value="中国农业银行">中国农业银行</option>
                                    <option value="交通银行">交通银行</option>
                                    <option value="招商银行">招商银行</option>
                                    <option value="中信银行">中信银行</option>
                                    <option value="中国民生银行">中国民生银行</option>
                                    <option value="兴业银行">兴业银行</option>
                                    <option value="上海浦东发展银行">上海浦东发展银行</option>
                                    <option value="中国邮政储蓄银行">中国邮政储蓄银行</option>
                                    <option value="中国光大银行">中国光大银行</option>
                                    <option value="平安银行">平安银行</option>
                                    <option value="华夏银行">华夏银行</option>
                                    <option value="北京银行">北京银行</option>
                                    <option value="广发银行">广发银行</option>
                                    <option value="上海银行">上海银行</option>
                                    <option value="江苏银行">江苏银行</option>
                                    <option value="恒丰银行">恒丰银行</option>
                                    <option value="浙商银行">浙商银行</option>
                                    <option value="南京银行">南京银行</option>
                                    <option value="重庆农村商业银行">重庆农村商业银行</option>
                                    <option value="盛京银行">盛京银行</option>
                                    <option value="徽商银行">徽商银行</option>
                                    <option value="宁波银行">宁波银行</option>
                                    <option value="上海农商银行">上海农商银行</option>
                                    <option value="北京农商银行">北京农商银行</option>
                                    <option value="渤海银行">渤海银行</option>
                                    <option value="广州农商银行">广州农商银行</option>
                                    <option value="哈尔滨银行">哈尔滨银行</option>
                                    <option value="中原银行">中原银行</option>
                                    <option value="天津银行">天津银行</option>
                                    <option value="杭州银行 ">杭州银行</option>
                                    <option value="成都农商银行">成都农商银行</option>
                                    <option value="厦门国际银行">厦门国际银行</option>
                                    <option value="锦州银行">锦州银行</option>
                                    <option value="昆仑银行">昆仑银行</option>
                                    <option value="顺德农商银行">顺德农商银行</option>
                                    <option value="重庆银行">重庆银行</option>
                                    <option value="东莞农村商业银行">东莞农村商业银行</option>
                                    <option value="成都银行">成都银行</option>
                                    <option value="天津农商银行">天津农商银行</option>
                                    <option value="吉林银行">吉林银行</option>
                                    <option value="江西银行">江西银行</option>
                                    <option value="广州银行">广州银行</option>
                                    <option value="大连银行">大连银行</option>
                                    <option value="长沙银行">长沙银行</option>
                                    <option value="郑州银行">郑州银行</option>
                                    <option value="苏州银行">苏州银行</option>
                                    <option value="青岛银行">青岛银行</option>
                                    <option value="汉口银行">汉口银行</option>
                                    <option value="河北银行">河北银行</option>
                                    <option value="东莞银行">东莞银行</option>
                                    <option value="武汉农村商业银行">武汉农村商业银行</option>
                                    <option value="西安银行">西安银行</option>
                                    <option value="贵阳银行">贵阳银行</option>
                                    <option value="富滇银行">富滇银行</option>
                                    <option value="兰州银行">兰州银行</option>
                                    <option value="贵州银行">贵州银行</option>
                                    <option value="青岛农商银行">青岛农商银行</option>
                                    <option value="江苏江南农村商业银行">江苏江南农村商业银行</option>
                                    <option value="洛阳银行">洛阳银行</option>
                                    <option value="九江银行">九江银行</option>
                                    <option value="华融湘江银行">华融湘江银行</option>
                                    <option value="甘肃银行">甘肃银行</option>
                                    <option value="龙江银行">龙江银行</option>
                                    <option value="杭州联合农村商业银行">杭州联合农村商业银行</option>
                                    <option value="南海农商银行">南海农商银行</option>
                                    <option value="广西北部湾银行">广西北部湾银行</option>
                                    <option value="湖北银行">湖北银行</option>
                                    <option value="萧山农商银行">萧山农商银行</option>
                                    <option value="浙江稠州银行">浙江稠州银行</option>
                                    <option value="广东南粤银行">广东南粤银行</option>
                                    <option value="吉林九台农村商业银行">吉林九台农村商业银行</option>
                                    <option value="南充市商业银行">南充市商业银行</option>
                                    <option value="台州银行">台州银行</option>
                                    <option value="齐鲁银行">齐鲁银行</option>
                                    <option value="天津滨海农村商业银行">天津滨海农村商业银行</option>
                                    <option value="长安银行">长安银行</option>
                                    <option value="温州银行">温州银行</option>
                                    <option value="陕西秦农农村商业银行">陕西秦农农村商业银行</option>
                                    <option value="宁夏银行">宁夏银行</option>
                                    <option value="威海市商业银行">威海市商业银行</option>
                                    <option value="晋商银行">晋商银行</option>
                                    <option value="内蒙古银行">内蒙古银行</option>
                                    <option value="珠海华润银行">珠海华润银行</option>
                                    <option value="桂林银行">桂林银行</option>
                                    <option value="江苏常熟农村商业银行">江苏常熟农村商业银行</option>
                                    <option value="厦门银行">厦门银行</option>
                                    <option value="唐山市商业银行">唐山市商业银行</option>
                                    <option value="阜新银行">阜新银行</option>
                                    <option value="营口银行">营口银行</option>
                                    <option value="日照银行">日照银行</option>
                                    <option value="乌鲁木齐银行">乌鲁木齐银行</option>
                                    <option value="大连农商银行">大连农商银行</option>
                                    <option value="江苏江阴农村商业银行">江苏江阴农村商业银行</option>
                                    <option value="福建海峡银行">福建海峡银行</option>
                                </select></td>
                                <td class="can_practice_unit_one"></td>
                            <tr>
                                <td>实习岗位1</td>
                                <td>投资银行部</td>
                                <td>
                                    <input id="practice_post_one" name="practice_post_one" type="text" class="form-control">
                                </td>
                                <td class="can_practice_post_one"></td>
                            </tr>
                            <tr>
                                <td>实习单位2</td>
                                <td>嘉实基金</td>
                                <td>
                                    <select id="practice_unit_two" name="practice_unit_two" class="selectpicker show-tick form-control" data-live-search="true">
                                        <option value="">请选择</option>
                                        <option value="爱建证券有限责任公司">爱建证券有限责任公司</option>
                                        <option value="安信证券股份有限公司">安信证券股份有限公司</option>
                                        <option value="北京高华证券有限责任公司">北京高华证券有限责任公司</option>
                                        <option value="渤海证券股份有限公司">渤海证券股份有限公司</option>
                                        <option value="财达证券股份有限公司">财达证券股份有限公司</option>
                                        <option value="财富证券有限责任公司">财富证券有限责任公司</option>
                                        <option value="财通证券股份有限公司">财通证券股份有限公司</option>
                                        <option value="财通证券资产管理有限公司">财通证券资产管理有限公司</option>
                                        <option value="长城国瑞证券有限公司">长城国瑞证券有限公司</option>
                                        <option value="长城证券股份有限公司">长城证券股份有限公司</option>
                                        <option value="长江证券（上海）资产管理有限公司">长江证券（上海）资产管理有限公司</option>
                                        <option value="长江证券承销保荐有限公司">长江证券承销保荐有限公司</option>
                                        <option value="长江证券股份有限公司">长江证券股份有限公司</option>
                                        <option value="网信证券有限责任公司">网信证券有限责任公司</option>
                                        <option value="川财证券有限责任公司">川财证券有限责任公司</option>
                                        <option value="大通证券股份有限公司">大通证券股份有限公司</option>
                                        <option value="大同证券有限责任公司">大同证券有限责任公司</option>
                                        <option value="德邦证券股份有限公司">德邦证券股份有限公司</option>
                                        <option value="第一创业证券承销保荐有限责任公司">第一创业证券承销保荐有限责任公司</option>
                                        <option value="第一创业证券股份有限公司">第一创业证券股份有限公司</option>
                                        <option value="东北证券股份有限公司">东北证券股份有限公司</option>
                                        <option value="东方花旗证券有限公司">东方花旗证券有限公司</option>
                                        <option value="东方证券股份有限公司">东方证券股份有限公司</option>
                                        <option value="东海证券股份有限公司">东海证券股份有限公司</option>
                                        <option value="东莞证券股份有限公司">东莞证券股份有限公司</option>
                                        <option value="东吴证券股份有限公司">东吴证券股份有限公司</option>
                                        <option value="东兴证券股份有限公司">东兴证券股份有限公司</option>
                                        <option value="方正证券股份有限公司">方正证券股份有限公司</option>
                                        <option value="高盛高华证券有限责任公司">高盛高华证券有限责任公司</option>
                                        <option value="光大证券股份有限公司">光大证券股份有限公司</option>
                                        <option value="广发证券股份有限公司">广发证券股份有限公司</option>
                                        <option value="广发证券资产管理（广东）有限公司">广发证券资产管理（广东）有限公司</option>
                                        <option value="广州证券股份有限公司">广州证券股份有限公司</option>
                                        <option value="国都证券股份有限公司">国都证券股份有限公司</option>
                                        <option value="国海证券股份有限公司">国海证券股份有限公司</option>
                                        <option value="国金证券股份有限公司">国金证券股份有限公司</option>
                                        <option value="国开证券股份有限公司">国开证券股份有限公司</option>
                                        <option value="国联证券股份有限公司">国联证券股份有限公司</option>
                                        <option value="国盛证券有限责任公司">国盛证券有限责任公司</option>
                                        <option value="国泰君安证券股份有限公司">国泰君安证券股份有限公司</option>
                                        <option value="国信证券股份有限公司">国信证券股份有限公司</option>
                                        <option value="国元证券股份有限公司">国元证券股份有限公司</option>
                                        <option value="中天国富证券有限公司">中天国富证券有限公司</option>
                                        <option value="海通证券股份有限公司">海通证券股份有限公司</option>
                                        <option value="恒泰长财证券有限责任公司">恒泰长财证券有限责任公司</option>
                                        <option value="恒泰证券股份有限公司">恒泰证券股份有限公司</option>
                                        <option value="红塔证券股份有限公司">红塔证券股份有限公司</option>
                                        <option value="宏信证券有限责任公司">宏信证券有限责任公司</option>
                                        <option value="华安证券股份有限公司">华安证券股份有限公司</option>
                                        <option value="华宝证券有限责任公司">华宝证券有限责任公司</option>
                                        <option value="华创证券有限责任公司">华创证券有限责任公司</option>
                                        <option value="华福证券有限责任公司">华福证券有限责任公司</option>
                                        <option value="华金证券股份有限公司">华金证券股份有限公司</option>
                                        <option value="华林证券有限责任公司">华林证券有限责任公司</option>
                                        <option value="华龙证券股份有限公司">华龙证券股份有限公司</option>
                                        <option value="华融证券股份有限公司">华融证券股份有限公司</option>
                                        <option value="华泰联合证券有限责任公司">华泰联合证券有限责任公司</option>
                                        <option value="华泰证券(上海）资产管理有限公司">华泰证券(上海）资产管理有限公司</option>
                                        <option value="华泰证券股份有限公司">华泰证券股份有限公司</option>
                                        <option value="华西证券股份有限公司">华西证券股份有限公司</option>
                                        <option value="华鑫证券有限责任公司">华鑫证券有限责任公司</option>
                                        <option value="华英证券有限责任公司">华英证券有限责任公司</option>
                                        <option value="江海证券有限公司">江海证券有限公司</option>
                                        <option value="金通证券有限责任公司">金通证券有限责任公司</option>
                                        <option value="金元证券股份有限公司">金元证券股份有限公司</option>
                                        <option value="九州证券股份有限公司">九州证券股份有限公司</option>
                                        <option value="开源证券股份有限公司">开源证券股份有限公司</option>
                                        <option value="联讯证券股份有限公司">联讯证券股份有限公司</option>
                                        <option value="民生证券股份有限公司">民生证券股份有限公司</option>
                                        <option value="摩根士丹利华鑫证券有限责任公司">摩根士丹利华鑫证券有限责任公司</option>
                                        <option value="南京证券股份有限公司">南京证券股份有限公司</option>
                                        <option value="平安证券股份有限公司">平安证券股份有限公司</option>
                                        <option value="中泰证券（上海）资产管理有限公司">中泰证券（上海）资产管理有限公司</option>
                                        <option value="中泰证券股份有限公司">中泰证券股份有限公司</option>
                                        <option value="国融证券股份有限公司">国融证券股份有限公司</option>
                                        <option value="瑞信方正证券有限责任公司">瑞信方正证券有限责任公司</option>
                                        <option value="瑞银证券有限责任公司">瑞银证券有限责任公司</option>
                                        <option value="山西证券股份有限公司">山西证券股份有限公司</option>
                                        <option value="上海东方证券资产管理有限公司">上海东方证券资产管理有限公司</option>
                                        <option value="上海光大证券资产管理有限公司">上海光大证券资产管理有限公司</option>
                                        <option value="上海国泰君安证券资产管理有限公司">上海国泰君安证券资产管理有限公司</option>
                                        <option value="上海海通证券资产管理有限公司">上海海通证券资产管理有限公司</option>
                                        <option value="上海华信证券有限责任公司">上海华信证券有限责任公司</option>
                                        <option value="上海证券有限责任公司">上海证券有限责任公司</option>
                                        <option value="申万宏源西部证券有限公司">申万宏源西部证券有限公司</option>
                                        <option value="申万宏源证券承销保荐有限责任公司">申万宏源证券承销保荐有限责任公司</option>
                                        <option value="申万宏源证券有限公司">申万宏源证券有限公司</option>
                                        <option value="世纪证券有限责任公司">世纪证券有限责任公司</option>
                                        <option value="首创证券有限责任公司">首创证券有限责任公司</option>
                                        <option value="太平洋证券股份有限公司">太平洋证券股份有限公司</option>
                                        <option value="天风证券股份有限公司">天风证券股份有限公司</option>
                                        <option value="万和证券股份有限公司">万和证券股份有限公司</option>
                                        <option value="万联证券股份有限公司">万联证券股份有限公司</option>
                                        <option value="五矿证券有限公司">五矿证券有限公司</option>
                                        <option value="西部证券股份有限公司">西部证券股份有限公司</option>
                                        <option value="西藏东方财富证券股份有限公司">西藏东方财富证券股份有限公司</option>
                                        <option value="西南证券股份有限公司">西南证券股份有限公司</option>
                                        <option value="湘财证券有限责任公司">湘财证券有限责任公司</option>
                                        <option value="新时代证券股份有限公司">新时代证券股份有限公司</option>
                                        <option value="信达证券股份有限公司">信达证券股份有限公司</option>
                                        <option value="兴业证券股份有限公司">兴业证券股份有限公司</option>
                                        <option value="兴证证券资产管理有限公司">兴证证券资产管理有限公司</option>
                                        <option value="银河金汇证券资产管理有限公司">银河金汇证券资产管理有限公司</option>
                                        <option value="银泰证券有限责任公司">银泰证券有限责任公司</option>
                                        <option value="英大证券有限责任公司">英大证券有限责任公司</option>
                                        <option value="招商证券股份有限公司">招商证券股份有限公司</option>
                                        <option value="招商证券资产管理有限公司">招商证券资产管理有限公司</option>
                                        <option value="浙江浙商证券资产管理有限公司">浙江浙商证券资产管理有限公司</option>
                                        <option value="浙商证券股份有限公司">浙商证券股份有限公司</option>
                                        <option value="中德证券有限责任公司">中德证券有限责任公司</option>
                                        <option value="中国国际金融股份有限公司">中国国际金融股份有限公司</option>
                                        <option value="中国民族证券有限责任公司">中国民族证券有限责任公司</option>
                                        <option value="中国银河证券股份有限公司">中国银河证券股份有限公司</option>
                                        <option value="中国中投证券有限责任公司">中国中投证券有限责任公司</option>
                                        <option value="中航证券有限公司">中航证券有限公司</option>
                                        <option value="中山证券有限责任公司">中山证券有限责任公司</option>
                                        <option value="中天证券股份有限公司">中天证券股份有限公司</option>
                                        <option value="中信建投证券股份有限公司">中信建投证券股份有限公司</option>
                                        <option value="中信证券（山东）有限责任公司">中信证券（山东）有限责任公司</option>
                                        <option value="中信证券股份有限公司">中信证券股份有限公司</option>
                                        <option value="中银国际证券股份有限公司">中银国际证券股份有限公司</option>
                                        <option value="中邮证券有限责任公司">中邮证券有限责任公司</option>
                                        <option value="中原证券股份有限公司">中原证券股份有限公司</option>
                                        <option value="联储证券有限责任公司">联储证券有限责任公司</option>
                                        <option value="国盛证券资产管理有限公司">国盛证券资产管理有限公司</option>
                                        <option value="东证融汇证券资产管理有限公司">东证融汇证券资产管理有限公司</option>
                                        <option value="渤海汇金证券资产管理有限公司">渤海汇金证券资产管理有限公司</option>
                                        <option value="申港证券股份有限公司">申港证券股份有限公司</option>
                                        <option value="华菁证券有限公司">华菁证券有限公司</option>
                                        <option value="汇丰前海证券有限责任公司">汇丰前海证券有限责任公司</option>
                                        <option value="东亚前海证券有限责任公司">东亚前海证券有限责任公司</option>
                                        <option value="中信信托有限责任公司">中信信托有限责任公司</option>
                                        <option value="重庆国际信托有限公司">重庆国际信托有限公司</option>
                                        <option value="兴业国际信托有限公司">兴业国际信托有限公司</option>
                                        <option value="上海国际信托有限公司">上海国际信托有限公司</option>
                                        <option value="交银国际信托有限公司">交银国际信托有限公司</option>
                                        <option value="中融国际信托有限公司">中融国际信托有限公司</option>
                                        <option value="昆仑信托有限责任公司">昆仑信托有限责任公司</option>
                                        <option value="平安信托有限责任公司">平安信托有限责任公司</option>
                                        <option value="华宝信托有限责任公司">华宝信托有限责任公司</option>
                                        <option value="建信信托有限责任公司">建信信托有限责任公司</option>
                                        <option value="大连华信信托股份有限公司">大连华信信托股份有限公司</option>
                                        <option value="中航信托股份有限公司">中航信托股份有限公司</option>
                                        <option value="华能贵诚信托有限公司">华能贵诚信托有限公司</option>
                                        <option value="西藏信托有限公司">西藏信托有限公司</option>
                                        <option value="长安国际信托股份有限公司">长安国际信托股份有限公司</option>
                                        <option value="中国对外经济贸易信托有限公司">中国对外经济贸易信托有限公司</option>
                                        <option value="五矿国际信托有限公司">五矿国际信托有限公司</option>
                                        <option value="百瑞信托有限责任公司">百瑞信托有限责任公司</option>
                                        <option value="广东粤财信托有限公司">广东粤财信托有限公司</option>
                                        <option value="四川信托有限公司">四川信托有限公司</option>
                                        <option value="中铁信托有限责任公司">中铁信托有限责任公司</option>
                                        <option value="新时代信托股份有限公司">新时代信托股份有限公司</option>
                                        <option value="渤海国际信托有限公司">渤海国际信托有限公司</option>
                                        <option value="光大兴陇信托有限责任公司">光大兴陇信托有限责任公司</option>
                                        <option value="国民信托有限公司">国民信托有限公司</option>
                                        <option value="北方国际信托股份有限公司">北方国际信托股份有限公司</option>
                                        <option value="国投泰康信托有限公司">国投泰康信托有限公司</option>
                                        <option value="山东省国际信托有限公司">山东省国际信托有限公司</option>
                                        <option value="北京国际信托有限公司">北京国际信托有限公司</option>
                                        <option value="上海爱建信托投资有限责任公司">上海爱建信托投资有限责任公司</option>
                                        <option value="安徽国元信托有限责任公司">安徽国元信托有限责任公司</option>
                                        <option value="华鑫国际信托有限公司">华鑫国际信托有限公司</option>
                                        <option value="江苏省国际信托有限责任公司">江苏省国际信托有限责任公司</option>
                                        <option value="中海信托股份有限公司">中海信托股份有限公司</option>
                                        <option value="陕西省国际信托股份有限公司">陕西省国际信托股份有限公司</option>
                                        <option value="中诚信托有限责任公司">中诚信托有限责任公司</option>
                                        <option value="紫金信托有限责任公司">紫金信托有限责任公司</option>
                                        <option value="华融国际信托有限责任公司">华融国际信托有限责任公司</option>
                                        <option value="厦门国际信托有限公司">厦门国际信托有限公司</option>
                                        <option value="安信信托股份有限公司">安信信托股份有限公司</option>
                                        <option value="陆家嘴信托有限公司">陆家嘴信托有限公司</option>
                                        <option value="云南国际信托有限公司">云南国际信托有限公司</option>
                                        <option value="国通信托有限责任公司">国通信托有限责任公司</option>
                                        <option value="中江国际信托股份有限公司">中江国际信托股份有限公司</option>
                                        <option value="天津信托有限责任公司">天津信托有限责任公司</option>
                                        <option value="万向信托有限公司">万向信托有限公司</option>
                                        <option value="中国民生信托有限公司">中国民生信托有限公司</option>
                                        <option value="中粮信托有限责任公司">中粮信托有限责任公司</option>
                                        <option value="中原信托有限公司">中原信托有限公司</option>
                                        <option value="大业信托有限责任公司">大业信托有限责任公司</option>
                                        <option value="新华信托股份有限公司">新华信托股份有限公司</option>
                                        <option value="中国金谷国际信托有限责任公司">中国金谷国际信托有限责任公司</option>
                                        <option value="中建投信托有限责任公司">中建投信托有限责任公司</option>
                                        <option value="吉林省信托有限责任公司">吉林省信托有限责任公司</option>
                                        <option value="中泰信托有限责任公司">中泰信托有限责任公司</option>
                                        <option value="苏州信托有限公司">苏州信托有限公司</option>
                                        <option value="浙商金汇信托股份有限公司">浙商金汇信托股份有限公司</option>
                                        <option value="华澳国际信托有限公司">华澳国际信托有限公司</option>
                                        <option value="湖南省信托有限责任公司">湖南省信托有限责任公司</option>
                                        <option value="国联信托股份有限公司">国联信托股份有限公司</option>
                                        <option value="东莞信托有限公司">东莞信托有限公司</option>
                                        <option value="杭州工商信托股份有限公司">杭州工商信托股份有限公司</option>
                                        <option value="山西信托有限责任公司">山西信托有限责任公司</option>
                                        <option value="新疆长城新盛信托有限责任公司">新疆长城新盛信托有限责任公司</option>
                                        <option value="华宸信托有限责任公司">华宸信托有限责任公司</option>
                                        <option value="国泰基金管理有限公司">国泰基金管理有限公司</option>
                                        <option value="南方基金管理股份有限公司">南方基金管理股份有限公司</option>
                                        <option value="华夏基金管理有限公司">华夏基金管理有限公司</option>
                                        <option value="华安基金管理有限公司">华安基金管理有限公司</option>
                                        <option value="博时基金管理有限公司">博时基金管理有限公司</option>
                                        <option value="鹏华基金管理有限公司">鹏华基金管理有限公司</option>
                                        <option value="长盛基金管理有限公司">长盛基金管理有限公司</option>
                                        <option value="嘉实基金管理有限公司">嘉实基金管理有限公司</option>
                                        <option value="大成基金管理有限公司">大成基金管理有限公司</option>
                                        <option value="富国基金管理有限公司">富国基金管理有限公司</option>
                                        <option value="易方达基金管理有限公司">易方达基金管理有限公司</option>
                                        <option value="宝盈基金管理有限公司">宝盈基金管理有限公司</option>
                                        <option value="融通基金管理有限公司">融通基金管理有限公司</option>
                                        <option value="银华基金管理股份有限公司">银华基金管理股份有限公司</option>
                                        <option value="长城基金管理有限公司">长城基金管理有限公司</option>
                                        <option value="银河基金管理有限公司">银河基金管理有限公司</option>
                                        <option value="泰达宏利基金管理有限公司">泰达宏利基金管理有限公司</option>
                                        <option value="国投瑞银基金管理有限公司">国投瑞银基金管理有限公司</option>
                                        <option value="万家基金管理有限公司">万家基金管理有限公司</option>
                                        <option value="金鹰基金管理有限公司">金鹰基金管理有限公司</option>
                                        <option value="招商基金管理有限公司">招商基金管理有限公司</option>
                                        <option value="华宝基金管理有限公司">华宝基金管理有限公司</option>
                                        <option value="摩根士丹利华鑫基金管理有限公司">摩根士丹利华鑫基金管理有限公司</option>
                                        <option value="国联安基金管理有限公司">国联安基金管理有限公司</option>
                                        <option value="海富通基金管理有限公司">海富通基金管理有限公司</option>
                                        <option value="长信基金管理有限责任公司">长信基金管理有限责任公司</option>
                                        <option value="泰信基金管理有限公司">泰信基金管理有限公司</option>
                                        <option value="天治基金管理有限公司">天治基金管理有限公司</option>
                                        <option value="景顺长城基金管理有限公司">景顺长城基金管理有限公司</option>
                                        <option value="广发基金管理有限公司">广发基金管理有限公司</option>
                                        <option value="兴全基金管理有限公司">兴全基金管理有限公司</option>
                                        <option value="诺安基金管理有限公司">诺安基金管理有限公司</option>
                                        <option value="中海基金管理有限公司">中海基金管理有限公司</option>
                                        <option value="光大保德信基金管理有限公司">光大保德信基金管理有限公司</option>
                                        <option value="华富基金管理有限公司">华富基金管理有限公司</option>
                                        <option value="上投摩根基金管理有限公司">上投摩根基金管理有限公司</option>
                                        <option value="东方基金管理有限责任公司">东方基金管理有限责任公司</option>
                                        <option value="中银基金管理有限公司">中银基金管理有限公司</option>
                                        <option value="东吴基金管理有限公司">东吴基金管理有限公司</option>
                                        <option value="国海富兰克林基金管理有限公司">国海富兰克林基金管理有限公司</option>
                                        <option value="天弘基金管理有限公司">天弘基金管理有限公司</option>
                                        <option value="华泰柏瑞基金管理有限公司">华泰柏瑞基金管理有限公司</option>
                                        <option value="新华基金管理股份有限公司">新华基金管理股份有限公司</option>
                                        <option value="汇添富基金管理股份有限公司">汇添富基金管理股份有限公司</option>
                                        <option value="工银瑞信基金管理有限公司">工银瑞信基金管理有限公司</option>
                                        <option value="交银施罗德基金管理有限公司">交银施罗德基金管理有限公司</option>
                                        <option value="中信保诚基金管理有限公司">中信保诚基金管理有限公司</option>
                                        <option value="建信基金管理有限责任公司">建信基金管理有限责任公司</option>
                                        <option value="华商基金管理有限公司">华商基金管理有限公司</option>
                                        <option value="汇丰晋信基金管理有限公司">汇丰晋信基金管理有限公司</option>
                                        <option value="中邮创业基金管理股份有限公司">中邮创业基金管理股份有限公司</option>
                                        <option value="信达澳银基金管理有限公司">信达澳银基金管理有限公司</option>
                                        <option value="诺德基金管理有限公司">诺德基金管理有限公司</option>
                                        <option value="中欧基金管理有限公司">中欧基金管理有限公司</option>
                                        <option value="金元顺安基金管理有限公司">金元顺安基金管理有限公司</option>
                                        <option value="浦银安盛基金管理有限公司">浦银安盛基金管理有限公司</option>
                                        <option value="农银汇理基金管理有限公司">农银汇理基金管理有限公司</option>
                                        <option value="民生加银基金管理有限公司">民生加银基金管理有限公司</option>
                                        <option value="西部利得基金管理有限公司">西部利得基金管理有限公司</option>
                                        <option value="平安大华基金管理有限公司">平安大华基金管理有限公司</option>
                                        <option value="富安达基金管理有限公司">富安达基金管理有限公司</option>
                                        <option value="方正富邦基金管理有限公司">方正富邦基金管理有限公司</option>
                                        <option value="长安基金管理有限公司">长安基金管理有限公司</option>
                                        <option value="国金基金管理有限公司">国金基金管理有限公司</option>
                                        <option value="安信基金管理有限责任公司">安信基金管理有限责任公司</option>
                                        <option value="德邦基金管理有限公司">德邦基金管理有限公司</option>
                                        <option value="华宸未来基金管理有限公司">华宸未来基金管理有限公司</option>
                                        <option value="红塔红土基金管理有限公司">红塔红土基金管理有限公司</option>
                                        <option value="英大基金管理有限公司">英大基金管理有限公司</option>
                                        <option value="江信基金管理有限公司">江信基金管理有限公司</option>
                                        <option value="太平基金管理有限公司">太平基金管理有限公司</option>
                                        <option value="华润元大基金管理有限公司">华润元大基金管理有限公司</option>
                                        <option value="前海开源基金管理有限公司">前海开源基金管理有限公司</option>
                                        <option value="东海基金管理有限责任公司">东海基金管理有限责任公司</option>
                                        <option value="中加基金管理有限公司">中加基金管理有限公司</option>
                                        <option value="兴业基金管理有限公司">兴业基金管理有限公司</option>
                                        <option value="中融基金管理有限公司">中融基金管理有限公司</option>
                                        <option value="国开泰富基金管理有限责任公司">国开泰富基金管理有限责任公司</option>
                                        <option value="中信建投基金管理有限公司 ">中信建投基金管理有限公司</option>
                                        <option value="上银基金管理有限公司">上银基金管理有限公司</option>
                                        <option value="鑫元基金管理有限公司">鑫元基金管理有限公司</option>
                                        <option value="兴银基金管理有限责任公司 ">兴银基金管理有限责任公司</option>
                                        <option value="国寿安保基金管理有限公司">国寿安保基金管理有限公司</option>
                                        <option value="圆信永丰基金管理有限公司">圆信永丰基金管理有限公司</option>
                                        <option value="中金基金管理有限公司">中金基金管理有限公司</option>
                                        <option value="北信瑞丰基金管理有限公司">北信瑞丰基金管理有限公司</option>
                                        <option value="红土创新基金管理有限公司">红土创新基金管理有限公司</option>
                                        <option value="嘉合基金管理有限公司">嘉合基金管理有限公司</option>
                                        <option value="创金合信基金管理有限公司">创金合信基金管理有限公司</option>
                                        <option value="九泰基金管理有限公司">九泰基金管理有限公司</option>
                                        <option value="泓德基金管理有限公司">泓德基金管理有限公司</option>
                                        <option value="金信基金管理有限公司">金信基金管理有限公司</option>
                                        <option value="新疆前海联合基金管理有限公司">新疆前海联合基金管理有限公司</option>
                                        <option value="新沃基金管理有限公司">新沃基金管理有限公司</option>
                                        <option value="中科沃土基金管理有限公司">中科沃土基金管理有限公司</option>
                                        <option value="富荣基金管理有限公司">富荣基金管理有限公司</option>
                                        <option value="汇安基金管理有限责任公司">汇安基金管理有限责任公司</option>
                                        <option value="先锋基金管理有限公司">先锋基金管理有限公司</option>
                                        <option value="中航基金管理有限公司">中航基金管理有限公司</option>
                                        <option value="华泰保兴基金管理有限公司">华泰保兴基金管理有限公司</option>
                                        <option value="鹏扬基金管理有限公司">鹏扬基金管理有限公司</option>
                                        <option value="恒生前海基金管理有限公司">恒生前海基金管理有限公司</option>
                                        <option value="格林基金管理有限公司">格林基金管理有限公司</option>
                                        <option value="南华基金管理有限公司">南华基金管理有限公司</option>
                                        <option value="凯石基金管理有限公司">凯石基金管理有限公司</option>
                                        <option value="国融基金管理有限公司">国融基金管理有限公司</option>
                                        <option value="东方阿尔法基金管理有限公司">东方阿尔法基金管理有限公司</option>
                                        <option value="恒越基金管理有限公司">恒越基金管理有限公司</option>
                                        <option value="弘毅远方基金管理有限公司">弘毅远方基金管理有限公司</option>
                                        <option value="博道基金管理有限公司">博道基金管理有限公司</option>
                                        <option value="国家开发银行">国家开发银行</option>
                                        <option value="进出口银行">进出口银行</option>
                                        <option value="农业发展银行">农业发展银行</option>
                                        <option value="中国工商银行">中国工商银行</option>
                                        <option value="中国建设银行">中国建设银行</option>
                                        <option value="中国银行">中国银行</option>
                                        <option value="中国农业银行">中国农业银行</option>
                                        <option value="交通银行">交通银行</option>
                                        <option value="招商银行">招商银行</option>
                                        <option value="中信银行">中信银行</option>
                                        <option value="中国民生银行">中国民生银行</option>
                                        <option value="兴业银行">兴业银行</option>
                                        <option value="上海浦东发展银行">上海浦东发展银行</option>
                                        <option value="中国邮政储蓄银行">中国邮政储蓄银行</option>
                                        <option value="中国光大银行">中国光大银行</option>
                                        <option value="平安银行">平安银行</option>
                                        <option value="华夏银行">华夏银行</option>
                                        <option value="北京银行">北京银行</option>
                                        <option value="广发银行">广发银行</option>
                                        <option value="上海银行">上海银行</option>
                                        <option value="江苏银行">江苏银行</option>
                                        <option value="恒丰银行">恒丰银行</option>
                                        <option value="浙商银行">浙商银行</option>
                                        <option value="南京银行">南京银行</option>
                                        <option value="重庆农村商业银行">重庆农村商业银行</option>
                                        <option value="盛京银行">盛京银行</option>
                                        <option value="徽商银行">徽商银行</option>
                                        <option value="宁波银行">宁波银行</option>
                                        <option value="上海农商银行">上海农商银行</option>
                                        <option value="北京农商银行">北京农商银行</option>
                                        <option value="渤海银行">渤海银行</option>
                                        <option value="广州农商银行">广州农商银行</option>
                                        <option value="哈尔滨银行">哈尔滨银行</option>
                                        <option value="中原银行">中原银行</option>
                                        <option value="天津银行">天津银行</option>
                                        <option value="杭州银行 ">杭州银行</option>
                                        <option value="成都农商银行">成都农商银行</option>
                                        <option value="厦门国际银行">厦门国际银行</option>
                                        <option value="锦州银行">锦州银行</option>
                                        <option value="昆仑银行">昆仑银行</option>
                                        <option value="顺德农商银行">顺德农商银行</option>
                                        <option value="重庆银行">重庆银行</option>
                                        <option value="东莞农村商业银行">东莞农村商业银行</option>
                                        <option value="成都银行">成都银行</option>
                                        <option value="天津农商银行">天津农商银行</option>
                                        <option value="吉林银行">吉林银行</option>
                                        <option value="江西银行">江西银行</option>
                                        <option value="广州银行">广州银行</option>
                                        <option value="大连银行">大连银行</option>
                                        <option value="长沙银行">长沙银行</option>
                                        <option value="郑州银行">郑州银行</option>
                                        <option value="苏州银行">苏州银行</option>
                                        <option value="青岛银行">青岛银行</option>
                                        <option value="汉口银行">汉口银行</option>
                                        <option value="河北银行">河北银行</option>
                                        <option value="东莞银行">东莞银行</option>
                                        <option value="武汉农村商业银行">武汉农村商业银行</option>
                                        <option value="西安银行">西安银行</option>
                                        <option value="贵阳银行">贵阳银行</option>
                                        <option value="富滇银行">富滇银行</option>
                                        <option value="兰州银行">兰州银行</option>
                                        <option value="贵州银行">贵州银行</option>
                                        <option value="青岛农商银行">青岛农商银行</option>
                                        <option value="江苏江南农村商业银行">江苏江南农村商业银行</option>
                                        <option value="洛阳银行">洛阳银行</option>
                                        <option value="九江银行">九江银行</option>
                                        <option value="华融湘江银行">华融湘江银行</option>
                                        <option value="甘肃银行">甘肃银行</option>
                                        <option value="龙江银行">龙江银行</option>
                                        <option value="杭州联合农村商业银行">杭州联合农村商业银行</option>
                                        <option value="南海农商银行">南海农商银行</option>
                                        <option value="广西北部湾银行">广西北部湾银行</option>
                                        <option value="湖北银行">湖北银行</option>
                                        <option value="萧山农商银行">萧山农商银行</option>
                                        <option value="浙江稠州银行">浙江稠州银行</option>
                                        <option value="广东南粤银行">广东南粤银行</option>
                                        <option value="吉林九台农村商业银行">吉林九台农村商业银行</option>
                                        <option value="南充市商业银行">南充市商业银行</option>
                                        <option value="台州银行">台州银行</option>
                                        <option value="齐鲁银行">齐鲁银行</option>
                                        <option value="天津滨海农村商业银行">天津滨海农村商业银行</option>
                                        <option value="长安银行">长安银行</option>
                                        <option value="温州银行">温州银行</option>
                                        <option value="陕西秦农农村商业银行">陕西秦农农村商业银行</option>
                                        <option value="宁夏银行">宁夏银行</option>
                                        <option value="威海市商业银行">威海市商业银行</option>
                                        <option value="晋商银行">晋商银行</option>
                                        <option value="内蒙古银行">内蒙古银行</option>
                                        <option value="珠海华润银行">珠海华润银行</option>
                                        <option value="桂林银行">桂林银行</option>
                                        <option value="江苏常熟农村商业银行">江苏常熟农村商业银行</option>
                                        <option value="厦门银行">厦门银行</option>
                                        <option value="唐山市商业银行">唐山市商业银行</option>
                                        <option value="阜新银行">阜新银行</option>
                                        <option value="营口银行">营口银行</option>
                                        <option value="日照银行">日照银行</option>
                                        <option value="乌鲁木齐银行">乌鲁木齐银行</option>
                                        <option value="大连农商银行">大连农商银行</option>
                                        <option value="江苏江阴农村商业银行">江苏江阴农村商业银行</option>
                                        <option value="福建海峡银行">福建海峡银行</option>
                                    </select>
                                </td>
                                <td class="can_practice_unit_two"></td>
                            </tr>
                            <tr>
                                <td>实习单位2</td>
                                <td>机构业务部</td>
                                <td>
                                    <input id="practice_post_two" name="practice_post_two" type="text" class="form-control">
                                </td>
                                <td class="can_practice_post_two"></td>
                            </tr>
                            <tr>
                                <td>实习单位3</td>
                                <td></td>
                                <td><select id="practice_unit_three" name="practice_unit_three" class="selectpicker show-tick form-control"
                                            data-live-search="true">
                                    <option value="">请选择</option>
                                    <option value="爱建证券有限责任公司">爱建证券有限责任公司</option>
                                    <option value="安信证券股份有限公司">安信证券股份有限公司</option>
                                    <option value="北京高华证券有限责任公司">北京高华证券有限责任公司</option>
                                    <option value="渤海证券股份有限公司">渤海证券股份有限公司</option>
                                    <option value="财达证券股份有限公司">财达证券股份有限公司</option>
                                    <option value="财富证券有限责任公司">财富证券有限责任公司</option>
                                    <option value="财通证券股份有限公司">财通证券股份有限公司</option>
                                    <option value="财通证券资产管理有限公司">财通证券资产管理有限公司</option>
                                    <option value="长城国瑞证券有限公司">长城国瑞证券有限公司</option>
                                    <option value="长城证券股份有限公司">长城证券股份有限公司</option>
                                    <option value="长江证券（上海）资产管理有限公司">长江证券（上海）资产管理有限公司</option>
                                    <option value="长江证券承销保荐有限公司">长江证券承销保荐有限公司</option>
                                    <option value="长江证券股份有限公司">长江证券股份有限公司</option>
                                    <option value="网信证券有限责任公司">网信证券有限责任公司</option>
                                    <option value="川财证券有限责任公司">川财证券有限责任公司</option>
                                    <option value="大通证券股份有限公司">大通证券股份有限公司</option>
                                    <option value="大同证券有限责任公司">大同证券有限责任公司</option>
                                    <option value="德邦证券股份有限公司">德邦证券股份有限公司</option>
                                    <option value="第一创业证券承销保荐有限责任公司">第一创业证券承销保荐有限责任公司</option>
                                    <option value="第一创业证券股份有限公司">第一创业证券股份有限公司</option>
                                    <option value="东北证券股份有限公司">东北证券股份有限公司</option>
                                    <option value="东方花旗证券有限公司">东方花旗证券有限公司</option>
                                    <option value="东方证券股份有限公司">东方证券股份有限公司</option>
                                    <option value="东海证券股份有限公司">东海证券股份有限公司</option>
                                    <option value="东莞证券股份有限公司">东莞证券股份有限公司</option>
                                    <option value="东吴证券股份有限公司">东吴证券股份有限公司</option>
                                    <option value="东兴证券股份有限公司">东兴证券股份有限公司</option>
                                    <option value="方正证券股份有限公司">方正证券股份有限公司</option>
                                    <option value="高盛高华证券有限责任公司">高盛高华证券有限责任公司</option>
                                    <option value="光大证券股份有限公司">光大证券股份有限公司</option>
                                    <option value="广发证券股份有限公司">广发证券股份有限公司</option>
                                    <option value="广发证券资产管理（广东）有限公司">广发证券资产管理（广东）有限公司</option>
                                    <option value="广州证券股份有限公司">广州证券股份有限公司</option>
                                    <option value="国都证券股份有限公司">国都证券股份有限公司</option>
                                    <option value="国海证券股份有限公司">国海证券股份有限公司</option>
                                    <option value="国金证券股份有限公司">国金证券股份有限公司</option>
                                    <option value="国开证券股份有限公司">国开证券股份有限公司</option>
                                    <option value="国联证券股份有限公司">国联证券股份有限公司</option>
                                    <option value="国盛证券有限责任公司">国盛证券有限责任公司</option>
                                    <option value="国泰君安证券股份有限公司">国泰君安证券股份有限公司</option>
                                    <option value="国信证券股份有限公司">国信证券股份有限公司</option>
                                    <option value="国元证券股份有限公司">国元证券股份有限公司</option>
                                    <option value="中天国富证券有限公司">中天国富证券有限公司</option>
                                    <option value="海通证券股份有限公司">海通证券股份有限公司</option>
                                    <option value="恒泰长财证券有限责任公司">恒泰长财证券有限责任公司</option>
                                    <option value="恒泰证券股份有限公司">恒泰证券股份有限公司</option>
                                    <option value="红塔证券股份有限公司">红塔证券股份有限公司</option>
                                    <option value="宏信证券有限责任公司">宏信证券有限责任公司</option>
                                    <option value="华安证券股份有限公司">华安证券股份有限公司</option>
                                    <option value="华宝证券有限责任公司">华宝证券有限责任公司</option>
                                    <option value="华创证券有限责任公司">华创证券有限责任公司</option>
                                    <option value="华福证券有限责任公司">华福证券有限责任公司</option>
                                    <option value="华金证券股份有限公司">华金证券股份有限公司</option>
                                    <option value="华林证券有限责任公司">华林证券有限责任公司</option>
                                    <option value="华龙证券股份有限公司">华龙证券股份有限公司</option>
                                    <option value="华融证券股份有限公司">华融证券股份有限公司</option>
                                    <option value="华泰联合证券有限责任公司">华泰联合证券有限责任公司</option>
                                    <option value="华泰证券(上海）资产管理有限公司">华泰证券(上海）资产管理有限公司</option>
                                    <option value="华泰证券股份有限公司">华泰证券股份有限公司</option>
                                    <option value="华西证券股份有限公司">华西证券股份有限公司</option>
                                    <option value="华鑫证券有限责任公司">华鑫证券有限责任公司</option>
                                    <option value="华英证券有限责任公司">华英证券有限责任公司</option>
                                    <option value="江海证券有限公司">江海证券有限公司</option>
                                    <option value="金通证券有限责任公司">金通证券有限责任公司</option>
                                    <option value="金元证券股份有限公司">金元证券股份有限公司</option>
                                    <option value="九州证券股份有限公司">九州证券股份有限公司</option>
                                    <option value="开源证券股份有限公司">开源证券股份有限公司</option>
                                    <option value="联讯证券股份有限公司">联讯证券股份有限公司</option>
                                    <option value="民生证券股份有限公司">民生证券股份有限公司</option>
                                    <option value="摩根士丹利华鑫证券有限责任公司">摩根士丹利华鑫证券有限责任公司</option>
                                    <option value="南京证券股份有限公司">南京证券股份有限公司</option>
                                    <option value="平安证券股份有限公司">平安证券股份有限公司</option>
                                    <option value="中泰证券（上海）资产管理有限公司">中泰证券（上海）资产管理有限公司</option>
                                    <option value="中泰证券股份有限公司">中泰证券股份有限公司</option>
                                    <option value="国融证券股份有限公司">国融证券股份有限公司</option>
                                    <option value="瑞信方正证券有限责任公司">瑞信方正证券有限责任公司</option>
                                    <option value="瑞银证券有限责任公司">瑞银证券有限责任公司</option>
                                    <option value="山西证券股份有限公司">山西证券股份有限公司</option>
                                    <option value="上海东方证券资产管理有限公司">上海东方证券资产管理有限公司</option>
                                    <option value="上海光大证券资产管理有限公司">上海光大证券资产管理有限公司</option>
                                    <option value="上海国泰君安证券资产管理有限公司">上海国泰君安证券资产管理有限公司</option>
                                    <option value="上海海通证券资产管理有限公司">上海海通证券资产管理有限公司</option>
                                    <option value="上海华信证券有限责任公司">上海华信证券有限责任公司</option>
                                    <option value="上海证券有限责任公司">上海证券有限责任公司</option>
                                    <option value="申万宏源西部证券有限公司">申万宏源西部证券有限公司</option>
                                    <option value="申万宏源证券承销保荐有限责任公司">申万宏源证券承销保荐有限责任公司</option>
                                    <option value="申万宏源证券有限公司">申万宏源证券有限公司</option>
                                    <option value="世纪证券有限责任公司">世纪证券有限责任公司</option>
                                    <option value="首创证券有限责任公司">首创证券有限责任公司</option>
                                    <option value="太平洋证券股份有限公司">太平洋证券股份有限公司</option>
                                    <option value="天风证券股份有限公司">天风证券股份有限公司</option>
                                    <option value="万和证券股份有限公司">万和证券股份有限公司</option>
                                    <option value="万联证券股份有限公司">万联证券股份有限公司</option>
                                    <option value="五矿证券有限公司">五矿证券有限公司</option>
                                    <option value="西部证券股份有限公司">西部证券股份有限公司</option>
                                    <option value="西藏东方财富证券股份有限公司">西藏东方财富证券股份有限公司</option>
                                    <option value="西南证券股份有限公司">西南证券股份有限公司</option>
                                    <option value="湘财证券有限责任公司">湘财证券有限责任公司</option>
                                    <option value="新时代证券股份有限公司">新时代证券股份有限公司</option>
                                    <option value="信达证券股份有限公司">信达证券股份有限公司</option>
                                    <option value="兴业证券股份有限公司">兴业证券股份有限公司</option>
                                    <option value="兴证证券资产管理有限公司">兴证证券资产管理有限公司</option>
                                    <option value="银河金汇证券资产管理有限公司">银河金汇证券资产管理有限公司</option>
                                    <option value="银泰证券有限责任公司">银泰证券有限责任公司</option>
                                    <option value="英大证券有限责任公司">英大证券有限责任公司</option>
                                    <option value="招商证券股份有限公司">招商证券股份有限公司</option>
                                    <option value="招商证券资产管理有限公司">招商证券资产管理有限公司</option>
                                    <option value="浙江浙商证券资产管理有限公司">浙江浙商证券资产管理有限公司</option>
                                    <option value="浙商证券股份有限公司">浙商证券股份有限公司</option>
                                    <option value="中德证券有限责任公司">中德证券有限责任公司</option>
                                    <option value="中国国际金融股份有限公司">中国国际金融股份有限公司</option>
                                    <option value="中国民族证券有限责任公司">中国民族证券有限责任公司</option>
                                    <option value="中国银河证券股份有限公司">中国银河证券股份有限公司</option>
                                    <option value="中国中投证券有限责任公司">中国中投证券有限责任公司</option>
                                    <option value="中航证券有限公司">中航证券有限公司</option>
                                    <option value="中山证券有限责任公司">中山证券有限责任公司</option>
                                    <option value="中天证券股份有限公司">中天证券股份有限公司</option>
                                    <option value="中信建投证券股份有限公司">中信建投证券股份有限公司</option>
                                    <option value="中信证券（山东）有限责任公司">中信证券（山东）有限责任公司</option>
                                    <option value="中信证券股份有限公司">中信证券股份有限公司</option>
                                    <option value="中银国际证券股份有限公司">中银国际证券股份有限公司</option>
                                    <option value="中邮证券有限责任公司">中邮证券有限责任公司</option>
                                    <option value="中原证券股份有限公司">中原证券股份有限公司</option>
                                    <option value="联储证券有限责任公司">联储证券有限责任公司</option>
                                    <option value="国盛证券资产管理有限公司">国盛证券资产管理有限公司</option>
                                    <option value="东证融汇证券资产管理有限公司">东证融汇证券资产管理有限公司</option>
                                    <option value="渤海汇金证券资产管理有限公司">渤海汇金证券资产管理有限公司</option>
                                    <option value="申港证券股份有限公司">申港证券股份有限公司</option>
                                    <option value="华菁证券有限公司">华菁证券有限公司</option>
                                    <option value="汇丰前海证券有限责任公司">汇丰前海证券有限责任公司</option>
                                    <option value="东亚前海证券有限责任公司">东亚前海证券有限责任公司</option>
                                    <option value="中信信托有限责任公司">中信信托有限责任公司</option>
                                    <option value="重庆国际信托有限公司">重庆国际信托有限公司</option>
                                    <option value="兴业国际信托有限公司">兴业国际信托有限公司</option>
                                    <option value="上海国际信托有限公司">上海国际信托有限公司</option>
                                    <option value="交银国际信托有限公司">交银国际信托有限公司</option>
                                    <option value="中融国际信托有限公司">中融国际信托有限公司</option>
                                    <option value="昆仑信托有限责任公司">昆仑信托有限责任公司</option>
                                    <option value="平安信托有限责任公司">平安信托有限责任公司</option>
                                    <option value="华宝信托有限责任公司">华宝信托有限责任公司</option>
                                    <option value="建信信托有限责任公司">建信信托有限责任公司</option>
                                    <option value="大连华信信托股份有限公司">大连华信信托股份有限公司</option>
                                    <option value="中航信托股份有限公司">中航信托股份有限公司</option>
                                    <option value="华能贵诚信托有限公司">华能贵诚信托有限公司</option>
                                    <option value="西藏信托有限公司">西藏信托有限公司</option>
                                    <option value="长安国际信托股份有限公司">长安国际信托股份有限公司</option>
                                    <option value="中国对外经济贸易信托有限公司">中国对外经济贸易信托有限公司</option>
                                    <option value="五矿国际信托有限公司">五矿国际信托有限公司</option>
                                    <option value="百瑞信托有限责任公司">百瑞信托有限责任公司</option>
                                    <option value="广东粤财信托有限公司">广东粤财信托有限公司</option>
                                    <option value="四川信托有限公司">四川信托有限公司</option>
                                    <option value="中铁信托有限责任公司">中铁信托有限责任公司</option>
                                    <option value="新时代信托股份有限公司">新时代信托股份有限公司</option>
                                    <option value="渤海国际信托有限公司">渤海国际信托有限公司</option>
                                    <option value="光大兴陇信托有限责任公司">光大兴陇信托有限责任公司</option>
                                    <option value="国民信托有限公司">国民信托有限公司</option>
                                    <option value="北方国际信托股份有限公司">北方国际信托股份有限公司</option>
                                    <option value="国投泰康信托有限公司">国投泰康信托有限公司</option>
                                    <option value="山东省国际信托有限公司">山东省国际信托有限公司</option>
                                    <option value="北京国际信托有限公司">北京国际信托有限公司</option>
                                    <option value="上海爱建信托投资有限责任公司">上海爱建信托投资有限责任公司</option>
                                    <option value="安徽国元信托有限责任公司">安徽国元信托有限责任公司</option>
                                    <option value="华鑫国际信托有限公司">华鑫国际信托有限公司</option>
                                    <option value="江苏省国际信托有限责任公司">江苏省国际信托有限责任公司</option>
                                    <option value="中海信托股份有限公司">中海信托股份有限公司</option>
                                    <option value="陕西省国际信托股份有限公司">陕西省国际信托股份有限公司</option>
                                    <option value="中诚信托有限责任公司">中诚信托有限责任公司</option>
                                    <option value="紫金信托有限责任公司">紫金信托有限责任公司</option>
                                    <option value="华融国际信托有限责任公司">华融国际信托有限责任公司</option>
                                    <option value="厦门国际信托有限公司">厦门国际信托有限公司</option>
                                    <option value="安信信托股份有限公司">安信信托股份有限公司</option>
                                    <option value="陆家嘴信托有限公司">陆家嘴信托有限公司</option>
                                    <option value="云南国际信托有限公司">云南国际信托有限公司</option>
                                    <option value="国通信托有限责任公司">国通信托有限责任公司</option>
                                    <option value="中江国际信托股份有限公司">中江国际信托股份有限公司</option>
                                    <option value="天津信托有限责任公司">天津信托有限责任公司</option>
                                    <option value="万向信托有限公司">万向信托有限公司</option>
                                    <option value="中国民生信托有限公司">中国民生信托有限公司</option>
                                    <option value="中粮信托有限责任公司">中粮信托有限责任公司</option>
                                    <option value="中原信托有限公司">中原信托有限公司</option>
                                    <option value="大业信托有限责任公司">大业信托有限责任公司</option>
                                    <option value="新华信托股份有限公司">新华信托股份有限公司</option>
                                    <option value="中国金谷国际信托有限责任公司">中国金谷国际信托有限责任公司</option>
                                    <option value="中建投信托有限责任公司">中建投信托有限责任公司</option>
                                    <option value="吉林省信托有限责任公司">吉林省信托有限责任公司</option>
                                    <option value="中泰信托有限责任公司">中泰信托有限责任公司</option>
                                    <option value="苏州信托有限公司">苏州信托有限公司</option>
                                    <option value="浙商金汇信托股份有限公司">浙商金汇信托股份有限公司</option>
                                    <option value="华澳国际信托有限公司">华澳国际信托有限公司</option>
                                    <option value="湖南省信托有限责任公司">湖南省信托有限责任公司</option>
                                    <option value="国联信托股份有限公司">国联信托股份有限公司</option>
                                    <option value="东莞信托有限公司">东莞信托有限公司</option>
                                    <option value="杭州工商信托股份有限公司">杭州工商信托股份有限公司</option>
                                    <option value="山西信托有限责任公司">山西信托有限责任公司</option>
                                    <option value="新疆长城新盛信托有限责任公司">新疆长城新盛信托有限责任公司</option>
                                    <option value="华宸信托有限责任公司">华宸信托有限责任公司</option>
                                    <option value="国泰基金管理有限公司">国泰基金管理有限公司</option>
                                    <option value="南方基金管理股份有限公司">南方基金管理股份有限公司</option>
                                    <option value="华夏基金管理有限公司">华夏基金管理有限公司</option>
                                    <option value="华安基金管理有限公司">华安基金管理有限公司</option>
                                    <option value="博时基金管理有限公司">博时基金管理有限公司</option>
                                    <option value="鹏华基金管理有限公司">鹏华基金管理有限公司</option>
                                    <option value="长盛基金管理有限公司">长盛基金管理有限公司</option>
                                    <option value="嘉实基金管理有限公司">嘉实基金管理有限公司</option>
                                    <option value="大成基金管理有限公司">大成基金管理有限公司</option>
                                    <option value="富国基金管理有限公司">富国基金管理有限公司</option>
                                    <option value="易方达基金管理有限公司">易方达基金管理有限公司</option>
                                    <option value="宝盈基金管理有限公司">宝盈基金管理有限公司</option>
                                    <option value="融通基金管理有限公司">融通基金管理有限公司</option>
                                    <option value="银华基金管理股份有限公司">银华基金管理股份有限公司</option>
                                    <option value="长城基金管理有限公司">长城基金管理有限公司</option>
                                    <option value="银河基金管理有限公司">银河基金管理有限公司</option>
                                    <option value="泰达宏利基金管理有限公司">泰达宏利基金管理有限公司</option>
                                    <option value="国投瑞银基金管理有限公司">国投瑞银基金管理有限公司</option>
                                    <option value="万家基金管理有限公司">万家基金管理有限公司</option>
                                    <option value="金鹰基金管理有限公司">金鹰基金管理有限公司</option>
                                    <option value="招商基金管理有限公司">招商基金管理有限公司</option>
                                    <option value="华宝基金管理有限公司">华宝基金管理有限公司</option>
                                    <option value="摩根士丹利华鑫基金管理有限公司">摩根士丹利华鑫基金管理有限公司</option>
                                    <option value="国联安基金管理有限公司">国联安基金管理有限公司</option>
                                    <option value="海富通基金管理有限公司">海富通基金管理有限公司</option>
                                    <option value="长信基金管理有限责任公司">长信基金管理有限责任公司</option>
                                    <option value="泰信基金管理有限公司">泰信基金管理有限公司</option>
                                    <option value="天治基金管理有限公司">天治基金管理有限公司</option>
                                    <option value="景顺长城基金管理有限公司">景顺长城基金管理有限公司</option>
                                    <option value="广发基金管理有限公司">广发基金管理有限公司</option>
                                    <option value="兴全基金管理有限公司">兴全基金管理有限公司</option>
                                    <option value="诺安基金管理有限公司">诺安基金管理有限公司</option>
                                    <option value="中海基金管理有限公司">中海基金管理有限公司</option>
                                    <option value="光大保德信基金管理有限公司">光大保德信基金管理有限公司</option>
                                    <option value="华富基金管理有限公司">华富基金管理有限公司</option>
                                    <option value="上投摩根基金管理有限公司">上投摩根基金管理有限公司</option>
                                    <option value="东方基金管理有限责任公司">东方基金管理有限责任公司</option>
                                    <option value="中银基金管理有限公司">中银基金管理有限公司</option>
                                    <option value="东吴基金管理有限公司">东吴基金管理有限公司</option>
                                    <option value="国海富兰克林基金管理有限公司">国海富兰克林基金管理有限公司</option>
                                    <option value="天弘基金管理有限公司">天弘基金管理有限公司</option>
                                    <option value="华泰柏瑞基金管理有限公司">华泰柏瑞基金管理有限公司</option>
                                    <option value="新华基金管理股份有限公司">新华基金管理股份有限公司</option>
                                    <option value="汇添富基金管理股份有限公司">汇添富基金管理股份有限公司</option>
                                    <option value="工银瑞信基金管理有限公司">工银瑞信基金管理有限公司</option>
                                    <option value="交银施罗德基金管理有限公司">交银施罗德基金管理有限公司</option>
                                    <option value="中信保诚基金管理有限公司">中信保诚基金管理有限公司</option>
                                    <option value="建信基金管理有限责任公司">建信基金管理有限责任公司</option>
                                    <option value="华商基金管理有限公司">华商基金管理有限公司</option>
                                    <option value="汇丰晋信基金管理有限公司">汇丰晋信基金管理有限公司</option>
                                    <option value="中邮创业基金管理股份有限公司">中邮创业基金管理股份有限公司</option>
                                    <option value="信达澳银基金管理有限公司">信达澳银基金管理有限公司</option>
                                    <option value="诺德基金管理有限公司">诺德基金管理有限公司</option>
                                    <option value="中欧基金管理有限公司">中欧基金管理有限公司</option>
                                    <option value="金元顺安基金管理有限公司">金元顺安基金管理有限公司</option>
                                    <option value="浦银安盛基金管理有限公司">浦银安盛基金管理有限公司</option>
                                    <option value="农银汇理基金管理有限公司">农银汇理基金管理有限公司</option>
                                    <option value="民生加银基金管理有限公司">民生加银基金管理有限公司</option>
                                    <option value="西部利得基金管理有限公司">西部利得基金管理有限公司</option>
                                    <option value="平安大华基金管理有限公司">平安大华基金管理有限公司</option>
                                    <option value="富安达基金管理有限公司">富安达基金管理有限公司</option>
                                    <option value="方正富邦基金管理有限公司">方正富邦基金管理有限公司</option>
                                    <option value="长安基金管理有限公司">长安基金管理有限公司</option>
                                    <option value="国金基金管理有限公司">国金基金管理有限公司</option>
                                    <option value="安信基金管理有限责任公司">安信基金管理有限责任公司</option>
                                    <option value="德邦基金管理有限公司">德邦基金管理有限公司</option>
                                    <option value="华宸未来基金管理有限公司">华宸未来基金管理有限公司</option>
                                    <option value="红塔红土基金管理有限公司">红塔红土基金管理有限公司</option>
                                    <option value="英大基金管理有限公司">英大基金管理有限公司</option>
                                    <option value="江信基金管理有限公司">江信基金管理有限公司</option>
                                    <option value="太平基金管理有限公司">太平基金管理有限公司</option>
                                    <option value="华润元大基金管理有限公司">华润元大基金管理有限公司</option>
                                    <option value="前海开源基金管理有限公司">前海开源基金管理有限公司</option>
                                    <option value="东海基金管理有限责任公司">东海基金管理有限责任公司</option>
                                    <option value="中加基金管理有限公司">中加基金管理有限公司</option>
                                    <option value="兴业基金管理有限公司">兴业基金管理有限公司</option>
                                    <option value="中融基金管理有限公司">中融基金管理有限公司</option>
                                    <option value="国开泰富基金管理有限责任公司">国开泰富基金管理有限责任公司</option>
                                    <option value="中信建投基金管理有限公司 ">中信建投基金管理有限公司</option>
                                    <option value="上银基金管理有限公司">上银基金管理有限公司</option>
                                    <option value="鑫元基金管理有限公司">鑫元基金管理有限公司</option>
                                    <option value="兴银基金管理有限责任公司 ">兴银基金管理有限责任公司</option>
                                    <option value="国寿安保基金管理有限公司">国寿安保基金管理有限公司</option>
                                    <option value="圆信永丰基金管理有限公司">圆信永丰基金管理有限公司</option>
                                    <option value="中金基金管理有限公司">中金基金管理有限公司</option>
                                    <option value="北信瑞丰基金管理有限公司">北信瑞丰基金管理有限公司</option>
                                    <option value="红土创新基金管理有限公司">红土创新基金管理有限公司</option>
                                    <option value="嘉合基金管理有限公司">嘉合基金管理有限公司</option>
                                    <option value="创金合信基金管理有限公司">创金合信基金管理有限公司</option>
                                    <option value="九泰基金管理有限公司">九泰基金管理有限公司</option>
                                    <option value="泓德基金管理有限公司">泓德基金管理有限公司</option>
                                    <option value="金信基金管理有限公司">金信基金管理有限公司</option>
                                    <option value="新疆前海联合基金管理有限公司">新疆前海联合基金管理有限公司</option>
                                    <option value="新沃基金管理有限公司">新沃基金管理有限公司</option>
                                    <option value="中科沃土基金管理有限公司">中科沃土基金管理有限公司</option>
                                    <option value="富荣基金管理有限公司">富荣基金管理有限公司</option>
                                    <option value="汇安基金管理有限责任公司">汇安基金管理有限责任公司</option>
                                    <option value="先锋基金管理有限公司">先锋基金管理有限公司</option>
                                    <option value="中航基金管理有限公司">中航基金管理有限公司</option>
                                    <option value="华泰保兴基金管理有限公司">华泰保兴基金管理有限公司</option>
                                    <option value="鹏扬基金管理有限公司">鹏扬基金管理有限公司</option>
                                    <option value="恒生前海基金管理有限公司">恒生前海基金管理有限公司</option>
                                    <option value="格林基金管理有限公司">格林基金管理有限公司</option>
                                    <option value="南华基金管理有限公司">南华基金管理有限公司</option>
                                    <option value="凯石基金管理有限公司">凯石基金管理有限公司</option>
                                    <option value="国融基金管理有限公司">国融基金管理有限公司</option>
                                    <option value="东方阿尔法基金管理有限公司">东方阿尔法基金管理有限公司</option>
                                    <option value="恒越基金管理有限公司">恒越基金管理有限公司</option>
                                    <option value="弘毅远方基金管理有限公司">弘毅远方基金管理有限公司</option>
                                    <option value="博道基金管理有限公司">博道基金管理有限公司</option>
                                    <option value="国家开发银行">国家开发银行</option>
                                    <option value="进出口银行">进出口银行</option>
                                    <option value="农业发展银行">农业发展银行</option>
                                    <option value="中国工商银行">中国工商银行</option>
                                    <option value="中国建设银行">中国建设银行</option>
                                    <option value="中国银行">中国银行</option>
                                    <option value="中国农业银行">中国农业银行</option>
                                    <option value="交通银行">交通银行</option>
                                    <option value="招商银行">招商银行</option>
                                    <option value="中信银行">中信银行</option>
                                    <option value="中国民生银行">中国民生银行</option>
                                    <option value="兴业银行">兴业银行</option>
                                    <option value="上海浦东发展银行">上海浦东发展银行</option>
                                    <option value="中国邮政储蓄银行">中国邮政储蓄银行</option>
                                    <option value="中国光大银行">中国光大银行</option>
                                    <option value="平安银行">平安银行</option>
                                    <option value="华夏银行">华夏银行</option>
                                    <option value="北京银行">北京银行</option>
                                    <option value="广发银行">广发银行</option>
                                    <option value="上海银行">上海银行</option>
                                    <option value="江苏银行">江苏银行</option>
                                    <option value="恒丰银行">恒丰银行</option>
                                    <option value="浙商银行">浙商银行</option>
                                    <option value="南京银行">南京银行</option>
                                    <option value="重庆农村商业银行">重庆农村商业银行</option>
                                    <option value="盛京银行">盛京银行</option>
                                    <option value="徽商银行">徽商银行</option>
                                    <option value="宁波银行">宁波银行</option>
                                    <option value="上海农商银行">上海农商银行</option>
                                    <option value="北京农商银行">北京农商银行</option>
                                    <option value="渤海银行">渤海银行</option>
                                    <option value="广州农商银行">广州农商银行</option>
                                    <option value="哈尔滨银行">哈尔滨银行</option>
                                    <option value="中原银行">中原银行</option>
                                    <option value="天津银行">天津银行</option>
                                    <option value="杭州银行 ">杭州银行</option>
                                    <option value="成都农商银行">成都农商银行</option>
                                    <option value="厦门国际银行">厦门国际银行</option>
                                    <option value="锦州银行">锦州银行</option>
                                    <option value="昆仑银行">昆仑银行</option>
                                    <option value="顺德农商银行">顺德农商银行</option>
                                    <option value="重庆银行">重庆银行</option>
                                    <option value="东莞农村商业银行">东莞农村商业银行</option>
                                    <option value="成都银行">成都银行</option>
                                    <option value="天津农商银行">天津农商银行</option>
                                    <option value="吉林银行">吉林银行</option>
                                    <option value="江西银行">江西银行</option>
                                    <option value="广州银行">广州银行</option>
                                    <option value="大连银行">大连银行</option>
                                    <option value="长沙银行">长沙银行</option>
                                    <option value="郑州银行">郑州银行</option>
                                    <option value="苏州银行">苏州银行</option>
                                    <option value="青岛银行">青岛银行</option>
                                    <option value="汉口银行">汉口银行</option>
                                    <option value="河北银行">河北银行</option>
                                    <option value="东莞银行">东莞银行</option>
                                    <option value="武汉农村商业银行">武汉农村商业银行</option>
                                    <option value="西安银行">西安银行</option>
                                    <option value="贵阳银行">贵阳银行</option>
                                    <option value="富滇银行">富滇银行</option>
                                    <option value="兰州银行">兰州银行</option>
                                    <option value="贵州银行">贵州银行</option>
                                    <option value="青岛农商银行">青岛农商银行</option>
                                    <option value="江苏江南农村商业银行">江苏江南农村商业银行</option>
                                    <option value="洛阳银行">洛阳银行</option>
                                    <option value="九江银行">九江银行</option>
                                    <option value="华融湘江银行">华融湘江银行</option>
                                    <option value="甘肃银行">甘肃银行</option>
                                    <option value="龙江银行">龙江银行</option>
                                    <option value="杭州联合农村商业银行">杭州联合农村商业银行</option>
                                    <option value="南海农商银行">南海农商银行</option>
                                    <option value="广西北部湾银行">广西北部湾银行</option>
                                    <option value="湖北银行">湖北银行</option>
                                    <option value="萧山农商银行">萧山农商银行</option>
                                    <option value="浙江稠州银行">浙江稠州银行</option>
                                    <option value="广东南粤银行">广东南粤银行</option>
                                    <option value="吉林九台农村商业银行">吉林九台农村商业银行</option>
                                    <option value="南充市商业银行">南充市商业银行</option>
                                    <option value="台州银行">台州银行</option>
                                    <option value="齐鲁银行">齐鲁银行</option>
                                    <option value="天津滨海农村商业银行">天津滨海农村商业银行</option>
                                    <option value="长安银行">长安银行</option>
                                    <option value="温州银行">温州银行</option>
                                    <option value="陕西秦农农村商业银行">陕西秦农农村商业银行</option>
                                    <option value="宁夏银行">宁夏银行</option>
                                    <option value="威海市商业银行">威海市商业银行</option>
                                    <option value="晋商银行">晋商银行</option>
                                    <option value="内蒙古银行">内蒙古银行</option>
                                    <option value="珠海华润银行">珠海华润银行</option>
                                    <option value="桂林银行">桂林银行</option>
                                    <option value="江苏常熟农村商业银行">江苏常熟农村商业银行</option>
                                    <option value="厦门银行">厦门银行</option>
                                    <option value="唐山市商业银行">唐山市商业银行</option>
                                    <option value="阜新银行">阜新银行</option>
                                    <option value="营口银行">营口银行</option>
                                    <option value="日照银行">日照银行</option>
                                    <option value="乌鲁木齐银行">乌鲁木齐银行</option>
                                    <option value="大连农商银行">大连农商银行</option>
                                    <option value="江苏江阴农村商业银行">江苏江阴农村商业银行</option>
                                    <option value="福建海峡银行">福建海峡银行</option>
                                </select></td>
                                <td class="can_practice_unit_three"></td>
                            </tr>
                            <tr>
                                <td>实习岗位3</td>
                                <td></td>
                                <td>
                                    <input id="practice_post_three" name="practice_post_three" type="text" class="form-control">
                                </td>
                                <td class="can_practice_post_three"></td>
                            </tr>
                            <tr>
                                <td rowspan="2" class="info">4、个人经历</td>
                                <td>国外交换经历</td>
                                <td></td>
                                <td><input id="exchange_student" type="exchange_student" class="form-control" placeholder="请填写在哪个国家"></td>
                                <td class="can_exchange_student"></td>
                            </tr>

                            <tr>
                                <td>社会实践项目</td>
                                <td></td>
                                <td><input id="social_sractice" name="social_sractice" type="text" class="form-control"></td>
                                <td class="can_social_sractice"></td>
                            </tr>
                            <tr>
                                <td rowspan="3" class="info">自身诉求（想要什么）</td>
                                <td>自身职业偏好（想做什么工作)</td>
                                <td></td>
                                <td><input id="want_work" name="want_work" type="text" class="form-control"></td>
                                <td class="can_want_work"></td>
                            </tr>
                            <tr>
                                <td>自我描述（自己是什么样的）</td>
                                <td></td>
                                <td><input id="like_man" name="like_man" type="text" class="form-control"></td>
                                <td class="can_like_man"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="choose-box-wrapper">
            <div id="choose-box">
                <div id="choose-box-title">
                    <span>选择学校</span>
                </div>
                <div id="choose-a-province"></div>
                <div id="choose-a-school"></div>
                <div id="choose-box-bottom">
                    <input type="botton" onclick="hide()" value="关闭"/>
                </div>
            </div>
        </div><!--choose-box-wrapper end-->

        <!-- 按钮触发模态框 -->
        <div class="container" style="position: relative;">
            <button onclick="gradeSubmit()" id="finalScoreSub" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                    style="margin-left: 76%;margin-top: 5px;">
                确认提交
            </button>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                <a href="#" class="list-group-item active">
                                    综合评价
                                </a>
                            </h4>
                        </div>
                        <div class="modal-body" id="modal">
                            <P>您还为填写智能职位职测表</p>
                            <P><span style="color: red">温馨提示：</span>请认真填写智能职位职测表，将会直接影响您的评分</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>
            </div>
        </div>
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
            <p class="foot_ebeirui"><em>贝睿</em>教育</p>
            <p>
                Copyright © 2019 ebeirui.com京ICP备#####
                <span class="ml10">京公网安备############</span>
            </p>
            <p>ebeirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/beirui_ma.jpg" alt="">
        </div>
    </div>
</footer>
<script src="${path}/resources/schoolJS/main.js"></script>

<script>
    var memberid = $("#memberid").val();
    /*提交所有的评分数据*/
    $(function () {
        var layer;
        layui.use('layer', function () {
            layer = layui.layer;
        });
    });
    finalScoreSub()

    /*参看分数*/
    function finalScoreSub() {
        $.ajax({
            url: '${path}/pcviews/finalScoreSub',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == -1) {
                    $("#finalScoreSub").html("查看分数")
                }
            }
        })
    }


    /*参数合法化检验*/
    /*姓名*/
    $("#name").blur(function usernamea() {
        //获取字符串
        var name = document.getElementById("name").value;
        if (1 < name.length && name.length < 5) {
            $(".can_name").text("验证通过");
            $(".can_name").css("color", "green");
        }
    });

    /*性别*/
    $("#gender").blur(function () {
        var gender = document.getElementById("gender").value;
        if (gender != "") {
            $(".can_gender").text("验证通过");
            $(".can_gender").css("color", "green");
        }
    });
    /*年龄*/
    $("#birthday").blur(function () {
        var birthday = document.getElementById("birthday").value;
        if (birthday != "") {
            $(".can_birthday").text("验证通过");
            $(".can_birthday").css("color", "green");
        }
    });
    /*籍贯*/
    $("#native_place").blur(function () {
        var native_place = document.getElementById("native_place").value;
        if (1 < native_place.length && native_place.length < 10) {
            $(".can_native_place").text("验证通过");
            $(".can_native_place").css("color", "green");
        }
    });
    /*政治面貌*/
    $("#political_background").blur(function () {
        var political_background = document.getElementById("political_background").value;
        if (political_background != "") {
            $(".can_political_background").text("验证通过");
            $(".can_political_background").css("color", "green");
        }
    });

    var gradeSubmit = function () {
        var datas = getDatas();
        var formData = new FormData;
        finalScore()
        formData.append("datas", JSON.stringify(datas));
        if ($(".can_name").text() != "验证通过" && $(".can_gender").text() != "验证通过" &&
            $(".can_birthday").text() != "验证通过" && $(".can_native_place").text() != "验证通过" &&
            $(".can_political_background").text() != "验证通过") {
            $("#modal").html("<p>请按照规范填写：当合法校验文字都为绿色才能提交</p>  <P><span style=\"color: red\">温馨提示：</span>请认真填写智能职位职测表，将会直接影响您的评分</p>")
        } else if (($(".can_name").text() == "验证通过" && $(".can_gender").text() == "验证通过" &&
            $(".can_birthday").text() == "验证通过" && $(".can_native_place").text() == "验证通过" &&
            $(".can_political_background").text() == "验证通过")) {
            $("#modal").html("<p>请点击下面按钮查看分数</p> ");
            $.ajax({
                url: '${path}/pcviews/doposcom',
                data: formData,
                dataType: 'json',
                type: 'post',
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (data) {
                    if (data.code == -1) {
                    } else {
                        layer.alert(data.msg);
                        finalScore();
                    }
                }
            })
        }
    };

    /*统计分数*/
    var finalScore = function () {
        $.ajax({
            url: '${path}/pcviews/finalScore',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $("#modal").html("");
                var finalScore =
                    " <a href=\"#\" class=\"list-group-item\">恭喜您，您的分数为<span style=\"color: red;font-size: 20px;padding-left: 3px\">" + data.finalScore +
                    "</span></a>\n" +
                    "                            <a href=\"#\" class=\"list-group-item\">您打败了全国多少竞争对手？<span style=\"color: red\">" + data.defeat + "位" +
                    "</span></a>\n" +
                    "                            <a href=\"#\" class=\"list-group-item\">您的优势为<span style=\"color: red\">" + data.goodBad.majorBen +
                    "</span></a>\n" +
                    "                            <a href=\"#\" class=\"list-group-item\">我们给您推荐的工作是<span style=\"color: red\">" + data.recommend1 +
                    "</span></a>\n" +
                    "                            <a href=\"#\" class=\"list-group-item\">我们给您的改进建议是<span style=\"color: red\">" + data.suggest1 +
                    "</span></a>\n" +
                    "                            <button class=\"btn btn-default\" style=\"height: 150px;width: 500px;\"><span>" + data.contend +
                    "</span></button>";
                $("#modal").append(finalScore);
            }

        })
    };

    /*获取所有评分数据*/
    var getDatas = function () {
        var datas = {};
        $("#gradeForm").find("input").not(document.getElementsByClassName("nationBook")).each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });

        $("#gradeForm").find("select").each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });
        $("input[class='nationBook']:checkbox:checked").each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });
        return datas;
    };
    $("#5").addClass("active");
</script>
</body>
</html>