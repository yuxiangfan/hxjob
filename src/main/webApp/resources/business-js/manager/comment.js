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

}

var editComment = function (code) {
    window.location.href = "org/toEditComment/" + code;
}

var deleteComment = function (code) {
    layer.confirm('确定删除该机构？删除机构将删除相关招聘信息', function () {
        $.ajax({
            url: 'org/deleteComment/' + code,
            dataType: 'json',
            success: function (data) {
                layer.alert(data.msg);
                if (data.code == 0) {
                    getPositions();
                }
            }
        });
    });
}


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
        url: 'org/commentPage',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            console.log(data);
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editComment('" + list[i].id + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteComment('" + list[i].id + "') >删除</button>";
                    var ishot = list[i].ishot;
                    if (ishot == 'YES') {
                        ishot = "是";
                    } else {
                        ishot = "否";
                    }
                    var isstar = list[i].isstar;
                    if (isstar == 'YES') {
                        isstar = "是";
                    } else {
                        isstar = "否";
                    }
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].username + "</td>" +
                        "<td>" + list[i].nickname + "</td>" +
                        "<td>" + list[i].fullname + "</td>" +
                        "<td>" + list[i].name + "</td>" +
                        "<td>" + list[i].workyear + "</td>" +
                        "<td>" + list[i].postStatus + "</td>" +
                        "<td>" + list[i].salaryPreTax + "</td>" +
                        "<td>" + list[i].otherBenefit + "</td>" +
                        "<td>" + list[i].yearEndMoney + "</td>" +
                        "<td>" + list[i].growth + "</td>" +
                        "<td>" + list[i].workload + "</td>" +
                        "<td>" + list[i].culturalContext + "</td>" +
                        "<td>" + list[i].satisfaction + "</td>" +
                        "<td>" + list[i].theme + "</td>" +
                        "<td>" + list[i].createtime + "</td>" +
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

var submitCommentExcel = function () {
    var formData = new FormData();
    formData.append("file", orgExcel);
    $.ajax({
        url: 'org/importCommentExcel',
        data: formData,
        dataType: 'json',
        type: 'post',
        async: false,
        cache: false,//上传文件无需缓存
        processData: false,//用于对data参数进行序列化处理 这里必须false
        contentType: false, //必须
        success: function (data) {
            if (data.code == 0) {
                layer.confirm("报表批量插入成功", function () {
                        window.location.reload();
                    },
                    function (index) {
                        layer.close(index);
                    });
            } else {
                layer.alert(data.msg);
            }
        }
    })
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