<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园智能招聘网</title>
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/personalcenter.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pcPlus/js/bootstrap.min.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
    <link rel="stylesheet" href="${path}/resources/pc/css/recruit.css"/>


</head>
<script>
    $(document).ready(function () {
        $(".left_box_ul li").click(function () {
                var divShow = $(".right_box").children("ul");
                if (!$(this).hasClass("select")) {
                    var index = $(this).index();
                    $(this).addClass("select");
                    $(this).siblings("li").removeClass("select");
                    $(divShow[index]).show();
                    $(divShow[index]).siblings("ul").hide();
                }
            }
        );
    })
</script>
<style>
    .h_search {
        top: 15px;
    }

    #header-search {
        width: 255px;
        height: 35px;
    }

    .left_box_ul li a {
        color: gray;
    }

    .left_box_ul li {
        margin-bottom: 20px;
        border-bottom: 1px solid #bdbdbd;
    }

    .card_one {
        padding-bottom: 9px;
    }

</style>
<body>
<!--头-->
<%--引入头信息--%>
<%@ include file="include_head.jsp" %>

<div class="container index" id="container" style="overflow: hidden">
    <div class="wrapper" style="overflow: hidden">
        <!--左边模板-->
        <div class="left_box">

            <!--头像组成部分-->
            <div class="left_box_img">
                <div class="rectangle">
                    <img class="left_box_images" id="img_box" src="${path}${personForm.headPhoto}">
                    <div>
                        <div class="file-container"
                             style="right: 39px;display: inline-block;position: absolute; overflow: hidden;vertical-align: middle; top: 185px; left: 73px;">
                            <button id="load" class="btn btn-success fileinput-button" type="button">上传头像</button>
                            <input id="headPhoto" onchange="uploadFile(${personForm.id})" type="file"
                                   style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
                        </div>
                    </div>
                </div>
                <span class="left_box_text">${personForm.nickname}</span>
            </div>

            <!--导航栏组成部分-->
            <div class="left_box_navigation">
                <ul class="left_box_ul">
                    <li><a class="left_box_li" data-id="0" id="0" style="color: black" class="active">基本信息</a></li>
                    <li><a class="left_box_li" data-id="1" id="1">修改密码</a></li>
                    <li><a class="left_box_li" data-id="2" id="2">我收藏的招聘</a></li>
                    <li><a class="left_box_li" data-id="3" id="3">我收藏的机构</a></li>
                    <li><a class="left_box_li" data-id="4" id="4">我的点评</a></li>
                    <li><a class="left_box_li" data-id="5" id="5">我收获的赞</a></li>
                    <li><a class="left_box_li" data-id="6" id="6">我赞过的</a></li>
                    <li><a class="left_box_li" data-id="7" id="7">我的私信</a></li>
                </ul>
            </div>

            <script>
                $(".left_box_ul li a ").click(function () {
                    $(".left_box_ul li a").css("color", "gray");
                    $(this).css("color", "black");
                })
            </script>

        </div>
        <!--右边模板-->
        <div class="right_box">
            <!--基本信息模块-->
            <ul class="id_0" id="position" style="position: relative;">
                <div class="card">
                    <input type="hidden" class="personId" id="id" value="${personForm.id}">
                    <label class="ladel_span">昵称:</label>&nbsp;<input id="nickname" type="text" value="${personForm.nickname}" class="right_box_input">
                    <br>
                    <label class="ladel_span">职业状态:</label>&nbsp;<input id="jobStatus" value="${personForm.jobStatus}" type="text" placeholder="例如：在职，离职，实习"
                                                                        class="right_box_input">
                    <br>
                    <label class="ladel_span">性别:</label>&nbsp;

                    <select id="gander" class="right_box_input" style="-webkit-appearance: none; -webkit-tap-highlight-color: #fff;outline: 0;">
                        <option value='男' <c:if test="${personForm.gender=='男'}">selected</c:if>>男</option>
                        <option value='女' <c:if test="${personForm.gender=='女'}">selected</c:if>>女</option>
                    </select>
                    <br>
                    <label class="ladel_span">生日:</label>&nbsp;<input id="birthday" type="date" class="right_box_input" value="${personForm.birthday}">
                    <br>
                    <label class="ladel_span">地址:</label>&nbsp;<input id="address" type="address" class="right_box_input" value="${personForm.address}">
                    <br>
                    <label class="ladel_span">邮箱:</label>&nbsp;<input id="mail" type="text" class="right_box_input" value="${personForm.mail}">
                    <br>
                    <label class="ladel_span">感兴趣的行业:</label>&nbsp;<input id="likeIndustry" type="text" value="${personForm.likeIndustry}"
                                                                          class="right_box_input" placeholder="例如：互联网，进入">
                    <br>
                    <label class="ladel_span">感兴趣的岗位:</label>&nbsp;<input id="liekeJob" type="text" value="${personForm.likeJob}" class="right_box_input"
                                                                          placeholder="例如：java程序员，项目经理助手">
                    <br>
                    <label class="ladel_span" style="float:left;">自我介绍:</label>&nbsp;
                    <textarea id="introduce" rows="4" cols="40" style="border: none;   resize: none;">${personForm.introduce}</textarea>
                    <button id="save"
                            style="  position: absolute;border: none; height: 36px;width: 76px;box-shadow: 0px 3px 3px #c8c8c8;top: 307px;left: 541px;"
                            onclick="submitHead(${personForm.id})" class="img_btn_xg">保存
                    </button>
                    <button id="edit"
                            style=" position: absolute;border: none; height: 36px;width: 76px;box-shadow: 0px 3px 3px #c8c8c8;top: 307px;left: 541px;">修改
                    </button>
                </div>
            </ul>


            <ul class="id_1" style="position: relative;display: none;">
                <div class="card_one">
                    <div class="passwordedit">
                        <li><label>旧 密 码:</label></li>
                        <li><input id="oldPassWord" type="password" class="left_input"></li>
                        <li><label>新 密 码:</label></li>
                        <li><input id="newPassWord" type="password" class="left_input"></li>
                        <li><label>再输一遍:</label></li>
                        <li><input id="againPassword" type="password" class="left_input"></li>
                    </div>
                    <button style="position: relative;left: 404px;top: -15px;border: none;height: 36px;width: 76px;box-shadow: 0px 3px 3px #c8c8c8;"
                            class="img_btn_xg" onclick="editPassWord(${personForm.id})">修改密码
                    </button>
                </div>
            </ul>

            <%--我收藏的招聘--%>
            <ul class="id_2" style="position: relative;display: none;">
                <div class="card_one">
                    <p><span style="color: red">注：</span>已下架的招聘信息自动从您的收藏移除</p>
                    <table class="table table-hover">
                        <tr style="background-color: #9f9f9f;color: white">
                            <th>职位名称</th>
                            <th>公司名称</th>
                            <th>操作</th>
                        </tr>

                        <tbody id="collect">
                        <tr style="background-color: #9f9f9f;color: white">
                            <th>职位名称</th>
                            <th>公司名称</th>
                            <td>
                                <button type="button" class="btn btn-warning">查看</button>
                                <button type="button" class="btn btn-warning">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </ul>
            <%--我收藏的机构--%>
            <ul class="id_3" style="position: relative;display: none;">
                <div class="card_one">
                    <p><span style="color: red">注：</span>已下架的机构信息自动从您的收藏移除</p>
                    <table class="table table-hover">
                        <tr style="background-color: #9f9f9f;color: white">
                            <th>机构名称</th>
                            <th>薪资</th>
                            <th>评分</th>
                            <th>操作</th>
                        </tr>

                        <tbody id="collectOrg">

                        </tbody>
                    </table>
                </div>
            </ul>


            <!--我的点评模块-->
            <ul class="id_4" style="position: relative;display: none;">
                <p><span style="color: red">注：</span>删除我的点评会相应删除您在机构点评的点评</p>
            </ul>

            <!--我收货的赞模块-->
            <ul class="id_5" style="position: relative;display: none;">

            </ul>

            <!--我赞过模块-->
            <ul class="id_6" style="position: relative;display: none;">

            </ul>

            <!--我的私信模块-->

            <ul class="id_7" style="position: relative;display: none;">

            </ul>
            <p style="clear:both"></p>
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
    <script src="${path}/resources/pcPlus/js/personCenter.js"></script>
    <script>
        var id = ${personForm.id};


        var headPhoto = null;
        $(function () {
            layui.use('layer', function () {
                layer = layui.layer;
            });
        });

        /*  function loadFile(file) {
              $("#filename").html(file.name);
          }*/

        $(function () {
            $("#headPhoto").on('change', function () {
                headPhoto = document.getElementById("headPhoto").files[0];
                document.getElementById("img_box").src = window.URL.createObjectURL(headPhoto);
            });
        });

        $("#edit").on('click', function () {
            $("#edit").hide();
            $(".card input").css('border', '1px solid #c8c8c8');
            $(".card select").css('border', '1px solid #c8c8c8');
            $(".card textarea").css('border', '1px solid #c8c8c8');
            $(".card textarea").css('border-radius', '5px');
            $("#save").show();
        });

        /*上传图片*/
        $('#load').click(function () {
            document.getElementById("headPhoto").click();
        });

        function uploadFile(id) {
            var myform = new FormData();
            myform.append('file', $('#headPhoto')[0].files[0]);
            $.ajax({
                url: "setHeadPhoto/" + id,
                type: "POST",
                data: myform,
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                },
                error: function (data) {
                    console.log(data)
                }
            });
        }
    </script>
</div>
</body>
</html>