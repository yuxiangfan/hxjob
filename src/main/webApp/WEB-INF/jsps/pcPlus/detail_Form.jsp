<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘网</title>
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
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

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
                                        <select id="gender" name="gender"
                                                style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;">
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
                                <td><input id="birthday" name="birthday" type="date" class="form-control layui-input">
                                </td>
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
                                           onblur="if(this.value==''){this.value='请选择大学'}"
                                           onfocus="if(this.value=='请选择大学'){this.value=''}"
                                           onclick="pop(this)"/>
                                </td>
                                <td><span class="can_school"></span></td>
                            </tr>
                            <tr>
                                <td>本科专业</td>
                                <td>财务管理</td>
                                <td>
                                    <select id="major_ben" name="major_ben"
                                            style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;"
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
                                    <input type="text" class="form-control" name="school_plus" id="school_plus"
                                           value="请选择大学"
                                           onblur="if(this.value==''){this.value='请选择大学'}"
                                           onfocus="if(this.value=='请选择大学'){this.value=''}"
                                           onclick="pop(this)"/>
                                </td>
                                <td class="can_school_plus"></td>
                            </tr>
                            <tr>
                                <td>硕士专业</td>
                                <td>财务管理</td>
                                <td>
                                    <select id="major_shuo" name="major_shuo"
                                            style="height: 35px;width:100%;padding: 0px;margin: 0px;border-radius: 4px;">
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
                                    <p><input type="checkbox" id="skill_book1" name="skill_book1" class="nationBook"
                                              value="计算机相关证书"/>计算机相关证书
                                    </p>
                                    <p><input type="checkbox" name="skill_book2" id="skill_book2" class="nationBook"
                                              value="司法相关证书"/>司法相关证书</p>
                                    <p><input type="checkbox" name="skill_book3" id="skill_book3" class="nationBook"
                                              value="金融相关证书"/>金融相关证书</p>
                                    <p><input type="checkbox" name="skill_book4" id="skill_book4" class="nationBook"
                                              value="从业资格"/>从业资格</p>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>是否有语言类证书（四六级、托福托业等)</td>
                                <td>可以选填，没有则不填</td>
                                <td>
                                    <p><input type="checkbox" id="language_book1" name="language_book1"
                                              class="nationBook" value="英文4/6级"/>英文4/6级 </p>
                                    <p><input type="checkbox" id="language_book2" name="language_book2"
                                              class="nationBook" value="托福/雅思"/>托福/雅思</p>
                                    <p><input type="checkbox" id="language_book3" name="language_book3"
                                              class="nationBook" value="托业"/>托业</p>
                                    <p><input type="checkbox" id="language_book4" name="language_book5"
                                              class="nationBook" value="Office"/>Office</p>
                                    <p><input type="checkbox" id="language_book5" name="language_book5"
                                              class="nationBook" value="C# JAVA"/>C# JAVA</p>
                                    <p><input type="checkbox" id="language_book6" name="language_book6"
                                              class="nationBook" value="无"/>无</p>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>奖学金、学生干部、荣誉证书</td>
                                <td>可以选填，没有则不填</td>
                                <td>
                                    <p><input type="checkbox" name="nation_book1" id="nation_book1" class="nationBook"
                                              value="国家级奖学金/学生干部/大赛获奖"/>国家级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book2" id="nation_book2" class="nationBook"
                                              value="省级部奖学金/学生干部/大赛获奖"/>省级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book3" id="nation_book3" class="nationBook"
                                              value="校级奖学金/学生干部/大赛获奖"/>校级奖学金/学生干部/大赛获奖
                                    </p>
                                    <p><input type="checkbox" name="nation_book4" id="nation_book4" class="nationBook"
                                              value="无或其他"/>无或其他</p>
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
                                <td>***公司</td>
                                <td><input id="practice_unit_one" name="practice_unit_one"
                                           class="selectpicker show-tick form-control" data-live-search="true">
                                </td>
                                <td class="can_practice_unit_one"></td>
                            <tr>
                                <td>实习岗位1</td>
                                <td>java开发工程师</td>
                                <td>
                                    <input id="practice_post_one" name="practice_post_one" type="text"
                                           class="form-control">
                                </td>
                                <td class="can_practice_post_one"></td>
                            </tr>
                            <tr>
                                <td>实习单位2</td>
                                <td>***公司</td>
                                <td>
                                    <input id="practice_unit_two" name="practice_unit_two"
                                           class="selectpicker show-tick form-control" data-live-search="true">
                                </td>
                                <td class="can_practice_unit_two"></td>
                            </tr>
                            <tr>
                                <td>实习单位2</td>
                                <td>C++开发工程师</td>
                                <td>
                                    <input id="practice_post_two" name="practice_post_two" type="text"
                                           class="form-control">
                                </td>
                                <td class="can_practice_post_two"></td>
                            </tr>
                            <tr>
                                <td>实习单位3</td>
                                <td>***公司</td>
                                <td><input id="practice_unit_three" name="practice_unit_three"
                                           class="selectpicker show-tick form-control"
                                           data-live-search="true">
                                <td class="can_practice_unit_three"></td>
                            </tr>
                            <tr>
                                <td>实习岗位3</td>
                                <td>销售经理</td>
                                <td>
                                    <input id="practice_post_three" name="practice_post_three" type="text"
                                           class="form-control">
                                </td>
                                <td class="can_practice_post_three"></td>
                            </tr>
                            <tr>
                                <td rowspan="2" class="info">4、个人经历</td>
                                <td>国外交换经历</td>
                                <td></td>
                                <td><input id="exchange_student" type="exchange_student" class="form-control"
                                           placeholder="请填写在哪个国家"></td>
                                <td class="can_exchange_student"></td>
                            </tr>

                            <tr>
                                <td>社会实践项目</td>
                                <td></td>
                                <td><input id="social_sractice" name="social_sractice" type="text" class="form-control">
                                </td>
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
            <button onclick="gradeSubmit()" id="finalScoreSub" class="btn btn-primary btn-lg" data-toggle="modal"
                    data-target="#myModal"
                    style="margin-left: 76%;margin-top: 5px;">
                确认提交
            </button>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
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
            <p class="foot_ebeirui"><em>校园</em>智能招聘</p>
            <p>Powered by <a href="#" target="_Blank" style="color: #f0ad4e">合信码众</a></p>
        </div>
        <div class="foot_right">
            <img src="${path}/resources/pcPlus/images/logo.png" alt="">
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