var currentDustry = "";
var currentCity = "";

$(function () {
    var id = $("#smq").val();
    getOrgsHot();

    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });

    $("#industries").find("a").on("click", function () {
        getOrgsHot($(this).attr('val'), currentCity);
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentDustry = $(this).attr('val');
    });

    $("#cities").find("a").on("click", function () {
        getOrgsHot(currentDustry, $(this).attr('val'));
        $(this).css("color", "#fb8341").siblings().css("color", "#9f9f9f");
        currentCity = $(this).attr('val');
    });

});

var writeRemark = function (code) {
    window.location.href = "tocomment/" + code;
};

/*机构点赞验证*/
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
/*用户机构收藏验证*/
var collect = function (code) {
    $.ajax({
        url: "orgCollect/" + code,
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

/*获得机构*/
var getOrgsHot = function (industry, city) {
    $.ajax({
        url: 'getH5Org',
        data: {"industry": industry, "city": city},
        dataType: 'json',
        type: 'post',
        success: function (data) {
            $("#orgsHot").html("");
            var orgs = data.orgs;
            if (orgs != null) {
                for (var i = 0; i < orgs.length; i++) {
                    var praiseCSS = "";
                    var comment = "";
                    var collectCSS = "";
                    var rindexPercent = orgs[i].score / 0.05;
                    if (!orgs[i].praiseFlag) {
                        praiseCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/z2.png);'";
                    }
                    if (!orgs[i].collectFlag) {
                        collectCSS = "style='background-image:url(/hxjob/resources/pcPlus/images/xin1.png);'";
                    }
                    if (orgs[i].commentFlag) {
                        comment = " <span style='position: absolute;right: 20px;'><button onclick=writeRemark('" + orgs[i].code + "') class='btn_style'>写点评</button></span>";
                    }

                    var org =
                        "  <li>\n" +
                        "                            <a>\n" +
                        "                                <div class=\"img br_center\">\n" +
                        "                                    <img  src=/hxjob" + orgs[i].logo + " alt=\"#\">\n" +
                        "                                </div>\n" +
                        "                                <div class=\"info\">\n" +
                        "                                    <div class=\"name br_elli\">\n" +
                        "                                        <button onclick=fullname('" + orgs[i].code + "')  class=\"btn_style_name\">" + orgs[i].fullname + "\n" +
                        "                                        </button>\n" +
                        "                                    </div>\n" +
                        "                                    <div class=\"eval\">\n" +
                        "                                        <div class=\"star_nr\"><span class='grade_star_h5' style='left: 557px; top:22px'><i style='width:" + rindexPercent + "%;'></i><em></em></span>薪酬:<i>" + orgs[i].salary + "</i> K/月\n" +
                        "                                        </div>\n" +
                        comment +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "<div  style='overflow: hidden;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;height: 37px;text-indent: 2em;text-overflow: ellipsis;'>" + orgs[i].brief + "</div>" +
                        "                            </a>\n" +
                        "                            <ul class=\"ul_style\">\n" +
                        "                                <li><a class=\"a_li_h5_a\" href='javascrpt:void(0)' " + praiseCSS + " id=p" + orgs[i].code + " onclick=praise('" + orgs[i].code + "')></a><span id=praiseCount" + orgs[i].code + " style='position: relative;left: 230px;top: -31px;font-size: 13px'>" + orgs[i].praiseCount + "</span>" +
                        "                                </li>\n" +
                        "                                <li style='padding-left: 20px'><a class=\"a_li_h5_b\" href='javascrpt:void(0)' " + collectCSS + " id=c" + orgs[i].code + "   onclick=collect('" + orgs[i].code + "')></a><span id=collectCount" + orgs[i].code + " style='position: relative;left: 21px;top: -31px;font-size: 10px'>" + orgs[i].collectCount + "</span>\n" +
                        "                                </li>\n" +
                        "                                <li style='padding-left: 20px'><a class=\"a_li_h5_c\" style=''></a><span style='position: relative;font-size: 10px;left: 21px;top: -31px;'>" + orgs[i].commontCount + "</span>\n" +
                        "                                </li>\n" +
                        "                            </ul>\n" +
                        "                            <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "                        </li>";
                    $("#orgsHot").append(org);
                }
            }
        }
    });
};


var fullname = function (code) {
    window.location.href = "tocommentlist/" + code;
};


