var layer;
var laypage;
var path = "/hxjob";
var currentIndex;

$(function () {
    layui.use('layer', function () {
        layer = layui.layer;
    });

    everyoneSay(orgcode);

    layui.use('laypage', function () {
        laypage = layui.laypage;
        getOrgComments();
        getOrgCommentsOnJob();
        getOrgCommentsPractice();
        getOrgCommentsRecommend();
    });

});

var total = 0;
var current = 1;
var currentIndex;
var currPage;

/*全部*/
var getOrgComments = function (curr) {
    var datas = {};
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    datas.page = currPage;

    datas.orgcode = orgcode;

    $.ajax({
        url: path + '/pcviews/orgComments',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $("#comments").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    var org = "  <li class=\"li_home_a\">" +
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
                    $("#comments").append(org);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};


var val = null;

/*新增界面*/
var reply = function (id, nickname) {
    $('.account button').attr("value", id);
    val = $('.account button').val();

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
                layer.confirm("提交成功");
                layer.close(currentIndex);
            }
        }
    })
};


/*毕业生*/
var getOrgCommentsRecommend = function (curr) {

    var datas = {};
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    datas.page = currPage;

    datas.orgcode = orgcode;

    $.ajax({
        url: path + '/pcviews/orgCommentsRecommend',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $("#recommend").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='color:#fb8341'";
                    }
                    var org = "  <li class=\"li_home_a\">" +
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
                    $("#recommend").append(org);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};

/*实习生*/
var getOrgCommentsOnJob = function (curr) {
    var datas = {};
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    datas.page = currPage;

    datas.orgcode = orgcode;

    $.ajax({
        url: path + '/pcviews/orgCommentsOnJob',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $("#onJob").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='color:#fb8341'";
                    }
                    var org = "  <li class=\"li_home_a\">" +
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
                    $("#onJob").append(org);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};

/*培训生*/
var getOrgCommentsPractice = function (curr) {

    var datas = {};
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    datas.page = currPage;

    datas.orgcode = orgcode;

    $.ajax({
        url: path + '/pcviews/orgCommentsPractice',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $("#practice").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='color:#fb8341'";
                    }
                    var org = "  <li class=\"li_home_a\">" +
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
                    $("#practice").append(org);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};


var paging = function (totalCount) {
    laypage.render({
        elem: 'page'
        , count: totalCount
        , limit: 15
        , jump: function (obj, first) {
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数
            console.log(first);
            current = obj.curr;
            //首次不执行
            if (!first) {
                getOrgComments(obj.curr);
            }
        }
    });
};


/*点赞量*/
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


/*大家说*/
var everyoneSay = function (orgcode) {
    $.ajax({
        url: path + "/pcviews/everyoneSay/" + orgcode,
        datatype: "json",
        type: "post",
        success: function (data) {
            $("#everyone_say").html("");
            var everyone_say =
                "<a class=\"option_all a\" href=\"javascript:;\">全部</a>\n" +
                "                            <a class=\"a\" href=\"javascript:;\">有五险一金和其他福利(" + data.otherBenefit + ")</a>\n" +
                $("#everyone_say").append(everyone_say);
        }
    });
};













