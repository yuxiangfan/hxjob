var currentDustry = "";
var currentCity = "";
var path = "/smartBR";

/*初始化*/
var counter = 0; /*计数器*/
var pageStart = 0; /*offset*/
var pageSize = 6; /*size*/

$(function () {
    var id = $("#smq").val();

    /*加载触发机构加载*/
    getOrgs("", "", pageStart, pageSize);
    getOrgsHot("", "", pageStart, pageSize);
    orgRefresh(id);
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    /*点击监听加载更多*/
    $(document).on('click', '.js-load-more-org', function () {
        counter++;
        pageStart = counter * pageSize;
        /*监听全部*/
        getOrgs(currentDustry, currentCity, pageStart, pageSize);
        /*监听热门*/
        getOrgsHot(currentDustry, currentCity, pageStart, pageSize);
    });

    /*监听全部---热度切换*/
    $(".select").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgs(currentDustry, currentCity, pageStart, pageSize);
        return counter;
    });
    $(".hot").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgsHot(currentDustry, currentCity, pageStart, pageSize);
        return counter;
    });

    $("#industries").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgs($(this).attr('val'), currentCity, pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
        return counter;
    });
    $("#industries").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgsHot($(this).attr('val'), currentCity, pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
        return counter;
    });

    $("#cities").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgs(currentDustry, $(this).attr('val'), pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
        return counter;
    });
    $("#cities").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getOrgsHot(currentDustry, $(this).attr('val'), pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
        return counter;
    });

});

