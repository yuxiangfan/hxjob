$(function () {
    getIndexPoss();
    getIndexOrgs();
    getIndexHot();
    brOriginal();


    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
});

/*查询热门点评*/
var getIndexHot = function () {
    $.ajax({
        url: "getIndexRemark",
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#com3").html("");
            if (data != null) {
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    var remark =
                        "<li>\n" +
                        "    <a>\n" +
                        "        <div class=\"img br_center\">\n" +
                        "            <img class=\"img_tx_style\" src=/hxjob" + rows[i].headPhoto + ">\n" +
                        "        </div>\n" +
                        "        <div class=\"info\">\n" +
                        "            <div class=\"name br_elli\" style=\"margin-top: 10px\">" + rows[i].nickname + "\n" +
                        "                <button style=\"border: none;color: white;background-color: #f0ad4e;\">" + rows[i].postStatus + rows[i].workyear + "年" + "</button>\n" +
                        "            </div>\n" +

                        "\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div style=\"position: relative;margin-bottom: 14px\">\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div>\n" +
                        "            <div>" + rows[i].writingEvaluation + "" +
                        "\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </a>\n" +
                        "    <ul class=\"ul_style\">\n" +
                        "        <li style=\"color: #1b6d85\">国泰君安证券</li>\n" +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a><span style='position: relative;font-size: 13px;left: 301px;top: -15px;'>" + rows[i].remarkCount + "</span></li>" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "</li>";
                    $("#com3").append(remark);
                }
            }
        }
    })
};


/*查询热门职业*/
var getIndexPoss = function () {
    $.ajax({
        url: 'posIndexDatas',
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $(".com1").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!data[i].collectJob) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    var rindexPercent = data[i].rindex / 0.05;
                    var indexPos =
                        "<li>\n" +
                        "    <div class=\"info\" style=\"margin-left: 0px;\">\n" +
                        "        <div class=\"name br_elli\" style=\"width: 100%;margin-left: -7px;margin-bottom: 5px;font-size: 16px\"> <a href='posd/" + data[i].code + "' style=\"padding: 0px!important;color: #2c84cc;font-weight: bold;\">【<span\n" +
                        "                                            class=\"a_span\">" + data[i].organization.cityname + "</span>】" + data[i].organization.fullname + " -" + data[i].title + "</a>\n" +
                        "\n" +
                        "                                </div>\n" +
                        "                                <p>\n" + data[i].organization.brief +
                        "                                </p>\n" +
                        "                            </div>\n" +
                        "    <ul class=\"ul_style\">\n" +
                        "        <li style=\"margin-right: 5px\">" + data[i].type + "</li>\n" +
                        "        <li style=\"margin-right: 5px\">" + data[i].organization.industryname + "</li>\n" +
                        "        <li style=\"margin-right: 5px\">" + data[i].department + "</li>\n" +
                        "                        <li style=\"margin-left: 145px\"><a  class='saveAll saveStar' href='javascrpt:void(0)' " + collectCSS + " id=p" + data[i].code + " onclick=savePosition('" + data[i].code + "')></a></li>\n" +
                        "                        <li style='padding-left: 15px'><a style='height: 22px' class='detailPos' href=posDetail/" + data[i].code + " target='_blank'></a></li>\n" +
                        "        </li>\n" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "</li>";
                    $(".com1").append(indexPos);
                }
            }
        }
    });
};


