var layer;
var laypage;

/*初始化*/
var counter = 0; /*计数器*/
var pageStart = 0; /*offset*/
var pageSize = 6; /*size*/

var path = "/smartBR";
$(function () {

    layui.use('layer', function () {
        layer = layui.layer;
    });


    getSelectors(pageStart,pageSize);
    recommendlist();


    /*点击监听加载更多*/
    $(document).on('click', '.js-load-more-good', function () {
        counter++;
        pageStart = counter * pageSize;
        getSelectors(pageStart, pageSize);

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


var getSelectors = function (pageStart, pageSize) {

    $.ajax({
        url: path + '/pcviews/selectorList',
        data: {
            "pageStart": pageStart, "pageSize": pageSize
        },
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data != null) {
                $(".group_list").html("");
                var rows = data.rows;
                sum = data.total;
                for (var i = 0; i < rows.length; i++) {
                    var add =
                        " <li class=\"home_con_li\">" +
                        "                <a href=\"detail_article.html\" target=\"_blank\">" +
                        "                    <img  src=/smartBR" + rows[i].image + ">" +
                        "                </a>" +
                        "                <div class=\"h_c_l_wrap\">" +
                        "                    <div>" +
                        "                        <h3 class=\"com_name\"><a href=/smartBR/pcviews/toNewsDetails/" + rows[i].id + ">" + rows[i].title + "</a></h3>" +
                        "                    </div>" +
                        "                    <div class=\"p_jx\" style=' height: 48px; overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;'>" + rows[i].content + "</div>" +
                        "                    <ul>" +
                        "                        <li><a class=\"hyjd\" href=/smartBR/pcviews/toNewsList/" + rows[i].cid + ">" + rows[i].title1 + "&nbsp;&nbsp;" + "[" + rows[i].nature +
                        "]</a></li>" +
                        "                        <li>|</li>" +
                        "                        <li>" + rows[i].original + "</li>" +
                        "                        <li>|</li>" +
                        "                        <li>" + rows[i].looktime + "</li>" +
                        "                    </ul>" +
                        "                </div>" +
                        "            </li>";
                    $(".group_list").append(add);
                }
                /*隐藏more*/
                if ((pageStart + pageSize) >= sum || sum == 0) {
                    $(".js-load-more-good").hide();
                } else {
                    $(".js-load-more-good").show();
                }
            }
        }
    });
};


var getRecommendSelectors = function () {
    var datas = {};
    datas.type = type;
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




