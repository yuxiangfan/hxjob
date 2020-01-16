$(function () {
    /*保存数据*/
    $("#save").on("click", function () {
        var cid = $("#cid").val();
        var title = $("#title").val();
        var nature = $("#nature").val();
        var brief = $("#brief").val();
        var publishtime = $("#publishtime").val();
        /*编辑保存*/
        if (cid != null && parseInt(cid) > 0) {
            $.ajax({
                url: 'selector/editACO',
                data: {'id': cid, 'title': title, 'nature': nature, 'brief': brief, 'publishtime': publishtime},
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
            /*新增保存*/
        } else {
            $.ajax({
                url: 'selector/addACO',
                data: {'title': title, 'nature': nature, 'brief': brief, 'publishtime': publishtime},
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

/*新增界面*/
var add_command = function () {
    initcity();
    currentIndex = layer.open({
        type: 1,
        area: ['300px', '200px'],
        shadeClose: false, //点击遮罩关闭
        title: '新增',
        content: $('.account')
    });
};
/*初始化数据*/
var initcity = function () {
    $("#cid").val("");
    $("#title").val("");
    $("#nature").val("");
    $("#brief").val("");
    $("#publishtime").val("");
};
/*修改数据*/
var editCommand = function (id) {
    initcity();
    $.ajax({
        url: 'selector/getCommandById',
        data: {'cid': id},
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                $("#cid").val(data.id);
                $("#title").val(data.title);
                $("#nature").val(data.nature);
                $("#brief").val( data.brief);
                $("#publishtime").val(data.publishtime);
                currentIndex = layer.open({
                    type: 1,
                    area: ['400px', '280px'],
                    shadeClose: false, //点击遮罩关闭
                    title: '修改',
                    content: $('.account')
                });
            } else {
                layer.msg("未找到数据");
            }
        }
    });
};
/*删除数据*/
var deleteCommand = function (id) {
    layer.confirm('确定删除?', function () {
        $.ajax({
            url: 'selector/deleteCommand/' + id,
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
/*分页*/
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
    /*数据列表*/
    $.ajax({
        url: 'selector/pages_command',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editCommand('" + list[i].id + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteCommand('" + list[i].id + "') >删除</button>";
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].title + "</td>" +
                        "<td>" + list[i].nature + "</td>" +
                        "<td>" + list[i].publishtime + "</td>" +
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
}

var searchData = function () {
    getPositions();
};

var reset = function () {
    $(".params").find("input").val('');
    $(".params").find('select').val('');
    getPositions();
};
/*查询数据储备*/
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