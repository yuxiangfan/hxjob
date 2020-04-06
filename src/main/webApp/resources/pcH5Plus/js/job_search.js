var currentDustry = "";
var currentCity = "";
var currentType = "";
var Job = "";
var path = "/hxjob";
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
            var poss = data.poss;
            $("#poss").html("");
            if (poss != null) {
                for (var i = 0; i < data.poss.length; i++) {
                    /*验证收藏状态*/
                    var collectCSS = "";

                    if (!poss[i].collectJob) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    Job = poss[i].collectJob;
                    var rindexPercent = poss[i].rindex / 0.05;

                    var pos =
                        "  <li>\n" +
                        "                            <div class=\"info\" style=\"margin-left: 0px;\">\n" +
                        "                                <div class=\"name br_elli\" style=\"width: 100%;margin-left: -7px;margin-bottom: 5px;\">\n" +
                        "                                    <a href='posd/" + poss[i].code + "'\n" +
                        "                                       style=\"padding: 0px!important;color: #2c84cc;font-weight: bold;\">【<span\n" +
                        "                                           class=\"a_span\">" + poss[i].organization.cityname +
                        "</span>】" + poss[i].organization.fullname + " - " + poss[i].title +
                        "</a>\n" +
                        "                                </div>\n" +
                        "                                <p style='overflow: hidden;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;height: 37px;text-indent: 2em;text-overflow: ellipsis;'>\n" + poss[i].posBrief +
                        "                                </p>\n" +
                        "                            </div>\n" +
                        "                            <ul class=\"ul_style\">\n" +
                        "                                <li style=\"margin-right: 5px\">" + poss[i].type + "</li>\n" +
                        "                                <li style=\"margin-right: 5px\">" + poss[i].organization.industryname + "</li>\n" +
                        "                                <li style=\"margin-right: 5px\">" + " 编号:" + poss[i].code + "</li>\n" +
                        "                        <li style=\"margin-left: 110px\"><a class='saveAll' href='javascrpt:void(0)' " + collectCSS + " id=p" + poss[i].code + " onclick=savePosition('" + poss[i].code + "')></a></li>\n" +
                        "                        <li style='padding-left: 15px'><a  class='detailPos' href=posDetail/" + poss[i].code + " target='_blank'></a></li>\n" +
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









