var layer;
var laypage;
$(function () {

    layui.use('layer', function () {
        layer = layui.layer;
    });

    layui.use('laypage', function () {
        laypage = layui.laypage;
        getSelectors();
        recommendlist();
    });
});

var newlist = function () {
    type = 'new';
    getSelectors(1);
    $("#new").css("border-bottom", '2px solid #717171');
    $("#hot").css("border-bottom", 'none');
};

var hotlist = function () {
    type = 'hot';
    getSelectors(1);
    $("#hot").css("border-bottom", '2px solid #717171');
    $("#new").css("border-bottom", 'none');
};

var recommendlist = function () {
    type = 'recommend';
    getRecommendSelectors();
};

var total = 0;
var current = 1;
var currentIndex;
var currPage;
var type = 'new';

var getSelectors = function (curr) {

    var datas = {};
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    datas.page = currPage;

    datas.type = type;

    $.ajax({
        url: 'selectorList',
        data: datas,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $("#group_list").html("");
                var rows = data.rows;
                for (var i = 0; i < rows.length; i++) {
                    var add =
                        "<li>\n" +
                        "                            <a style=\"padding:0;\">\n" +
                        "                                <div class=\"img br_center\"><img style=\"width: 115%;margin-top: 18px\" src=/hxjob" + rows[i].image + "></div>\n" +
                        "                                <div class=\"info\">\n" +
                        "                                    <div class=\"name br_elli\">\n" +
                        "                                        <button style=\"border: none;background-color: white;margin-left: -7px;font-size:1em;margin-top: -5px;display: block;color: #2c84cc;font-weight: bold; \"\n" +
                        "                                                onclick=newDetail('" + rows[i].id + "')>\n" + rows[i].title +
                        "                                        </button>\n" +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "<div  style='padding-left:10px;margin-top: -20px;overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" +
                        "                                <p>\n" +
                        "                                    \n" + rows[i].content +
                        "                                </p>\n" +
                        "\n" +
                        "</div>" +
                        "                            </a>\n" +
                        "                            <ul class=\"ul_style\" style=\"margin:10px 0px\">\n" +
                        "                                <li style=\"color: #1b6d85;margin-left: 72px;\">" + rows[i].title1 + "&nbsp;&nbsp;" + "[" + rows[i].nature + "]" +
                        "</li>\n" +
                        "                                <li>|</li>\n" +
                        "                                <li>" + rows[i].original + "</li>\n" +
                        "                                <li>|</li>\n" +
                        "                                <li>" + rows[i].looktime + "</li>\n" +
                        "                            </ul>\n" +
                        "                            <div style=\"border-bottom:1px solid #f3f3f3;margin-bottom: 6px\"></div>\n" +
                        "                        </li>"
                    $("#group_list").append(add);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
};

var getRecommendSelectors = function () {
    var datas = {};
    datas.type = type;
};

var newDetail = function (id) {
    window.location.href = "/hxjob/h5views/toNewsDetails/" + id;
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
                getSelectors(obj.curr);
            }
        }
    });
};