/*机构点赞计数器(机构)*/
var praise = function (code) {
    $.ajax({
        url: "orgPraise/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("praiseCount" + code).innerText;
                document.getElementById("praiseCount" + code).innerText = parseInt(x1) + 1;
                $("#p" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/z2.png)');
                layer.msg(data.msg);

            } else if (data.code == 1) {
                var x2 = document.getElementById("praiseCount" + code).innerText;
                document.getElementById("praiseCount" + code).innerText = parseInt(x2) - 1;
                layer.msg(data.msg);
                $("#p" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/z1.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    });
};


/*机构收藏计数器（机构）*/
var collect = function (code) {
    $.ajax({
        url: "orgCollect/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            var id = $("#smq").val();
            orgRefresh(id);
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("collectCount" + code).innerText;
                document.getElementById("collectCount" + code).innerText = parseInt(x1) + 1;
                $("#c" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("collectCount" + code).innerText;
                document.getElementById("collectCount" + code).innerText = parseInt(x2) - 1;
                $("#c" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin2.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    });
};


/*热门机构点赞计数器（热门机构）*/
var praiseHot = function (code) {
    $.ajax({
        url: "orgPraise/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("praiseCountHot" + code).innerText;
                document.getElementById("praiseCountHot" + code).innerText = parseInt(x1) + 1;
                $("#pH" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/z2.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("praiseCountHot" + code).innerText;
                document.getElementById("praiseCountHot" + code).innerText = parseInt(x2) - 1;
                layer.msg(data.msg);
                $("#pH" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/z1.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    });
};
/*热门机构收藏计数器 （热门机构）*/
var collectHot = function (code) {
    $.ajax({
        url: "orgCollect/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            var id = $("#smq").val();
            orgRefresh(id);
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                var x1 = document.getElementById("collectCountHot" + code).innerText;
                document.getElementById("collectCountHot" + code).innerText = parseInt(x1) + 1;
                $("#cH" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                var x2 = document.getElementById("collectCountHot" + code).innerText;
                document.getElementById("collectCountHot" + code).innerText = parseInt(x2) - 1;
                $("#cH" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin2.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    });
};

/*机构信息数据*/
var getOrgs = function (industry, city, pageStart, pageSize) {
    $.ajax({
        url: 'orgDatas',
        data: {
            "industry": industry, "city": city, "searchContent": $("#header-search").val(), "pageStart": pageStart, "pageSize": pageSize
        },
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#orgs").html("");
            var orgs = data.orgs;
            sum = data.orgCount;
            if (data != null) {
                for (var i = 0; i < data.orgs.length; i++) {
                    var praiseCSS = "";
                    var comment = "";
                    var collectCSS = "";
                    var rindexPercent = orgs[i].score / 0.05;
                    if (!orgs[i].praiseFlag) {
                        praiseCSS = "style='background-image:url(/smartBR/resources/pcPlus/images/z2.png);'";
                    }
                    if (!orgs[i].collectFlag) {
                        collectCSS = "style='background-image:url(/smartBR/resources/pcPlus/images/xin1.png);'";
                    }
                    if (orgs[i].whetherLogon) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1' onclick='notLog()'>写点评</a></li>";
                    } else if (orgs[i].commentFlag) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn' href=tocomment/" + orgs[i].code + " >写点评</a></li>";
                    } else {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1'  >已点评</a></li>";
                    }
                    var org =
                        " <li class=\"li_home_a\">" +
                        "                <div class=\"hoho\">" +
                        "                    <a class=\"img_a\" href=tocommentlist/" + orgs[i].code + " target=\"_blank\">" +
                        "                        <img class=\"li_images_a\"  src=/smartBR" + orgs[i].logo + " alt=\"#\">" +
                        "                    </a>" +
                        "                    <div class=\"h_c_l_wrap_a\">" +
                        "                        <div class=\"h_c_l_wrap_a_a\">" +
                        "                            <h3><a href=tocommentlist/" + orgs[i].code + " target=\"_blank\">" + orgs[i].fullname + "</a></h3>" +
                        "                            <span  class=\"salary_a\">薪酬:<i>" + orgs[i].salary + "</i>&nbsp;K/月</span>" +
                        "<span class='grade_star' style='left: 557px; top:22px'><i style='width:" + rindexPercent + "%;'></i></span>" +
                        "</span>" +
                        "                        </div>" +
                        "                        <br>" +
                        "                        <div class=\"p_sn_a\" style=' overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + orgs[i].brief +
                        "                        </div>" +
                        "                        <ul style=' margin-left: 150px;' class=\"class_ul_a\">" +
                        "                            <li><a class=\"a_li_z\" href='javascrpt:void(0)' " + praiseCSS + " id=p" + orgs[i].code + " onclick=praise('" + orgs[i].code + "')></a><span id=praiseCount" + orgs[i].code + " style='position: relative;left: 300px;top: -17px;font-size: 13px'>" + orgs[i].praiseCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a class=\"a_li_sc\" href='javascrpt:void(0)' " + collectCSS + " id=c" + orgs[i].code + "   onclick=collect('" + orgs[i].code + "')></a><span id=collectCount" + orgs[i].code + " style='position: relative;left: 31px;top: -17px;font-size: 13px'>" + orgs[i].collectCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a href=tocommentlist/" + orgs[i].code + " class=\"a_li_dp\" style=''></a><span style='position: relative;font-size: 13px;left: 31px;top: -17px;'>" + orgs[i].commontCount + "</span></li>" +
                        comment +
                        "                        </ul>" +
                        "                    </div>" +
                        "                </div>" +
                        "            </li>";
                    $("#orgs").append(org);
                }
                /*隐藏more*/
                if ((pageStart + pageSize) >= sum || sum == 0) {
                    $(".js-load-more-org").hide();
                } else {
                    $(".js-load-more-org").show();
                }
            }
        }
    });
};


/*热门机构信息数据*/
var getOrgsHot = function (industry, city, pageStart, pageSize) {
    $.ajax({
        url: 'getOrgsHot',
        data: {"industry": industry, "city": city, "pageStart": pageStart, "pageSize": pageSize},
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#orgsHot").html("");
            var orgsHot = data.orgsHot;
            sum = data.countOrgHot;
            if (data != null) {
                for (var i = 0; i < data.orgsHot.length; i++) {
                    var praiseCSS = "";
                    var comment = "";
                    var collectCSS = "";
                    var rindexPercent = orgsHot[i].score / 0.05;
                    if (!orgsHot[i].praiseFlag) {
                        praiseCSS = "style='background-image:url(/smartBR/resources/pcPlus/images/z2.png);'";
                    }
                    if (!orgsHot[i].collectFlag) {
                        collectCSS = "style='background-image:url(/smartBR/resources/pcPlus/images/xin1.png);'";
                    }
                    if (orgsHot[i].whetherLogon) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1' onclick='notLog()'>写点评</a></li>";
                    } else if (orgsHot[i].commentFlag) {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn' href=tocomment/" + orgsHot[i].code + " >写点评</a></li>";
                    } else {
                        comment = "<li style='padding-left: 25px'><a class='btn_btn1'  >已点评</a></li>";
                    }
                    var org =
                        " <li class=\"li_home_a\">" +
                        "                <div class=\"hoho\">" +
                        "                    <a class=\"img_a\" href=tocommentlist/" + orgsHot[i].code + " target=\"_blank\">" +
                        "                        <img class=\"li_images_a\" src=/smartBR" + orgsHot[i].logo + " alt=\"#\">" +
                        "                    </a>" +
                        "                    <div class=\"h_c_l_wrap_a\">" +
                        "                        <div class=\"h_c_l_wrap_a_a\">" +
                        "                            <h3><a href=tocommentlist/" + orgsHot[i].code + " target=\"_blank\">" + orgsHot[i].fullname + "</a></h3>" +
                        "                            <span  class=\"salary_a\">薪酬:<i>" + orgsHot[i].salary + "</i>&nbsp;K/月</span>" +
                        "<span class='grade_star' style='left: 557px; top:22px'><i style='width:" + rindexPercent + "%;'></i></span>" +
                        "</span>" +
                        "                        </div>" +
                        "                        <br>" +
                        "                        <div class=\"p_sn_a\" style=' overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + orgsHot[i].brief +
                        "                        </div>" +
                        "                        <ul style=' margin-left: 150px;' class=\"class_ul_a\">" +
                        "                            <li><a class=\"a_li_z\" href='javascrpt:void(0)' " + praiseCSS + " id=pH" + orgsHot[i].code + " onclick=praiseHot('" + orgsHot[i].code + "')></a><span id=praiseCountHot" + orgsHot[i].code + " style='position: relative;left: 300px;top: -17px;font-size: 13px'>" + orgsHot[i].praiseCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a class=\"a_li_sc\" href='javascrpt:void(0)' " + collectCSS + " id=cH" + orgsHot[i].code + "   onclick=collectHot('" + orgsHot[i].code + "')></a><span id=collectCountHot" + orgsHot[i].code + " style='position: relative;left: 31px;top: -17px;font-size: 13px'>" + orgsHot[i].collectCount + "</span></li>" +
                        "                            <li style='padding-left: 25px'><a class=\"a_li_dp\" style=''></a><span style='position: relative;font-size: 13px;left: 31px;top: -17px;'>" + orgsHot[i].commontCount + "</span></li>" +
                        comment +
                        "                        </ul>" +
                        "                    </div>" +
                        "                </div>" +
                        "            </li>";
                    $("#orgsHot").append(org);
                }
                /*隐藏more*/
                if ((pageStart + pageSize) >= sum || sum == 0) {
                    $(".js-load-more-org").hide();
                } else {
                    $(".js-load-more-org").show();
                }
            }
        }
    });
};

/*未登录判断*/
function notLog() {
    layer.msg("请您先登录，再评论");
}


/*我的收藏*/
var orgRefresh = function (id) {
    $.ajax({
        url: "orgRefresh/" + id,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else {
                $("#refresh").html("");
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var refresh =
                            "<li class=\"home_con_li home_word\">" +
                            " <h4><a href=tocommentlist/" + data[i].code + " target=\"_blank\">" + data[i].fullname + "</a></h4>" +
                            " <p>酬薪：" + data[i].salary + "K&nbsp;&nbsp;" +
                            " <span> 综合评分：" + data[i].score +
                            "</span></p>" +
                            "</li>";
                        $("#refresh").append(refresh);
                    }
                }
            }
        }
    })
};

