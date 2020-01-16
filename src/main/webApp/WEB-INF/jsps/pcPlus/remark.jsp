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
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/person.css">
    <link rel="stylesheet" href="${path}/resources/remak/css/amsify.suggestags.css">
    <link rel="stylesheet" href="${path}/resources/remak/css/normalize.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/bootstrap-3.4.1/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/pc/layui/layui.js"></script>
    <script src="${path}/resources/business-js/pc/common.js"></script>
    <link href="${path}/resources/star/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${path}/resources/star/js/star-rating.js" type="text/javascript"></script>
    <script src="${path}/resources/remak/js/jquery.amsify.suggestags.js"></script>
    <link rel="stylesheet" href="${path}/resources/pc/css/public.css"/>
</head>
<style type="text/css">
    .font_a {
        padding-left: 15%;
    }

    div.file {
        display: inline-block;
        width: 100px;
        height: 20px;
        line-height: 20px;
        position: relative;
        overflow: hidden;
        color: red
    }

    div.file input {
        position: absolute;
        left: 0px;
        top: 0px;
        zoom: 1;
        filter: alpha(opacity=0);
        opacity: 0;
        font-size: 20px;
        margin-left: -240px
    }

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
</style>
<body>

<!--头-->
<%@ include file="include_head.jsp" %>
<div class="container" id="container">
    <div class="wrapper ">
        <div style="position: relative;">
            <div style="position: absolute;width: 300px;height: 300px;background-color: #f8f8f8;left: 648px;top: 10px;padding:40px 10px 0;">
                <h3>贝睿金融网</h3>
                <p>感谢每一个贝睿人的认真填写,您填写的数据将会为下一个贝睿人提供参考,同时也会让你获得更好的机会的选择</p>
            </div>
        </div>
        <div>
            <!--左边-->
            <div class="left_wrapper">
                <div class="input-group col-md-7">
                    <span class="input-group-addon">我的评论(请认真填写信息)</span>
                </div>
                <br>
                <%--表单--%>
                <form class="layui-form" action="" id="remark">
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">公司名称</span>
                        <input type="text" name="orgname" class="form-control" id="orgname"
                               value="${org.fullname }"
                               placeholder="例如百度">
                    </div>

                    <input type="hidden" name="orgCode" id="orgCode" value="${orgcode}">
                    <input type="hidden" name="memberid" id="memberid" value="${sessionScope.MEMBER.id}">
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">岗位所在地</span>
                        <div class="form-group">
                            <select name="city" id="city" class="form-control">
                                <option value="">请选择</option>
                                <c:forEach items="${cities}" var="city">
                                    <option value="${city.id}" <c:if test="${city.id==org.city}">selected</c:if>> ${city.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">岗位状态</span>
                        <%-- <input type="text"  name="postStatus" class="form-control"
                                placeholder="在职-离职-实习">--%>
                        <div class="form-group">
                            <select name="postStatus" id="postStatus" class="form-control">
                                <option value="">请选择</option>
                                <option value="在职">在职</option>
                                <option value="离职">离职</option>
                                <option value="实习">实习</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工龄(在职)</span>
                        <input type="number" name="workyear" id="workyear" value="${com.workyear}" placeholder="填写在职时长总和"
                               class="form-control" aria-label="...">
                    </div>

                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">量化评价(必填)</span>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工资税前</span>
                        <input name="salaryPreTax" id="salaryPreTax" value="${com.salaryPreTax}" type="number" class="form-control"
                               placeholder="为一年的税前工资为基准">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">额外福利</span>
                        <input type="text" name="otherBenefit" id="otherBenefit" value="${com.otherBenefit}" class="form-control"
                               placeholder="五险一金或其他">
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">年终奖金</span>
                        <input type="number" id="yearEndMoney" name="yearEndMoney" value="${com.yearEndMoney}" class="form-control"
                               placeholder="为一年的年终奖为基准">
                    </div>
                    <br>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">成长性</span>
                        <div class="form-group">
                            <select name="growth" id="growth" class="form-control">
                                <option value="5">非常快</option>
                                <option value="4">成长快</option>
                                <option value="3">一般</option>
                                <option value="2">成长慢</option>
                                <option value="1">非常缓慢</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">工作量</span>
                        <div class="form-group">
                            <select name="workload" id="workload" class="form-control">
                                <option value="5">非常清闲</option>
                                <option value="4">清闲</option>
                                <option value="3">不加班</option>
                                <option value="2">经常加班</option>
                                <option value="1">疯狂加班</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">文化环境</span>
                        <div class="form-group">
                            <select name="culturalContext" id="culturalContext" class="form-control">
                                <option value="5">氛围极好</option>
                                <option value="4">氛围好</option>
                                <option value="3">正常</option>
                                <option value="2">正常</option>
                                <option value="1">极差</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="input-group col-md-7 ">
                        <div><span class="input-group-addon">综合满意度</span></div>
                        <br>
                        <br>
                        <input id="satisfaction" name="satisfaction" value="4" type="text" class="rating" data-min=0
                               data-max=5 data-step=0.2
                               data-size="xs"
                               required title="">
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">文字评价(必填):</span>
                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">评价</span>
                        <input name="theme" id="theme" type="text" value="${com.theme}" class="form-control" placeholder="主题">
                        <textarea id="writingEvaluation" name="writingEvaluation" class="textArea form-control"
                                  placeholder="文字描述">${com.writingEvaluation}</textarea>

                        <%--  <div class="file">上传图片<input id="imgUpload"  type="file" name="myfiles" class="form-control"/></div>--%>

                        <input value="可选" id="imgUpload" name="imgUpload" type="file" class="form-control">


                    </div>
                    <br>
                    <div class="input-group col-md-7">
                        <span class="input-group-addon">评价标签(选填):</span>
                    </div>
                    <br>
                    <input class="form-control" name="evaluateLabel" type="text" id="evaluateLabel"
                           value="压力不大,倒卖军火的不要去,里面都是通缉犯, 还可以,不怕死可以去">
                    <script>
                        $('input[name="evaluateLabel"]').amsifySuggestags({
                            type: 'amsify',
                            tagLimit: 8
                        });
                    </script>
                    <br>
                </form>
                <div style='padding-left:250px;'>
                    <button class='bt' style="width: 100px; height: 40px;margin-left: 311px" onclick='submit2()'>提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

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
<script>

    var imgUpload = null;
    var layer;

    layui.use('layer', function () {
        layer = layui.layer;
    });
    $(function () {
        $("#imgUpload").on('change', function () {
            imgUpload = document.getElementById("imgUpload").files[0];
        })
    });


    var submit2 = function () {

        var datas = getDatas();

        console.log(datas);

        var formData = new FormData();
        formData.append("datas", JSON.stringify(datas));

        formData.append("imgUpload", imgUpload);

        var orgCode = $("#orgCode").val();
        //新增
        if (datas.id == undefined || datas.id.trim().length == 0) {
            $.ajax({
                url: '${path}/pcviews/userOrgComment',
                data: formData,
                dataType: 'json',
                type: 'post',
                async: false,
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (data) {
                    if (data.code == 0) {
                        window.location.href = "/smartBR/pcviews/tocommentlist/" + orgCode;
                    } else {
                        layer.alert(data.msg);
                    }
                }
            })
        }
    };

    var getDatas = function () {
        var datas = {};
        $("#remark").find("input").each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });

        $("#remark").find("select").each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });
        $("#remark").find("textArea").each(function () {
            datas[$(this).attr('id')] = $(this).val();
        });
        return datas;
    };
    $("#3").addClass("active");
</script>

</html>