$(function () {
    $("#save").on("click", function () {
        var cid = $("#cid").val();
        var title = $("#title").val();
        var downloadLink = $("#downloadLink").val();
        var downloadCode = $("#downloadCode").val();
        var validTime = $("#validTime").val();
        var whetherPay = $("#whetherPay").val();
        var whetherMember = $("#whetherMember").val();
        /*编辑保存*/
        if (cid != null && parseInt(cid) > 0) {
            $.ajax({
                url: 'load/submitEditDown',
                data: {
                    "cid": cid,
                    'title': title,
                    'link': downloadLink,
                    'code': downloadCode,
                    'validTime': validTime,
                    'pay': whetherPay,
                    'member': whetherMember
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
            /*新增保存*/
        } else {
            $.ajax({
                url: 'load/addDown',
                data: {'title': title, 'link': downloadLink, 'code': downloadCode, 'validTime': validTime, 'pay': whetherPay, 'member': whetherMember},
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
    download()
});

var layer;
layui.use('layer', function () {
    layer = layui.layer;
});

/*新增界面*/
var add_down = function () {
    currentIndex = layer.open({
        type: 1,
        area: ['600px', '500px'],
        shadeClose: false, //点击遮罩关闭
        title: '新增',
        content: $('.account')
    });
};
/*修改界面*/
var editDown = function (id) {
    $.ajax({
        url: 'load/editDown/' + id,
        data: {'cid': id},
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                $("#cid").val(data.id);
                $("#title").val(data.title);
                $("#downloadLink").val(data.link);
                $("#downloadCode").val(data.code);
                $("#validTime").val(data.validTime);
                $("#whetherPay").val(data.pay);
                $("#whetherMember").val(data.member);
                currentIndex = layer.open({
                    type: 1,
                    area: ['600px', '500px'],
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
var deleteDown = function (id) {
    layer.confirm('确定删除?', function () {
        $.ajax({
            url: 'load/deleteDown/' + id,
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
var download = function (curr) {
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    var datas = getData();
    datas.page = currPage;
    /*数据列表*/
    $.ajax({
        url: 'load/downList',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var validTime = list[i].validTime;
                    var pay = list[i].pay;
                    var member = list[i].member;
                    if (validTime == "all") {
                        validTime = "永久有效"
                    } else if (validTime == "seven") {
                        validTime = "有效7天"
                    } else {
                        validTime = "有效一天"
                    }
                    if (pay == "YES") {
                        pay = "付费下载"
                    } else {
                        pay = "免费下载"
                    }
                    if (member == "YES") {
                        member = "会员专享"
                    } else {
                        member == null;
                    }
                    var bt = "<button class='bt' onclick=editDown('" + list[i].id + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteDown('" + list[i].id + "') >删除</button>";
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].title + "</td>" +
                        "<td>" + list[i].link + "</td>" +
                        "<td>" + list[i].code + "</td>" +
                        "<td>" + validTime + "</td>" +
                        "<td>" + pay + "</td>" +
                        "<td>" + member + "</td>" +
                        "<td>" + list[i].createTime + "</td>" +
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
    download(current);
}

var searchData = function () {
    download();
};

var reset = function () {
    $(".params").find("input").val('');
    $(".params").find('select').val('');
    download();
};

/*查询数据储备*/
var getData = function () {
    var datas = {};
    $(".params").find('input').each(function () {
        datas[$(this).attr('name')] = $(this).val();
    });
    return datas;
};
















