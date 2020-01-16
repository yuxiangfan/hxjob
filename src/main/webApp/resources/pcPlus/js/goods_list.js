var path = "/smartBR";


$(function () {
    var id = $("#ac").val();
    newList(id);
    getNewWhether(id);

    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
});

/*获得对应所属的新闻列表信息*/
var newList = function (id) {
    $.ajax({
        url: path + '/pcviews/goodsList/' + id,
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
                        " <a target=\"_blank\">" +
                        " <img  src=/smartBR" + data[i].imagenew + ">" +
                        " </a>" +
                        "  <div class=\"h_c_l_wrap\">" +
                        "  <div>" +
                        " <h3 class=\"user_name\">" +
                        "  <a href=/smartBR/pcviews/toNewsDetails/" + data[i].cid + ">" + data[i].title1 +
                        "</a>" +
                        " </h3>" +
                        "  </div>" +
                        "<div style='overflow : hidden; height:45px;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + data[i].content +
                        "</div>" +
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


/*所属关注显示*/
var attention = function (id) {
    $.ajax({
        url: path + "/pcviews/attention/" + id,
        dataType: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                layer.msg(data.msg);
                $("#attention>a").replaceWith("<a>已关注</a>");
            } else if (data.code == 1) {
                layer.msg(data.msg);
                $("#attention>a").replaceWith("<a>关注</a>");
            } else {
                layer.msg(data.msg);
            }
        }
    })
};

/*所属关注收藏*/
var getNewWhether = function (id) {
    $.ajax({
        url: path + "/pcviews/getNewWhether/" + id,
        datatype: "json",
        type: "post",
        success: function (data) {
            if (!data.newWhether) {
                $("#attention>a").replaceWith("<a>已关注</a>");
            }
        }
    })
};

var attentionList = function (id) {
    $.ajax({
        url: path + "/pcviews/attention/" + id,
        dataType: "json",
        type: "post",
        success: function (data) {
            if (data.code == -9) {
                layer.msg(data.msg);
            } else if (data.code == 0) {
                layer.msg(data.msg);
                $("#attentionHot" + id).html("已关注");
            } else if (data.code == 1) {
                layer.msg(data.msg);
                $("#attentionHot" + id).html("关注");
            } else {
                layer.msg(data.msg);
            }
        }
    })
};
