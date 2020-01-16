var currentIndex;

var laypage;
layui.use('laypage', function () {
    laypage = layui.laypage;
    getPositions();
});

var layer;
layui.use('layer', function () {
    layer = layui.layer;
});


var add = function () {

};

var editOrg = function (code) {
    window.location.href = "calendar/editExam/" + code;
};

var deleteOrg = function (code) {
    layer.confirm('确定删除该机构？删除机构将删除相关招聘信息', function () {
        $.ajax({
            url: 'calendar/deleteExam/' + code,
            dataType: 'json',
            success: function (data) {
                layer.alert(data.msg);
                if (data.code == 0) {
                    getPositions();
                }
            }
        });
    });
};

var total = 0;
var current = 1;
var currentIndex;
var currPage;
var getPositions = function (curr) {
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    var datas = getData();
    datas.page = currPage;
    $.ajax({
        url: 'calendar/examList',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            console.log(data);
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editOrg('" + list[i].applyCode + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteOrg('" + list[i].applyCode + "') >删除</button>";
                    var examStatus = list[i].examStatus;
                    if (examStatus == '1') {
                        examStatus = "已发布";
                    } else {
                        examStatus = "未发布";
                    }
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].orgCode + "</td>" +
                        "<td>" + list[i].title + "</td>" +
                        "<td>" + list[i].applyInto + "</td>" +
                        "<td>" + list[i].applyTime + "</td>" +
                        "<td>" + examStatus + "</td>" +
                        "<td>" + list[i].examTitle + "</td>" +
                        "<td>" + list[i].examInto + "</td>" +
                        "<td>" + list[i].examTime + "</td>" +
                        "<td>" + bt + "</td>" +
                        "</tr>";
                    $("#body").append(add);
                }
                if (curr == null || curr == undefined || curr == 1) {
                    paging(data.total);
                }
            }
        }
    });
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
                getPositions(obj.curr);
            }
        }
    });
};

var refresh = function () {
    getPositions(current);
};

/*查询操作*/
var searchData = function () {
    getPositions();
};

/*重置操作*/
var reset = function () {
    $(".params").find("input").val('');
    $(".params").find('select').val('');
    getPositions();
};

/*得到查询值*/
var getData = function () {
    var datas = {};
    $(".params").find('input').each(function () {
        datas[$(this).attr('name')] = $(this).val();
    });
    $(".params").find('select').each(function () {
        datas[$(this).attr('name')] = $(this).val();
    });
    return datas;
};

var initaccount = function () {
    $(".account").attr('uid', '0');
    $(".account").find("input").val("");
    $(".account").find("select").each(function () {
        $(this).val($(this).find('option:eq(0)').val());
    });
}