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
    <title>校园智能招聘网</title>
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pc/css/recruit.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/remak/css/amsify.suggestags.css">
    <link rel="stylesheet" href="${path}/resources/remak/css/normalize.css">
    <script src="${path}/resources/remak/js/jquery.amsify.suggestags.js"></script>
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcH5Plus/js/company_search.js"></script>
    <link href="${path}/resources/star/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${path}/resources/star/js/star-rating.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.min.css">


</head>
<body id="index">
<div class="beirui">
    <div class="br_main ease">
        <!--头部-->
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
                    <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>校园杂志</span></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span></a></div>
                    <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
                </div>
            </div>
        </div>

        <!--表单填写-->
        <form id="remark">
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">表单填写</h2>
                        <div style="position: relative;">
                            <p><label class="lable_style_left">公司名称</label>
                                <input type="text" name="orgname" id="orgname" value="${org.fullname }" class="input_style_left" placeholder="请填写公司名称"></p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <input type="hidden" name="orgCode" id="orgCode" value="${orgcode}">
                        <input type="hidden" name="memberid" id="memberid" value="${sessionScope.MEMBER.id}">

                        <div style="position: relative;margin:5px 0;">
                            <p><label class="lable_style_left">公司地区</label>
                                <select style=" position: absolute;z-index: 1;width: 174px;" onmousedown="if(this.options.length>4){this.size=5}"
                                        onblur="this.size=0" onchange="this.size=0" name="city" id="city" class="input_style_left">
                                    <option value="">请选择</option>
                                    <c:forEach items="${cities}" var="city">
                                        <option value="${city.id}">
                                                ${city.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <div style="position: relative;margin:5px 0;">
                            <p><label class="lable_style_left">岗位情况</label>
                                <select name="postStatus" id="postStatus" style=" position: absolute;width: 174px;"
                                        onmousedown="if(this.options.length>4){this.size=5}"
                                        onblur="this.size=0" onchange="this.size=0" class="input_style_left">
                                    <option value="">请选择</option>
                                    <option value="在职">在职</option>
                                    <option value="离职">离职</option>
                                    <option value="实习">实习</option>
                                </select>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <div style="position: relative;margin:5px 0;">
                            <p><label class="lable_style_left">工龄</label><input name="workyear" id="workyear" type="text" class="input_style_left"
                                                                                style="margin-left: 65px"
                                                                                placeholder="请填写实际工作年数"></p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 66px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 45px;background-color: black;position: absolute;left: 80px;top: 13px;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!--量化评价(必填)-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">量化评价</h2>
                        <div style="position: relative;">
                            <p><label class="lable_style_left">工资税前</label>
                                <input type="text" name="salaryPreTax" id="salaryPreTax" class="input_style_left" placeholder="为一年的税前工资为基准"></p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <div style="position: relative;margin:5px 0;">
                            <p><label class="lable_style_left">额外福利</label><input type="text" name="otherBenefit" id="otherBenefit" class="input_style_left"  placeholder="五险一金或其他"></p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <div style="position: relative;margin:5px 0;">
                            <p><label class="lable_style_left">年终奖金</label><input type="text" name="yearEndMoney" class="input_style_left"   placeholder="为一年的年终奖为基准">
                            </p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!--成长性-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">成长性</h2>
                        <div style="position: relative;">
                            <div style="position: relative;margin:5px 0;">
                                <p><label class="lable_style_left">成长性</label>
                                    <select name="growth" id="growth" style=" position: absolute;width: 174px;height: 75px"
                                            onmousedown="if(this.options.length>4){this.size=5}"
                                            onblur="this.size=0" onchange="this.size=0" class="input_style_left">
                                        <option value="">请选择</option>
                                        <option value="成长缓慢">成长缓慢</option>
                                        <option value="成长慢">成长慢</option>
                                        <option value="一般">一般</option>
                                        <option value="成长快">成长快</option>
                                        <option value="非常快">非常快</option>
                                    </select>
                                <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                                <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                            </div>
                        </div>
                        <p class="p_style_left_similar_span" style="">*请按照实际填写,也是为了更加方便为您找到选择</p>
                    </div>
                </div>
            </div>

            <!--工作量-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">工作量</h2>
                        <div style="position: relative;">
                            <p><label class="lable_style_left">工作量</label>
                                <select name="workload" id="workload" style=" position: absolute;width: 174px;height: 75px"
                                        onmousedown="if(this.options.length>4){this.size=5}"
                                        onblur="this.size=0" onchange="this.size=0" class="input_style_left">
                                    <option value="">请选择</option>
                                    <option value="非常清闲">非常清闲</option>
                                    <option value="清闲">清闲</option>
                                    <option value="不加班">不加班</option>
                                    <option value="经常加班">经常加班</option>
                                    <option value="疯狂加班">疯狂加班</option>
                                </select>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>
                        </div>
                        <p class="p_style_left_similar_span" style="">*请按照实际填写,也是为了更加方便为您找到选择</p>
                    </div>
                </div>
            </div>

            <!--文化环境-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">文化环境</h2>
                        <div style="position: relative;">
                            <p><label class="lable_style_left">文化环境</label>
                                <select name="culturalContext" id="culturalContext" style=" position: absolute;width: 174px;height: 75px"
                                        onmousedown="if(this.options.length>4){this.size=5}"
                                        onblur="this.size=0" onchange="this.size=0" class="input_style_left">
                                    <option value="">请选择</option>
                                    <option value="氛围极好">氛围极好</option>
                                    <option value="氛围好">氛围好</option>
                                    <option value="正常">正常</option>
                                    <option value="正常">正常</option>
                                    <option value="极差">极差</option>
                                </select>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:8px;left: 90px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 20px;background-color: black;position: absolute;left: 104px;top: 13px;"></div>

                        </div>
                        <p class="p_style_left_similar_span" style="">*请按照实际填写,也是为了更加方便为您找到选择</p>
                    </div>
                </div>
            </div>


            <%--满意度--%>
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe" style="width: 75px">满意度</h2>
                        <input id="satisfaction" name="satisfaction" value="4" type="text" class="rating" data-min=0
                               data-max=5 data-step=0.2
                               data-size="xs"
                               required title="">
                        <div class="clearfix"></div>

                    </div>
                </div>
            </div>

            <!--文字评价(选填)-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">文字评价</h2>
                        <div style="position: relative;">
                            <p><label class="lable_style_left">主题</label><input name="theme" id="theme" type="text" class="input_style_left"></p>
                            <div style="position:absolute;height: 10px;width: 10px;background-color: black;top:9px;left: 68px;border-radius: 30px;"></div>
                            <div style="height: 1px;width: 18px;background-color: black;position: absolute;left: 82px;top: 13px;"></div>

                        </div>
                        <div style="position: relative;margin:5px 0;">
                            <p><label  class="lable_style_left" style="position: absolute;top:5px;">文字描述</label><textarea id="writingEvaluation" name="writingEvaluation"
                                    style="margin-left: 103px;height: 120px;width: 170px" class="input_style_left"></textarea></p>
                        </div>
                    </div>
                </div>
            </div>

            <!--评价标签(选填)-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <h2 class="h2_style_lefe">评价标签</h2>
                        <input class="form-control" name="evaluateLabel" type="text" id="evaluateLabel"
                               value="压力不大,倒卖军火的不要去,里面都是通缉犯, 还可以,不怕死可以去">
                        <script>
                            $('input[name="evaluateLabel"]').amsifySuggestags({
                                type: 'amsify',
                                tagLimit: 8
                            });
                        </script>
                    </div>
                </div>
            </div>

            <!--评价标签(选填)-->
            <div class="box_a">
                <div class="bd ">
                    <div class="every_see P_index5">
                        <label class="control-label">上传图片（可选）:</label>
                        <br>

                        <div class="control-label">
                            <input id="imgUpload" name="imgUpload" type="file" class="form-control">
                        </div>
                        <br>
                        <input type="button" onclick="submitRemark()"
                                style=" width:70px;background-color: #eb7676;padding: 5px;border-radius: 5px;color: white;margin-left: 80%" value="提交">
                        </input>
                    </div>

                </div>
            </div>
        </form>
        <!--底部-->
        <footer class="br_foot">
            <div class="br_dflex">
                <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
                <div class="br_flex dh" style="margin-left: -36px">
                    <a href="footer-help.jsp">帮助</a><em></em>
                    <a href="login.jsp">登录</a><em></em>
                    <a href="register.jsp">注册</a><em></em>
                    <p>Copyright © 2019 beirui.com<br/>
                        校园智能招聘</p>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>
<script>
    var memberPhoto = null;
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

    var submitRemark = function () {

        var datas = getDatas();

        console.log(datas);

        var formData = new FormData();
        formData.append("datas", JSON.stringify(datas));

        formData.append("imgUpload", imgUpload);


        //新增
        if (datas.id == undefined || datas.id.trim().length == 0) {
            $.ajax({
                url: '${path}/h5views/userOrgComment',
                data: formData,
                dataType: 'json',
                type: 'post',
                async: false,
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (data) {
                    if (data.code == 0) {
                        $("#decEntryId").val(data.id);
                        layer.confirm("评论成功", {btn: ['重新评论', '保留当前']}, function () {
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

</script>
</html>