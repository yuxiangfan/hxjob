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
        url: path + '/h5views/orgComments',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $(".com").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var praiseCSS = "";
                    var rindexPercent = rows[i].satisfaction / 0.05;
                    if (!rows[i].whetherRemark) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    var org =
                        "<li>\n" +
                        "    <a>\n" +
                        "        <div class=\"img br_center\">\n" +
                        "            <img class=\"img_tx_style\" src=/hxjob" + rows[i].headPhoto + ">\n" +
                        "        </div>\n" +
                        "        <div class=\"info\">\n" +
                        "            <div class=\"name br_elli\" style=\"margin-top: 10px\">"+rows[i].nickname+"\n" +
                        "                <button style=\"border: none;color: white;background-color: #f0ad4e;\">" + rows[i].postStatus + rows[i].workyear + "年" + "</button>\n" +
                        "            </div>\n" +

                        "\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div style=\"position: relative;margin-bottom: 14px\">\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div>\n" +
                        "            <div>"+rows[i].writingEvaluation+"" +
                        "\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </a>\n" +
                        "    <ul class=\"ul_style\">" +
                        "        <li style=\"color: #1b6d85\">"+ rows[i].fullname +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a><span style='position: relative;font-size: 13px;left: 301px;top: -15px;'>" + rows[i].remarkCount + "</span></li>" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "</li>";
                    $(".com").append(org);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};


/*推荐*/
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
        url: path + '/h5views/orgCommentsRecommend',
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
                    var org =
                        "<li>\n" +
                        "    <a>\n" +
                        "        <div class=\"img br_center\">\n" +
                        "            <img class=\"img_tx_style\" src=/hxjob" + rows[i].headPhoto + ">\n" +
                        "        </div>\n" +
                        "        <div class=\"info\">\n" +
                        "            <div class=\"name br_elli\" style=\"margin-top: 10px\">"+rows[i].nickname+"\n" +
                        "                <button style=\"border: none;color: white;background-color: #f0ad4e;\">" + rows[i].postStatus + rows[i].workyear + "年" + "</button>\n" +
                        "            </div>\n" +

                        "\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div style=\"position: relative;margin-bottom: 14px\">\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div>\n" +
                        "            <div>"+rows[i].writingEvaluation+"" +
                        "\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </a>\n" +
                        "    <ul class=\"ul_style\">\n" +
                        "        <li style=\"color: #1b6d85\">"+ rows[i].fullname +
                        "</li>" +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a><span style='position: relative;font-size: 13px;left: 301px;top: -15px;'>" + rows[i].remarkCount + "</span></li>" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
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

/*在职*/
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
        url: path + '/h5views/orgCommentsOnJob',
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
                    var org =
                        "<li>\n" +
                        "    <a>\n" +
                        "        <div class=\"img br_center\">\n" +
                        "            <img class=\"img_tx_style\" src=/hxjob" + rows[i].headPhoto + ">\n" +
                        "        </div>\n" +
                        "        <div class=\"info\">\n" +
                        "            <div class=\"name br_elli\" style=\"margin-top: 10px\">"+rows[i].nickname+"\n" +
                        "                <button style=\"border: none;color: white;background-color: #f0ad4e;\">" + rows[i].postStatus + rows[i].workyear + "年" + "</button>\n" +
                        "            </div>\n" +

                        "\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div style=\"position: relative;margin-bottom: 14px\">\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div>\n" +
                        "            <div>"+rows[i].writingEvaluation+"" +
                        "\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </a>\n" +
                        "    <ul class=\"ul_style\">\n" +
                        "        <li style=\"color: #1b6d85\">"+ rows[i].fullname +
                        "</li>\n" +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a><span style='position: relative;font-size: 13px;left: 301px;top: -15px;'>" + rows[i].remarkCount + "</span></li>" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
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

/*实习*/
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
        url: path + '/h5views/orgCommentsPractice',
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
                    var org =
                        "<li>\n" +
                        "    <a>\n" +
                        "        <div class=\"img br_center\">\n" +
                        "            <img class=\"img_tx_style\" src=/hxjob" + rows[i].headPhoto + ">\n" +
                        "        </div>\n" +
                        "        <div class=\"info\">\n" +
                        "            <div class=\"name br_elli\" style=\"margin-top: 10px\">"+rows[i].nickname+"\n" +
                        "                <button style=\"border: none;color: white;background-color: #f0ad4e;\">" + rows[i].postStatus + rows[i].workyear + "年" + "</button>\n" +
                        "            </div>\n" +

                        "\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div style=\"position: relative;margin-bottom: 14px\">\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div>\n" +
                        "            <div>"+rows[i].writingEvaluation+"" +
                        "\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </a>\n" +
                        "    <ul class=\"ul_style\">\n" +
                        "        <li style=\"color: #1b6d85\">"+ rows[i].fullname +
                        "</li>\n" +
                        " <li><a class='a_li_z' " + praiseCSS + " id=p" + rows[i].id + " onclick=praiseRemark('" + rows[i].id + "')></a><span style='position: relative;font-size: 13px;left: 301px;top: -15px;'>" + rows[i].remarkCount + "</span></li>" +
                        "    </ul>\n" +
                        "    <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
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
                layer.confirm("提交成功", function () {
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


/*大家说*/
var everyoneSay = function (orgcode) {
    $.ajax({
        url: path + "/h5views/everyoneSay/" + orgcode,
        datatype: "json",
        type: "post",
        success: function (data) {
            $("#ul_style").html("");
            var everyone_say =
                "                <li style=\"color: #7cb228\">全部</li>\n" +
                "                <li style=\"color: #7cb228\">有五险一金和其他福利(" + data.otherBenefit + ")</li>\n" +
                "                <li style=\"color: #7cb228\">成长快，欢迎大家加入(" + data.growth + ")</a></li>\n" +
                "                <li style=\"color: #7cb228\">非常清闲，有下午茶(" + data.workload + ")</li>\n" +
                "                <li style=\"color: #7cb228;margin-left: 48px;\">氛围极好(" + data.culturalContext + ")</li>\n" +
                "                <li style=\"color: #7cb228\">" + data.evaluateLabel + "</li>\n";
            $("#ul_style").append(everyone_say);
        }
    });
};













