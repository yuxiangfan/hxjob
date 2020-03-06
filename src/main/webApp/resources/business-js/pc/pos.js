var currentDustry = "";
var currentCity = "";
var currentType = "";

$(function () {
    getPoss();

    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    $("#types").find("a").on("click", function () {
        getPoss(currentDustry, currentCity, $(this).attr('val'));
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentType = $(this).attr('val');
    });

    $("#industries").find("a").on("click", function () {
        getPoss($(this).attr('val'), currentCity, currentType);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
    });

    $("#cities").find("a").on("click", function () {
        getPoss(currentDustry, $(this).attr('val'), currentType);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
    });

});


var getPoss = function (industry, city, type) {

    $.ajax({
        url: 'pcviews/posDatas',
        data: {
            "industry": industry, "city": city, "type": type, "searchContent": $("#header-search").val(),
            "searchContentId": $("#header-search").attr("valued")
        },
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#poss").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var rindexPercent = data[i].rindex / 0.05;
                    var pos = "<div class='job_post'>" +
                        "<div class='job_post_tit'>" +
                        "<h2>" +
                        "<i>【" + data[i].organization.cityname + "】</i><a href=pcviews/posDetail/" + data[i].code + " target='_blank'> " + data[i].organization.fullname + " - " + data[i].title + "</a> " +
                        "<span style='float:right;'> " +
                        "<span class='grade_star'><i style='width:" + rindexPercent + "%;'></i></span>（评级）" +
                        "</span>" +
                        "</h2>" +
                        "</div>" +
                        "<div class='job_post_body'>" +
                        data[i].duty +
                        "</div>" +
                        "<div class='job_post_meta'>" +
                        "<p>" +
                        "<span>部门：" + data[i].department + "</span>" +
                        "<span>发布时间：" + data[i].publishtime + "</span>" +
                        "<span style='float:right'><a href=pcviews/posDetail/" + data[i].code + " target='_blank'> ....详情</a></span></p>" +
                        "</div>" +
                        "<div class='clear'></div>" +
                        "</div>";

                    $("#poss").append(pos);
                }
            }
        }
    });

}