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
    window.location.href = "org/toEditOrg/" + code;
};

var deleteOrg = function (code) {
    layer.confirm('确定删除该机构？删除机构将删除相关招聘信息', function () {
        $.ajax({
            url: 'org/deleteOrg/' + code,
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
    var datas = getData();
    if (curr == null || curr == undefined) {
        currPage = 1;
    } else {
        currPage = curr;
    }
    var datas = getData();
    datas.page = currPage;
    $.ajax({
        url: 'org/orgPage',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            console.log(data);
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editOrg('" + list[i].code + "') >编辑</button>" +
                        "<button class='bt' onclick=deleteOrg('" + list[i].code + "') >删除</button>";
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
                        "<td>" + list[i].fullname + "</td>" +
                        "<td>" + list[i].shortname + "</td>" +
                        "<td>" + list[i].code + "</td>" +
                        "<td><img style='max-width:50px' src=/hxjob" + list[i].logo + " /></td>" +
                        "<td>" + list[i].industryname + "</td>" +
                        "<td>" + list[i].cityname + "</td>" +
                        "<td>" + list[i].tags + "</td>" +
                        "<td>" + list[i].grade + "</td>" +
                        "<td>" + list[i].score + "</td>" +
                        "<td>" + list[i].treatment + "</td>" +
                        "<td>" + ishot + "</td>" +
                        "<td>" + list[i].publishtime + "</td>" +
                        "<td>" + list[i].shelftime + "</td>" +
                        "<td>" + list[i].realName + "</td>" +
                        "<td>" + list[i].praiseCount + "</td>" +
                        "<td>" + list[i].commontCount + "</td>" +
                        "<td>" + list[i].collectCount + "</td>" +
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
}

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

/*报表导入*/
var submitOrgExcel = function () {
    var formData = new FormData();
    formData.append("file", orgExcel);
    $.ajax({
        url: 'org/importOrgExcel',
        data: formData,
        dataType: 'json',
        type: 'post',
        async: false,
        cache: false,//上传文件无需缓存
        processData: false,//用于对data参数进行序列化处理 这里必须false
        contentType: false, //必须
        success: function (data) {
            if (data.code == 0) {
                layer.confirm("报表批量插入成功(温馨提示：职业报表,发布时间高于当前时间或者下架时间低于当前时间，则信息不在后台和前台显示)", function () {
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