$(function () {
    $("#save").on("click", function () {
        var roleid = $("#roleid").val();
        var roleName = $("#rolename").val();
        var roleremark = $("#roleremark").val();
        var status = $("#status").val();
        var checkRoles = treetable.all('checked');
        console.log(checkRoles);
        var ids = checkRoles.ids;
        if (ids.length == 0) {
            layer.msg("未选定角色菜单");
            return;
        }
        var idsStr = ids.join(',');

        if (roleid != undefined && parseInt(roleid) > 0) {
            $.ajax({
                url: 'system/editRole',
                data: {'roleid': roleid, 'roleName': roleName, 'remark': roleremark, "ids": idsStr, 'status': status},
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
                url: 'system/addNewRole',
                data: {'roleName': roleName, 'remark': roleremark, "ids": idsStr, 'status': status},
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

var getRoleTable = function (checkData) {

    $.ajax({
        url: 'system/getResources',
        dataType: 'json',
        success: function (dataBack) {
            console.log(dataBack);
            treetable.render({
                elem: '#resources-table',
                data: dataBack,
                field: 'name',
                is_checkbox: true,
                checked: checkData,
                cols: [
                    {
                        field: 'name',
                        title: '菜单',
                        width: '70%'
                    },
                ]
            });
        }
    });
};

var add = function () {
    initrole();
    getRoleTable();
    currentIndex = layer.open({
        type: 1,
        area: ['600px', '600px'],
        shadeClose: false, //点击遮罩关闭
        title: '新增',
        content: $('.account')
    });
}

var initrole = function () {
    $("#roleid").val("");
    $("#rolename").val("");
    $("#roleremark").val("");
    $("#status").val("ENABLE");
}

var editRole = function (id) {
    initrole();
    $.ajax({
        url: 'system/getRoleById',
        data: {'rid': id},
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                $("#roleid").val(id);
                $("#rolename").val(data.roleName);
                $("#roleremark").val(data.remark);
                $("#status").val(data.status);
                var ids = [];
                for (var i = 0; i < data.systemResources.length; i++) {
                    ids.push(data.systemResources[i].id);
                    for (var j = 0; j < data.systemResources[i].children.length; j++) {
                        ids.push(data.systemResources[i].children[j].id);
                    }
                }
                getRoleTable(ids);

                currentIndex = layer.open({
                    type: 1,
                    area: ['600px', '600px'],
                    shadeClose: false,
                    title: '编辑',
                    content: $('.account')
                });
            } else {
                layer.msg("未找到数据");
            }
        }
    });
}

var changeStatus = function (id, status) {
    $.ajax({
        url: 'system/changeRoleStatus',
        data: {"roleid": id, "status": status},
        dataType: 'json',
        type: "post",
        success: function (data) {
            layer.alert(data.msg);
            if (data.code == 0) {
                refresh();
            }
        }
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
        url: 'system/rolePage',
        data: datas,
        dataType: 'json',
        success: function (data) {
            $("#body").html('');
            console.log(data);
            if (data != null) {
                total = data.total;
                var list = data.rows;
                for (var i = 0; i < data.rows.length; i++) {
                    var bt = "<button class='bt' onclick=editRole('" + list[i].desEntryId + "') >编辑</button>";
                    var status = list[i].status;
                    if (status == 'ENABLE') {
                        status = "启用";
                        bt = bt + "<button class='bt' onclick=changeStatus('" + list[i].desEntryId + "','DISABLE') >禁用</button>";
                    } else {
                        status = "禁用";
                        bt = bt + "<button class='bt' onclick=changeStatus('" + list[i].desEntryId + "','ENABLE') >启用</button>";
                    }
                    var add = "<tr>" +
                        "<td>" + ((parseInt(currPage) - 1) * 15 + i + 1) + "</td>" +
                        "<td>" + list[i].roleName + "</td>" +
                        "<td>" + list[i].remark + "</td>" +
                        "<td>" + status + "</td>" +
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