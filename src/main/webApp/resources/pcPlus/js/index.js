$(function () {
    getIndexPoss();
    getIndexOrgs();
    newAdvice();
    getIndexHot();
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
});

/*热门职业数据（首页）*/
var getIndexPoss = function () {
    $.ajax({
        url: 'posIndexDatas',
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#getIndexPoss").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!data[i].collectJob) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    var rindexPercent = data[i].rindex / 0.05;
                    var indexPos =
                        " <li class=\"home_con_li home_job\">" +
                        "                <div class=\"h_c_l_wrap \">" +
                        "                    <div>" +
                        "                        <h3 ><a href=posDetail/" + data[i].code + " target='_blank'>【<span class=\"a_span\">" + data[i].organization.cityname + "</span>】" + data[i].organization.fullname + " - " + data[i].title + "</a></h3>" +
                        "                    </div>" +
                        "                    <div class=\"p_sm\" style='overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + data[i].organization.brief + "</div>" +
                        "                    <ul class=\"ul_a\">" +
                        "                        <li>" + data[i].type + "</li>" +
                        "                        <li>" + data[i].organization.industryname + "</li>" +
                        "                        <li>" + data[i].department + "</li>" +
                        "                        <li>编号:" + data[i].code + "</li>" +
                        "                        <li style='position: absolute;left: 487px;'><a class='saveAll' href='javascrpt:void(0)' " + collectCSS + " id=p" + data[i].code + " onclick=savePosition('" + data[i].code + "')></a></li>" +
                        "                        <li style='position: absolute;left: 550px;'><a class='detailPos' href=posDetail/" + data[i].code + " target='_blank'></a></li>" +
                        "                    </ul>" +
                        "                </div>" +
                        "            </li>";
                    $("#getIndexPoss").append(indexPos);
                }
            }
        }
    });
};

/*机构点赞计数器 （首页）*/
var praiseIndex = function (code) {
    $.ajax({
        url: "orgPraise/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("praiseIndex" + code).innerText;
                document.getElementById("praiseIndex" + code).innerText = parseInt(x1) + 1;
                $("#px" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/z2.png)');
                layer.msg(data.msg);

            } else if (data.code == 1) {
                var x2 = document.getElementById("praiseIndex" + code).innerText;
                document.getElementById("praiseIndex" + code).innerText = parseInt(x2) - 1;
                layer.msg(data.msg);
                $("#px" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/z1.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    });
};
/*机构收藏计数器（首页）*/
var collectIndex = function (code) {
    $.ajax({
        url: "orgCollect/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("collectIndex" + code).innerText;
                document.getElementById("collectIndex" + code).innerText = parseInt(x1) + 1;
                $("#cx" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("collectIndex" + code).innerText;
                document.getElementById("collectIndex" + code).innerText = parseInt(x2) - 1;
                $("#cx" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin2.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    });
};


/*热门机构数据 （首页）*/
var getIndexOrgs = function () {
    $.ajax({
        url: "orgsIndexDatas",
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#getIndexOrgs").html("");
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
                    if (data[i].whetherLogon) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1' onclick='notLog()'>写点评</a></li>";
                    } else if (data[i].commentFlag) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn' href=tocomment/" + data[i].code + " >写点评</a></li>";
                    } else {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1'  >已点评</a></li>";
                    }
                    var org =
                        " <li class=\"li_home_a\">" +
                        "                <ul class=\"hoho\">" +
                        "                <li>" +
                        "                    <a class=\"img_a\" href=tocommentlist/" + data[i].code + " target=\"_blank\">" +
                        "                        <img class=\"li_images_a\"  src=/hxjob" + data[i].logo + " alt=\"#\">" +
                        "                    </a>" +
                        "                        </li>" +
                        "                <li>" +
                        "<span>" +
                        "<a href=tocommentlist/" + data[i].code + " target=\"_blank\">" + data[i].fullname + "</a>" +
                        "<span class='grade_star'><i style='width:" + rindexPercent + "%;'></i></span>" +
                        "</span>" +
                        "</li>" +
                        " <li style='float: right'>" +
                        "<span   class=\"salary_a\">薪酬:<i>" + data[i].salary + "</i>&nbsp;K/月</span>" +
                        "                        </li>" +
                        "                        </ul>" +
                        "                        <br>" +
                        "                        <div class=\"p_sn_a\" style=' overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + data[i].brief +
                        "                        </div>" +
                        "                        <ul class='p_sn_f'>" +
                        "                            <li><a class=\"a_li_z\" href='javascrpt:void(0)' " + praiseCSS + " id=p" + data[i].code + " onclick=praise('" + data[i].code + "')></a><span id=praiseCount" + data[i].code + " style='position: relative;top: -17px;left:21px;'>" + data[i].praiseCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a class=\"a_li_sc\" href='javascrpt:void(0)' " + collectCSS + " id=c" + data[i].code + "   onclick=collect('" + data[i].code + "')></a><span id=collectCount" + data[i].code + " style='position: relative;top: -16px;left:30px;'>" + data[i].collectCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a href=tocommentlist/" + data[i].code + " class=\"a_li_dp\" style=''></a><span style='position: relative;left: 30px;top: -17px;'>" + data[i].commontCount + "</span></li>" +
                        comment +
                        "                        </ul>" +
                        "            </li>";
                    $("#getIndexOrgs").append(org);

                }
            }
        }
    })
};


