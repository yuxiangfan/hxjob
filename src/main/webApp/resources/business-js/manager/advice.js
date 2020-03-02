$(function () {
    $("#save").on("click", function () {
        var aid = $("#aid").val();
        var username = $("#username").val();
        var password = $("#password").val();
        var realname = $("#realname").val();
        var mobile = $("#mobile").val();
        var role = $("#role").val();
        var status = $("#status").val();

        if (aid != undefined && parseInt(aid) > 0) {
            $.ajax({
                url: 'system/editAccount',
                data: {
                    'id': aid, 'username': username, 'password': password, 'realname': realname,
                    'mobile': mobile, 'role': role, 'status': status
                },
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.code == 0) {
                        refresh();
                        layer.close(currentIndex);
                    }
                }
            });
        } else {
            $.ajax({
                url: 'system/addAccount',
                data: {
                    'username': username, 'password': password, 'realname': realname,
                    'mobile': mobile, 'role': role, 'status': status
                },
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.code == 0) {
                        refresh();
                        layer.close(currentIndex);
                    }
                }
            });
        }

    });
});

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
    initAccount();

    currentIndex = layer.open({
        type: 1,
        area: ['400px', '280px'],
        shadeClose: false, //点击遮罩关闭
        title: '新增',
        content: $('.account')
    });
};

var initAccount = function () {
    $("#aid").val("");
    $("#username").val("");
    $("#password").val("");
    $("#realname").val("");
    $("#mobile").val("");
    $("#role").val($("#role").find("option:eq(0)").val());
    $("#status").val($("#status").find("option:eq(0)").val());
};

var editNews = function (id) {
    window.location.href = "advice/edit/" + id;
};

var deleteNews = function (id) {
    layer.confirm('确定删除?', function () {
        $.ajax({
            url: 'advice/deleteAdvice/' + id,
            dataType: 'json',
            success: function (data) {

                layer.alert(data.msg);
                if (data.code == 0) {
                    refresh();
                }
            }
        });
    });
};

var changeAccount = function (id, status) {
    $.ajax({
        url: 'system/changeAccount',
        data: {"id": id, "status": status},
        dataType: 'json',
        success: function (data) {

            layer.alert(data.msg);
            if (data.code == 0) {
                refresh();
            }
        }
    });
};

var total = 0;
var current = 1;
var currentIndex;
var currPage;
var getPositions = function (curr) {
    var datas = getData();
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    var datas = getData();
    datas.page = currPage;
    $.ajax({
        url: 'advice/page',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            console.log(data);
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editNews('" + list[i].id + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteNews('" + list[i].id + "') >删除</button>";
                    var istop = list[i].istop;
                    if (istop == 'YES') {
                        istop = '是';
                    } else {
                        istop = '否';
                    }
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].title + "</td>" +
                        "<td>" + list[i].author + "</td>" +
                        "<td>" + list[i].keywords + "</td>" +
                        "<td>" + list[i].publishtime + "</td>" +
                        "<td>" + (list[i].shelftime == null ? "" : list[i].shelftime) + "</td>" +
                        "<td>" + istop + "</td>" +
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
}

var refresh = function () {
    getPositions(current);
}

var searchData = function () {
    getPositions();
}

var reset = function () {
    $(".params").find("input").val('');
    $(".params").find('select').val('');
    getPositions();
}

var getData = function () {
    var datas = {};
    $(".params").find('input').each(function () {
        datas[$(this).attr('name')] = $(this).val();
    });
    $(".params").find('select').each(function () {
        datas[$(this).attr('name')] = $(this).val();
    });
    return datas;
}

var initaccount = function () {
    $(".account").attr('uid', '0');
    $(".account").find("input").val("");
    $(".account").find("select").each(function () {
        $(this).val($(this).find('option:eq(0)').val());
    });
}