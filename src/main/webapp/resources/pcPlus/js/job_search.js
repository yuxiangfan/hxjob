var currentDustry = "";
var currentCity = "";
var currentType = "";

/*初始化*/
var counter = 0; /*计数器*/
var pageStart = 0; /*offset*/
var pageSize = 6; /*size*/

var path = "/hxjob";

$(function () {
    var id = $("#smi").val();
    getPosition(id);
    var posCode = $("#posCode").val();

    getPoss("", "", "", pageStart, pageSize);
    getPossHot("", "", "", pageStart, pageSize);
    getMenJobWhether(posCode);
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    /*点击监听加载更多*/
    $(document).on('click', '.js-load-more', function () {
        counter++;
        pageStart = counter * pageSize;
        /*监听全部*/
        getPoss(currentDustry, currentCity, currentType, pageStart, pageSize);
        /*监听热门*/
        getPossHot(currentDustry, currentCity, currentType, pageStart, pageSize);
    });

    /*监听全部---热度切换*/
    $("#select").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPoss(currentDustry, currentCity, currentType, pageStart, pageSize);
        return counter;
    });
    $("#hot").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPossHot(currentDustry, currentCity, currentType, pageStart, pageSize);
        return counter;
    });

    /*全部*/
    $("#types").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPoss(currentDustry, currentCity, $(this).attr('val'), pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentType = $(this).attr('val');
        return counter;
    });
    $("#industries").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPoss($(this).attr('val'), currentCity, currentType, pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
        return counter;
    });
    $("#cities").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPoss(currentDustry, $(this).attr('val'), currentType, pageStart, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
        return counter;
    });

    /*热门*/
    $("#types").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPossHot(currentDustry, currentCity, $(this).attr('val'), 0, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentType = $(this).attr('val');
        return counter;
    });

    $("#industries").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPossHot($(this).attr('val'), currentCity, currentType, 0, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
        return counter;
    });

    $("#cities").find("a").on("click", function () {
        counter = 0;
        pageStart = 0;
        getPossHot(currentDustry, $(this).attr('val'), currentType, 0, pageSize);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
        return counter;
    });
});

/*职业数据（全部）*/
var getPoss = function (industry, city, type, pageStart, pageSize) {
    $.ajax({
        url: 'posDatas',
        data: {
            "industry": industry, "city": city, "type": type, "searchContent": $("#header-search").val(),
            "searchContentId": $("#header-search").attr("valued"), "pageStart": pageStart, "pageSize": pageSize
        },
        dataType: 'json',
        type: 'post',
        success: function (data) {
            var poss = data.poss;
            sum = data.count;
            $("#poss").html("");
            if (data != null) {
                for (var i = 0; i < data.poss.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!poss[i].collectJob) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                        replaceWith = $("#saveJob").replaceWith("<a>已收藏</a>");
                    }
                    var rindexPercent = poss[i].rindex / 0.05;
                    var pos =
                        " <li class=\"home_con_li home_job\">" +
                        "                <div class=\"h_c_l_wrap \">" +
                        "                    <div>" +
                        "                        <h3 ><a href=posDetail/" + poss[i].code + " target='_blank'>【<span class=\"a_span\">" + poss[i].organization.cityname + "</span>】" + poss[i].organization.fullname + " - " + poss[i].title + "</a></h3>" +
                        "                    </div>" +
                        "                    <div class=\"p_sm\" style='overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + poss[i].organization.brief + "</div>" +
                        "                    <ul class=\"ul_a\">" +
                        "                        <li>" + poss[i].type + "</li>" +
                        "                        <li>" + poss[i].organization.industryname + "</li>" +
                        "                        <li>" + poss[i].department + "</li>" +
                        "                        <li>编号:" + poss[i].code + "</li>" +
                        "                        <li style='position: absolute;left: 487px;'><a class='saveAll' href='javascrpt:void(0)' " + collectCSS + " id=p" + poss[i].code + " onclick=savePosition('" + poss[i].code + "')></a></li>" +
                        "                        <li style='position: absolute;left: 550px;'><a  class='detailPos' href=posDetail/" + poss[i].code + " target='_blank'></a></li>" +
                        "                    </ul>" +
                        "                </div>" +
                        "            </li>";
                    $("#poss").append(pos);
                }
                /*隐藏more*/
                if ((pageStart + pageSize) >= sum || sum == 0) {
                    $(".js-load-more").hide();
                } else {
                    $(".js-load-more").show();
                }
            }
        }
    });
};

