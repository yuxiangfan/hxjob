var currentDustry = "";
var currentCity = "";

$(function () {
    getOrgs();

    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    $("#industries").find("a").on("click", function () {
        getOrgs($(this).attr('val'), currentCity);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
    });

    $("#cities").find("a").on("click", function () {
        getOrgs(currentDustry, $(this).attr('val'));
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
    });
});

var praise = function (code) {

    $.ajax({
        url: "pcviews/orgPraise/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                layer.msg(data.msg);
            } else if (data.code == 1) {
                layer.msg(data.msg);
            } else {
                layer.msg(data.msg);
            }
        }
    });
}

var collect = function (code) {

    $.ajax({
        url: "pcviews/orgCollect/" + code,
        dataType: "json",
        type: 'post',
        success: function (data) {
            if (data.code == -9) {
                window.location.href = "pcm/login";
            } else if (data.code == 0) {
                $("#c" + code).css('color', '#fb8341');
            } else if (data.code == 1) {
                $("#c" + code).css('color', '#9f9f9f');
            } else {
                layer.msg(data.msg);
            }
        }
    });

}

var getOrgs = function (industry, city) {

    $.ajax({
        url: 'orgDatas',
        data: {"industry": industry, "city": city},
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#orgs").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var praiseCSS = "";
                    var comment = "";
                    var collectCSS = "";
                    if (!data[i].praiseFlag) {
                        praiseCSS = "style='color:#fb8341'";
                    }
                    if (!data[i].collectFlag) {
                        collectCSS = "style='color:#fb8341'";
                    }
                    if (data[i].commentFlag) {
                        comment = "<a href=pcviews/tocomment/" + data[i].code + " >写点评</a> </span></p>";
                    }

                    var org = "<div class='information' style='' >" +
                        "<div class='information_img'>" +
                        "<img style='height: 100%;width: 100%;' src=" + imagePath + data[i].logo + " />" +
                        "</div>" +
                        "<div class='information_post'>" +
                        "<div class='information_head'>" +
                        "<a class='h1' href=pcviews/tocommentlist/" + data[i].code + ">" + data[i].fullname + "</a>" +
                        "<span> 平均薪酬：" + data[i].salary + "/月&nbsp&nbsp&nbsp&nbsp;综合评分：" + data[i].score + "分</span>" +
                        "</div>" +
                        "<div class='information_body'>" +
                        "<p>标签：" + data[i].tags + "</p>" +
                        "</div>" +
                        "<div class='information_footer'>" +
                        "<p style='font-size:12px'>行业：" + data[i].industryname + " &nbsp;&nbsp;贝睿评级：" + data[i].grade + "级 &nbsp;&nbsp;点评数据（" + data[i].commontCount + "条）" +
                        "<span style='float:right'>" +
                        "<a href='javascrpt:void(0)' " + praiseCSS + " id=p" + data[i].code + " onclick=praise('" + data[i].code + "')>赞</a> &nbsp;&nbsp;" +
                        "<a href='javascrpt:void(0)' " + collectCSS + " id=c" + data[i].code + " onclick=collect('" + data[i].code + "')>收藏</a> &nbsp;&nbsp;" +
                        comment +
                        "</div>" +
                        "</div>" +
                        "</div>";
                    $("#orgs").append(org);
                }
            }
        }
    });

}