/*热门点评数据 （首页）*/
var getIndexHot = function () {
    $.ajax({
        url: "getIndexRemark",
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $(".remarkHot").html("");
            if (data != null) {
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    var remark =
                        "  <li class=\"li_home_a\">" +
                        "<ul class=\"comment\">" +
                        "<li style='float: left;border-right: 1px solid #e7e7e7;'>" +
                        " <a class=\"comment_1\" target=\"_blank\">" +
                        " <img class=\"li_images_a_a\" src=/hxjob" + rows[i].headPhoto + " alt=\"#\">" +
                        "<a style='display:block'>" + rows[i].nickname + "</a>" +
                        " </a>" +
                        "<span class='grade_star' style='position: relative;top: -59px;left: 56px'><i style='width:" + rindexPercent + "%;'></i></span>" +
                        "  <span style='position: relative; right: 32px; top: -40px;' class=\"span_a\">" + rows[i].postStatus + rows[i].workyear + "年" + "</span>" +
                        "</li>" +
                        "<p style='height: 75px'>" + rows[i].writingEvaluation +
                        "</p>" +
                        " <ul class=\"class_ul_a\" style='position: relative;'>" +
                        "  <li style=\"color: #1b6d85\">" + rows[i].fullname +
                        "</li>" +
                        "  <li class=\"li_xz\">" + rows[i].createtime +
                        "</li>" +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a>" +
                        "<a id=remarkCount" + rows[i].id + " style='position: relative;left: 20px;top: -11px'>" + rows[i].remarkCount + "</a></li>" +
                        "<li>" +
                        " <button class=\"btn_btn_sx\" onclick=reply('" + rows[i].id + "','" + rows[i].nickname + "')>写私信</button>" +
                        "</li>" +
                        "  </ul>" +
                        "  </div>" +
                        "  </li>" +
                        "</li>";
                    $(".remarkHot").append(remark);
                }
            }
        }
    })
};
var val = null;
var code = null;

/*新增私信界面*/
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
/*私信提交*/
var replyOk = function (val, code) {
    var replyData = $(".replyData").val();
    if (replyData == "" || replyData == undefined || replyData == null) {
        layer.msg("亲，请先写点你想说的吧");
    } else {
        $.ajax({
            url: path + '/pcviews/replyOk',
            data: {val: val, code: code, replyData: replyData},
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == 0) {
                    $("#decEntryId").val(data.id);
                    layer.confirm("提交成功");
                    layer.close(currentIndex);
                } else {
                    layer.msg(data.msg);
                }
            }
        })
    }

};

/*热门点评 点赞量*/
var praiseRemark = function (id) {
    $.ajax({
        url: path + "/pcviews/praiseRemark/" + id,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("remarkCount" + id).innerText;
                document.getElementById("remarkCount" + id).innerText = parseInt(x1) + 1;
                $("#p" + id).css('background-image', 'url(/hxjob/resources/pcPlus/images/z2.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("remarkCount" + id).innerText;
                document.getElementById("remarkCount" + id).innerText = parseInt(x2) - 1;
                $("#p" + id).css('background-image', 'url(/hxjob/resources/pcPlus/images/z1.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    })
};

/*未登录判断*/
function notLog() {
    layer.msg("请您先登录，再评论");
}

/*热门校园杂志*/
var newAdvice = function () {
    $.ajax({
        url: "indexNewAdvices",
        dataType: 'json',
        type: 'post',
        success: function (data) {

            $(".newAdvice").html("");

            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var br =
                        " <li class=\"home_con_li home_word\">" +
                        " <h4><a href= /hxjob/pcviews/toAdviceDetails/" + data[i].id + " target=\"_blank\">" + data[i].title +
                        "</a></h4>" +
                        " <p>" + data[i].content +
                        "</p>" +
                        "<ul class='newAdviceList'>" +
                        "  <li><a class=\"hyjd\" href=/hxjob/pcviews/toAdviceList/" + data[i].cid + ">" + data[i].title1 + "&nbsp;&nbsp;" + "[" + data[i].nature + "]</a></li>" +
                        "                        <li>" + "&nbsp;&nbsp;" + data[i].original + "</li>" +
                        "                        <li>" + "&nbsp;&nbsp;" + data[i].publishtime + "</li>" +
                        "</ul>" +
                        "  </li>";
                    $(".newAdvice").append(br);
                }
            }
        }

    })
};


//详情加字符缩进加展开

/*
    var contenta = $(".p_sn_a p").text();
    console.log(contenta);
    var strana = contenta.substr(0,80);
    console.log(strana);
    $(".p_sn_a p").html(strana+"<span style='color: rgb(44,132,204)'>点击展开</span>");

    $(".p_sn_a p").click(function () {
        if(index==false) {
            $(".p_sn_a p").html(contenta+"<span style='color: rgb(44,132,204)'>收缩</span>");
            index=true;
        }else{
            $(".p_sn_a p").html(strana + "<span style='color: rgb(44,132,204)'>点击展开</span>");
            index=false;
        }
    });
*/