/*职业数据（热门）*/
function getPossHot(industry, city, type, pageStart, pageSize) {
    $.ajax({
        url: 'getPossHot',
        data: {
            "industry": industry, "city": city, "type": type, "searchContent": $("#header-search").val(),
            "searchContentId": $("#header-search").attr("valued"), "pageStart": pageStart, "pageSize": pageSize
        },
        dataType: 'json',
        type: 'post',
        success: function (data) {
            var poss = data.possHot;
            sum = data.countHot;
            $("#possHot").html("");
            if (data != null) {
                for (var i = 0; i < data.possHot.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!poss[i].collectJob) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    var rindexPercent = poss[i].rindex / 0.05;
                    var pos =
                        " <li class=\"home_con_li home_job\">" +
                        "                <div class=\"h_c_l_wrap \">" +
                        "                    <div>" +
                        "                        <h3 ><a href=posDetail/" + poss[i].code + " target='_blank'>【<span class=\"a_span\">" + poss[i].organization.cityname + "</span>】" + poss[i].organization.fullname + " - " + poss[i].title + "</a></h3>" +
                        "                    </div>" +
                        "                    <div class=\"p_sm\" style=' overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + poss[i].organization.brief + "</div>" +
                        "                    <ul class=\"ul_a\">" +
                        "                        <li>" + poss[i].type + "</li>" +
                        "                        <li>" + poss[i].organization.industryname + "</li>" +
                        "                        <li>" + poss[i].department + "</li>" +
                        "                        <li>编号:" + poss[i].code + "</li>" +
                        "                        <li style='position: absolute;left: 487px;'><a class='saveAll' href='javascrpt:void(0)' " + collectCSS + " id=pH" + poss[i].code + " onclick=savePositionHot('" + poss[i].code + "')></a></li>" +
                        "                        <li style='position: absolute;left: 550px;'><a class='detailPos' href=posDetail/" + poss[i].code + " target='_blank'></a></li>" +
                        "                    </ul>" +
                        "                </div>" +
                        "            </li>";
                    $("#possHot").append(pos);
                }
                /*隐藏more*/
                if ((pageStart + pageSize) >= sum || sum == 0) {
                    $(".js-load-more").hide();
                } else {
                    $(".js-load-more").show();
                }
            }
        }
    });
}


/*保存职业收藏（全部）*/
var savePosition = function (code) {
    $.ajax({
        url: path + "/pcviews/save/" + code,
        datatype: "json",
        type: "post",
        success: function (data) {
            var id = $("#smi").val();
            getPosition(id);
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

/*保存职业收藏（热门）*/
var savePositionHot = function (code) {
    $.ajax({
        url: path + "/pcviews/save/" + code,
        datatype: "json",
        type: "post",
        success: function (data) {
            var id = $("#smi").val();
            getPosition(id);
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                $("#pH" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin1.png)');
            } else if (data.code == 1) {
                $("#pH" + code).css('background-image', 'url(/hxjob/resources/pcPlus/images/xin2.png)');
            } else {
                layer.msg(data.msg);
            }
        }
    })
};

/*保存职业收藏（详情页）*/
var savePositionDetail = function (code) {
    $.ajax({
        url: path + "/pcviews/save/" + code,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                $("#saveJob").text("收藏");
                window.location.reload();
            } else if (data.code == 1) {
                $("#saveJob").text("已收藏");
                window.location.reload();
            } else {
                layer.msg(data.msg);
            }
        }
    })
};

/*判断是否已经收藏（详情页）*/
var getMenJobWhether = function (poscode) {
    $.ajax({
        url: path + "/pcviews/getMenJobWhether/" + poscode,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (!data.menSaveJob) {
                $("#saveJob").text("已收藏");
            }
        }
    })
};

/*收藏职业信息*/
var getPosition = function (id) {
    $.ajax({
        url: "getPositionSave/" + id,
        datatype: "json",
        type: "post",
        success: function (data) {
            $("#getJob").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var refresh =
                        "<li class=\"home_con_li home_word\">" +
                        " <h4>" +
                        "<i>【" + data[i].city.name + "】</i><a href=posDetail/" + data[i].code + " target='_blank'> " + data[i].organization.fullname + " - " + data[i].title + "</a> " +
                        "</h4>" +
                        " <span> 类型：" + data[i].type +
                        "</span>" +
                        "</p>" +
                        "</li>";
                    $("#getJob").append(refresh);
                }
            }
        }
    })
};









