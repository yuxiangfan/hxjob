$(function () {
    var id = $("#ac").val();
    newList(id);

    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });


});

/*获得对应所属的新闻列表信息*/
var newList = function (id) {
    $.ajax({
        url: '/pcviews/goodsList/' + id,
        dataType: "json",
        type: 'post',
        success: function (data) {
            $("#goods_list").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    if (!data[i].whetherAttention) {
                        $("#attention>a").replaceWith("<a>取消关注</a>");
                    }
                    var list =
                        "<li class=\"home_con_li\">" +
                        " <a href=\"detail_article.jsp\" target=\"_blank\">" +
                        " <img  src=" + imagePath + data[i].imagenew + ">" +
                        " </a>" +
                        "  <div class=\"h_c_l_wrap\">" +
                        "  <div>" +
                        " <h3 class=\"user_name\">" +
                        "  <a href=/pcviews/toNewsDetails/" + data[i].cid + ">" + data[i].title1 +
                        "</a>" +
                        " </h3>" +
                        "  </div>" +
                        "<p style='margin-top: -20px;overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + data[i].content +
                        "</p>" +
                        " <ul>" +
                        " <li>" + data[i].editor +
                        "</li>" +
                        "  <li>" + data[i].publishtime1 +
                        "</li>" +
                        "  </ul>" +
                        "</div>" +
                        "</li>";
                    $("#goods_list").append(list);
                }
            }
        }
    })
};

/*获得Advice（根据关注的人数 取前十位）*/
/*var hotCommand = function () {
    $.ajax({
        url: "/pcview/hotCommand",
        dataType: "json",
        type: "post",
        success: function (data) {
            $("#hotCommand").html("");
            for (var i = 0; i < data.length; i++) {
                var hotList =
                    "<li class=\"home_con_li good_word\">" +
                    "<a href=\"javascript:;\"></a>" +
                    "<h3>\"行业解读基金\"</h3>" +
                    " <h4><span>33.9K</span> 人关注</h4>" +
                    "  <p><span>刚刚更新:</span>&nbsp;&nbsp;<span>1.1为什么要复盘,为什么为什么为什么为什么</span></p>" +
            }
        }
    })
};*/

/*所属关注显示*/
var attention = function (id) {
    $.ajax({
        url: "/pcviews/attention/" + id,
        dataType: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                layer.msg(data.msg);
                $("#attention>a").replaceWith("<a>取消关注</a>");
            } else if (data.code == 1) {
                layer.msg(data.msg);
                $("#attention>a").replaceWith("<a>关注</a>");
            } else {
                layer.msg(data.msg);
            }
        }
    })
};
