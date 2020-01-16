<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>【工商银行招聘信息】-贝睿</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link href="${path}/resources/css/recruit.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/css/index.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <link href="${path}/resources/css/bootstrap.min.css">
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pc/layui/layui.js"></script>
    <title>贝睿-|评公司|搜职位|中国领先的金融信息平台</title>
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
</head>

<body class="bg_f5f">
<!--头部文件-->
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
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>贝睿精选</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>

<div class="content-wrap">
    <section class="review_box recruit_box kz_m_b_20">
        <!--热门评论-->
        <form class="box_a">
            <div class="bd ">
                <div class="every_see P_index5">
                    <!--1、基本信息类-->
                    <div class="box_a">
                        <div class="bd ">
                            <div class="every_see P_index5">
                                <h2 class="h2_style_lefe" style="width: 140px;margin-bottom: 10px;">1、基本信息类</h2>
                                <div style="position: relative;">
                                    <p><label class="lable_style_left">姓名</label>
                                        <input id="name" name="name" type="text" class="input_style_left" placeholder="请填写真实姓名"></p>
                                </div>
                                <input type="hidden" name="memberid" id="memberid" value="${sessionScope.MEMBER.id}">
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">性别</label>
                                        <select id="gender" name="gender" onmousedown="this.size=3"
                                                onblur="this.size=0" onchange="this.size=0" class="input_style_left" style="margin-left: 36px;width: 175px">
                                            <option value="" selected="selected">请选择</option>
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                </div>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">年龄</label><input id="birthday" style="width: 170px" name="birthday" type="date"
                                                                                        class="input_style_left"
                                                                                        placeholder="请填写真实年龄（出生日期）"></p>
                                </div>

                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">籍贯</label><input id="native_place" name="native_place" type="text"
                                                                                        class="input_style_left" placeholder="请填写籍贯"></p>
                                </div>

                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">政治面貌</label>
                                        <select id="political_background" class="input_style_left" onmousedown="if(this.options.length>4){this.size=5}"
                                                onblur="this.size=0" onchange="this.size=0" style="margin-left: 13px;width: 175px">
                                            <option value="" selected="selected">请选择</option>
                                            <option value="中共党员">中共党员</option>
                                            <option value="其他党派">其他党派</option>
                                            <option value="群众">群众</option>
                                            <option value="其他">其他</option>
                                        </select>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--2、教育背景-->
                    <div class="box_a">
                        <div class="bd ">
                            <div class="every_see P_index5">
                                <h2 class="h2_style_lefe" style="width: 140px;margin-bottom: 10px;">2、教育背景</h2>
                                <div style="position: relative;">
                                    <p><label class="lable_style_left">本科院校</label>
                                        <input name="school" id="school" type="text" class="input_style_left" style="margin-left: 13px" placeholder="填写学校全称">
                                    </p>
                                    </p>
                                </div>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">本科专业</label>
                                        <select id="major_ben" name="major_ben" class="input_style_left" onmousedown="if(this.options.length>4){this.size=5}"
                                                onblur="this.size=0" onchange="this.size=0" style="margin-left: 12px;width: 175px">
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
                                    </p>
                                </div>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">硕士学院</label>
                                        <input name="school_plus" id="school_plus" type="text" class="input_style_left" style="margin-left: 13px"
                                               placeholder="填写学校全称"></p>
                                    </p>
                                </div>

                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">硕士专业</label>
                                        <select id="major_shuo" name="major_shuo" class="input_style_left" onmousedown="if(this.options.length>4){this.size=5}"
                                                onblur="this.size=0" onchange="this.size=0" style="margin-left: 12px;width: 175px">
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
                                    </p>
                                </div>

                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">博士学校</label>
                                        <input name="school_big" id="school_big" type="text" class="input_style_left" style="margin-left: 13px"
                                               placeholder="填写学校全称"></p>
                                </div>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">博士专业</label>
                                        <input id="major_bo" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                               placeholder="博士专业手填"></p>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!--3、证书技能-->
                    <div class="box_a">
                        <div class="bd ">
                            <div class="every_see P_index5">
                                <h2 class="h2_style_lefe" style="width: 140px;margin-bottom: 10px;">3、证书技能</h2>
                                <div style="position: relative;">
                                    <p><label class="lable_style_left">证书技能</label>
                                        <div style="margin-left: 96px;margin-bottom: 10px">
                                    <p><input type="checkbox" id="skill_book1" name="category" class="nationBook" value="CPA全科|CFA三级|美精算师 "/>CPA全科|CFA三级|美精算师
                                    </p>
                                    <p><input type="checkbox" id="skill_book2" name="category" class="nationBook" value="司法|CPA1-2级|FRM"/>司法|CPA1-2级|FRM</p>
                                    <p><input type="checkbox" id="skill_book3" name="category" class="nationBook" value="司法考试"/>司法考试</p>
                                    <p><input type="checkbox" id="skill_book4" name="category" class="nationBook" value="从业资格"/>从业资格</p>
                                </div>
                                </p>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">语言证书</label>
                                        <div style="margin-left: 96px;margin-bottom: 10px">
                                    <p><input type="checkbox" id="language_book1" name="category" class="nationBook" value="英文4/6级  "/>英文4/6级 </p>
                                    <p><input type="checkbox" id="language_book2" name="category" class="nationBook" value="托福/雅思"/>托福/雅思</p>
                                    <p><input type="checkbox" id="language_book3" name="category" class="nationBook" value="托业"/>托业</p>
                                    <p><input type="checkbox" id="language_book4" name="category" class="nationBook" value="Office"/>Office</p>
                                    <p><input type="checkbox" id="language_book5" name="category" class="nationBook" value="C# JAVA"/>C# JAVA</p>
                                    <p><input type="checkbox" id="language_book6" name="category" class="nationBook" value="无"/>无</p>
                                </div>
                                </p>
                                <div style="position: relative;margin:5px 0;">
                                    <p><label class="lable_style_left">奖学金、学生干部、荣誉证书</label>
                                        <div style="margin-left: 96px;margin-bottom: 10px">
                                    <p><input type="checkbox" id="nation_book1" name="category" class="nationBook" value="英文4/6级  "/>英文4/6级 </p>
                                    <p><input type="checkbox" id="nation_book2" name="category" class="nationBook" value="托福/雅思"/>托福/雅思</p>
                                    <p><input type="checkbox" id="nation_book3" name="category" class="nationBook" value="托业"/>托业</p>
                                    <p><input type="checkbox" id="nation_book4" name="category" class="nationBook" value="Office"/>Office</p>
                                    <p><input type="checkbox" id="nation_book5" name="category" class="nationBook" value="C# JAVA"/>C# JAVA</p>
                                    <p><input type="checkbox" id="nation_book6" name="category" class="nationBook" value="无"/>无</p>
                                </div>
                                <div>
                                    <p><label class="lable_style_left">其他技能（运动员、钢琴、游泳等）、大赛</label>
                                        <input id="high_book" type="text" name="major_bo" class="input_style_left" style="margin-left: 128px"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--4、工作实习等（最多填3个）-->
                <div class="box_a">
                    <div class="bd ">
                        <div class="every_see P_index5">
                            <h2 class="h2_style_lefe" style="width: 140px;margin-bottom: 10px;">4、工作实习</h2>

                            <div style="position: relative;">
                                <p><label class="lable_style_left">实习单位1</label>
                                    <input id="practice_unit_one" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习单位全称"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">实习岗位1</label>
                                    <input id="practice_post_one" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习岗位"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">实习单位2</label>
                                    <input id="practice_unit_two" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习单位全称"></p>
                                </p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">实习岗位2</label>
                                    <input id="practice_post_two" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习岗位"></p>
                                </p>
                            </div>

                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">实习单位3</label>
                                    <input id="practice_unit_three" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习单位全称"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">实习岗位3</label>
                                    <input id="practice_post_three" type="text" name="major_bo" class="input_style_left" style="margin-left: 13px"
                                           placeholder="填写实习岗位"></p>
                            </div>

                        </div>

                    </div>
                </div>

                <!--5、社会实践等-->
                <div class="box_a">
                    <div class="bd ">
                        <div class="every_see P_index5">
                            <h2 class="h2_style_lefe" style="width: 140px;margin-bottom: 10px;">5、社会实践</h2>
                            <div style="position: relative;">
                                <p><label class="lable_style_left">国外交换经历</label>
                                    <input id="exchange_student" type="text" class="input_style_left" style="margin-left: 6px" placeholder="请填写在哪个国家"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">社会实践项目</label><input id="social_sractice" type="text" style="margin-left: 6px"
                                                                                        class="input_style_left"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">自身诉求说明</label><input type="text" id="want_work" class="input_style_left"
                                                                                        style="margin-left: 6px"
                                                                                        placeholder="想要什么"></p>
                            </div>
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">自我描述说明</label><input type="text" class="input_style_left" style="margin-left: 6px"
                                                                                        placeholder="能吃苦|交际花|霸气的|自信的...."></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div style="margin-top: 10px;margin-left: 210px">
            <input type="button" id="sure_tj" onclick="allSubmit()"
                   style="padding: 3px 2px;width: 80px;    margin-left: 22px;height: 29px;border: none; background-color: cadetblue;color: white"
                   value="确认提交"> </input>
        </div>
        <script>
            $(document).ready(function () {
                $("#sure_tj").click(function () {
                    $(".modal-body").css("display", "block");
                })
            });

            $(function () {
                var layer;
                layui.use('layer', function () {
                    layer = layui.layer;
                });
                finalScore();
            });

            var memberid = $("#memberid").val();
            var allSubmit = function () {
                var datas = getDatas();
                console.log(datas);
                var formData = new FormData;
                formData.append("datas", JSON.stringify(datas));
                if (datas.id == undefined || datas.id.trim().length == 0) {
                    $.ajax({
                        url: '${path}/h5views/doposcom',
                        data: formData,
                        dataType: 'json',
                        type: 'post',
                        processData: false,//用于对data参数进行序列化处理 这里必须false
                        contentType: false, //必须
                        success: function (data) {
                            if (data.code == 0) {
                                $("#decEntryId").val(data.id);
                                layer.confirm("验证成功", {btn: ['验证成功', '保留当前']}, function () {
                                        window.location.reload();
                                    },
                                    function (index) {
                                        layer.close(index);
                                    });
                            } else {
                                layer.alert(data.msg);
                            }
                        }
                    })
                }
            };

            /*统计分数*/
            var finalScore = function () {
                $.ajax({
                    url: '${path}/h5views/finalScore',
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        $(".modal-body").html("");
                        var finalScore =
                            "  <div style=\"padding: 10px;\">\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">恭喜您，您的分数为<span style=\"color: red\">" + data.finalScore + "</span></a>\n" +
                            "                <br>\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">您打败了全国多少竞争对手？<span style=\"color: red\">" + data.defeat + "</span></a>\n" +
                            "                <br>\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">您的优势为<span style=\"color: red\">" + data.goodBad.majorBen + "</span></a>\n" +
                            "                <br>\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">我们给您推荐的工作是<span style=\"color: red\">" + data.recommend1 + "</span></a>\n" +
                            "                <br>\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">我们给您的改进建议是<span style=\"color: red\">" + data.suggest1 + "</span></a>\n" +
                            "                <br>\n" +
                            "                <a href=\"#\" style=\"color: black;font-size: 12px\" class=\"list-group-item\">您的优势、劣势为<span style=\"color: red\">100</span></a>\n" +
                            "                <br>\n" +
                            "                <button class=\"btn btn-default\" style=\"padding: 10px;background-color: #eb7676;color: white;border-radius: 3px;margin-top: 5px;width: 300px\">\n" +
                            "                    <span>" + data.contend + "</span></button>\n" +
                            "            </div>";
                        $(".modal-body").append(finalScore);
                    }

                })
            };


            var getDatas = function () {
                var datas = {};
                $(".box_a").find("input").not(document.getElementsByClassName("nationBook")).each(function () {
                    datas[$(this).attr('id')] = $(this).val();
                });

                $(".box_a").find("select").each(function () {
                    datas[$(this).attr('id')] = $(this).val();
                });
                $("input[class='nationBook']:checkbox:checked").each(function () {
                    datas[$(this).attr('id')] = $(this).val();
                });
                return datas;
            };
        </script>
        <div class="modal-body" style="background-color: white;height: 200px;margin-top: 10px;margin-left: 30px;display: none;">

        </div>
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
</body>
</html>
