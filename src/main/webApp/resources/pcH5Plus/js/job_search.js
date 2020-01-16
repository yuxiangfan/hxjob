var currentDustry = "";
var currentCity = "";
var currentType = "";
var Job = "";
var path = "/smartBR";
$(function () {

    var id = $("#smi").val();
    getPoss();
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    /*全部*/
    $("#types").find("a").on("click", function () {
        getPoss(currentDustry, currentCity, $(this).attr('val'));
        $(this).css("color", "#fb8341").siblings().css("color", "#666");
        currentType = $(this).attr('val');
    });

    $("#industries").find("a").on("click", function () {
        getPoss($(this).attr('val'), currentCity, currentType);
        $(this).css("color", "#fb8341").siblings().css("color", "#666");
        currentDustry = $(this).attr('val');
    });

    $("#cities").find("a").on("click", function () {
        getPoss(currentDustry, $(this).attr('val'), currentType);
        $(this).css("color", "#fb8341").siblings().css("color", "#666");
        currentCity = $(this).attr('val');
    });
});


var getPoss = function (industry, city, type) {

    $.ajax({
        url: 'posDatas',
        data: {"industry": industry, "city": city, "type": type, 'searchContent': $("#searchContent").val()},
        dataType: 'json',
        type: 'post',
        success: function (data) {

            $("#poss").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!data[i].collectJob) {
                        collectCSS = "style='background-image:url(/smartBR/resources/pcPlus/images/xin1.png);'";
                    }
                    Job = data[i].collectJob;
                    var rindexPercent = data[i].rindex / 0.05;

                    var pos =
                        "  <li>\n" +
                        "                            <div class=\"info\" style=\"margin-left: 0px;\">\n" +
                        "                                <div class=\"name br_elli\" style=\"width: 100%;margin-left: -7px;margin-bottom: 5px;\">\n" +
                        "                                    <a href='posd/" + data[i].code + "'\n" +
                        "                                       style=\"padding: 0px!important;color: #2c84cc;font-weight: bold;\">【<span\n" +
                        "                                           class=\"a_span\">" + data[i].organization.cityname +
                        "</span>】" + data[i].organization.fullname + " - " + data[i].title +
                        "</a>\n" +
                        "                                </div>\n" +
                        "                                <p>\n" + data[i].organization.brief +
                        "                                </p>\n" +
                        "                            </div>\n" +
                        "                            <ul class=\"ul_style\">\n" +
                        "                                <li style=\"margin-right: 5px\">" + data[i].type + "</li>\n" +
                        "                                <li style=\"margin-right: 5px\">" + data[i].organization.industryname + "</li>\n" +
                        "                                <li style=\"margin-right: 5px\">" + " 编号:" + data[i].code + "</li>\n" +
                        "                        <li style=\"margin-left: 130px\"><a class='saveAll' href='javascrpt:void(0)' " + collectCSS + " id=p" + data[i].code + " onclick=savePosition('" + data[i].code + "')></a></li>\n" +
                        "                        <li style='padding-left: 15px'><a  class='detailPos' href=posDetail/" + data[i].code + " target='_blank'></a></li>\n" +
                        "                            </ul>\n" +
                        "                            <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\">\n" +
                        "\n" +
                        "                            </div>\n" +
                        "                        </li>";
                    $("#poss").append(pos);
                }
            }
            return Job;
        }
    });
};


var savePosition = function (code) {
    $.ajax({
        url: path + "/h5views/save/" + code,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (!Job) {
                $("#saveJob>a").replaceWith("<a>已收藏</a>");
            }
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                $("#p" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin1.png)');
                layer.msg(data.msg);
            } else if (data.code == 1) {
                $("#p" + code).css('background-image', 'url(/smartBR/resources/pcPlus/images/xin2.png)');
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    })
};