/*查询热门机构*/
var getIndexOrgs = function () {
    $.ajax({
        url: "orgsIndexDatas",
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#com2").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var praiseCSS = "";
                    var comment = "";
                    var collectCSS = "";
                    var rindexPercent = data[i].score / 0.05;
                    if (!data[i].praiseFlag) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    if (!data[i].collectFlag) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    if (data[i].commentFlag) {
                        comment = "<button class=\"btn_style\" onclick=\"javascrtpt:window.location.href='remark.jsp'\">写点评</button></span>\n";
                    }
                    var org =
                        "  <li>\n" +
                        "                            <a>\n" +
                        "                                <div class=\"img br_center\">\n" +
                        "                                    <img  src=/hxjob" + data[i].logo + " alt=\"#\">\n" +
                        "                                </div>\n" +
                        "                                <div class=\"info\">\n" +
                        "                                    <div class=\"name br_elli\">\n" +
                        "                                        <button onclick=fullname('" + data[i].code + "')  class=\"btn_style_name\">" + data[i].fullname + "\n" +
                        "                                        </button>\n" +
                        "                                    </div>\n" +
                        "                                    <div class=\"eval\">\n" +
                        "                                        <div class=\"star_nr\"><span class='grade_star_h5' style='left: 557px; top:22px'><i style='width:" + rindexPercent + "%;'></i><em></em></span>薪酬:<i>" + data[i].salary + "</i> K/月\n" +
                        "                                        </div>\n" +
                        comment +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "<div  style='width: 340px'>" + data[i].brief + "</div>" +
                        "                            </a>\n" +
                        "                            <ul class=\"ul_style\">\n" +
                        "                                <li><a class=\"a_li_h5_a\" href='javascrpt:void(0)' " + praiseCSS + " id=p" + data[i].code + " onclick=praise('" + data[i].code + "')></a><span id=praiseCount" + data[i].code + " style='position: relative;left: 230px;top: -31px;font-size: 13px'>" + data[i].praiseCount + "</span>" +
                        "                                </li>\n" +
                        "                                <li style='padding-left: 20px'><a class=\"a_li_h5_b\" href='javascrpt:void(0)' " + collectCSS + " id=c" + data[i].code + "   onclick=collect('" + data[i].code + "')></a><span  id=collectCount" + data[i].code + " style='position: relative;left: 21px;top: -31px;font-size: 10px'>" + data[i].collectCount + "</span>\n" +
                        "                                </li>\n" +
                        "                                <li style='padding-left: 20px'><a class=\"a_li_h5_c\" style=''></a><span style='position: relative;font-size: 10px;left: 21px;top: -31px;'>" + data[i].commontCount + "</span>\n" +
                        "                                </li>\n" +
                        "                            </ul>\n" +
                        "                            <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "                        </li>";
                    $("#com2").append(org);

                }
            }
        }
    })
};


var val = null;
var code = null;
/*新增界面*/
var reply = function (id, nickname, orgcode) {

    $('.account button').attr("value", id);
    val = $('.account button').val();
    $('#getcode').attr("value", orgcode);
    code = $('#getcode').val();
    currentIndex = layer.open({
        type: 1,
        area: ['400px', '280px'],
        shadeClose: false, //点击遮罩关闭
        title: '私信@' + nickname,
        content: $('.account')
    });
    return val;
};
var replyOk = function (val, code) {
    var replyData = $(".replyData").val();
    $.ajax({
        url: path + '/pcviews/replyOk',
        data: {val: val, code: code, replyData: replyData},
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                $("#decEntryId").val(data.id);
                layer.confirm("提交成功", function () {
                        window.location.reload();
                    },
                    function (index) {
                        layer.close(index);
                    });
            } else if (data.code == -1) {
                layer.alert(data.msg);
            } else {
                layer.alert(data.msg);
            }
        }
    })
};


var path = "/hxjob";

/*职业收藏*/
var savePosition = function (code) {
    $.ajax({
        url: path + "/h5views/save/" + code,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                $("#p" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                $("#p" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin2.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    })
};

/*机构点赞验证*/
var praise = function (code) {
    $.ajax({
        url: path + "/h5views/orgPraise/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("praiseCount" + code).innerText;
                document.getElementById("praiseCount" + code).innerText = parseInt(x1) + 1;
                $("#p" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/z2.png)');
                layer.msg(data.msg);

            } else if (data.code == 1) {
                var x2 = document.getElementById("praiseCount" + code).innerText;
                document.getElementById("praiseCount" + code).innerText = parseInt(x2) - 1;
                layer.msg(data.msg);
                $("#p" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/z1.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    });
};
/*机构收藏验证*/
var collect = function (code) {
    $.ajax({
        url: path + "/h5views/orgCollect/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("collectCount" + code).innerText;
                document.getElementById("collectCount" + code).innerText = parseInt(x1) + 1;
                $("#c" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("collectCount" + code).innerText;
                document.getElementById("collectCount" + code).innerText = parseInt(x2) - 1;
                $("#c" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin2.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    });
};
var fullname = function (code) {
    window.location.href = "tocommentlist/" + code;
};


/*点评点赞量*/
var praiseRemark = function (id) {
    $.ajax({
        url: path + "/h5views/praiseRemark/" + id,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                $("#p" + id).css('color', '#fb8341');
                window.location.reload();
            } else if (data.code == 1) {
                $("#p" + id).css('color', '#9f9f9f');
                window.location.reload();
            } else {
                layer.msg(data.msg);
            }
        }
    })
};






