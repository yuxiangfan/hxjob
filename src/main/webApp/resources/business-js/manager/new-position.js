var layer;
layui.use('layer', function () {
    layer = layui.layer;
});

var submit = function () {

    var datas = getDatas('table');

    console.log(datas);

    //新增
    if (datas.decEntryId == undefined || datas.decEntryId.trim().length == 0) {
        $.ajax({
            url: 'position/addNewPosition',
            data: datas,
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == 0) {
                    $("#decEntryId").val(data.id);
                    layer.confirm("新增成功", {btn: ['新建岗位', '保留当前']}, function () {
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
    //编辑
    else {
        $.ajax({
            url: 'position/editPosition',
            data: datas,
            dataType: 'json',
            type: 'post',
            success: function (data) {
                if (data.code == 0) {
                    layer.confirm("编辑成功", {btn: ['新建岗位', '保留当前']}, function () {
                            window.location.href = 'position/newPosition';
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

};

var getDatas = function (id) {
    var datas = {};
    $("#" + id).find("input").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    $("#" + id).find("select").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    $("#" + id).find("textarea").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    datas.duty = ueDuty.getContent();
    datas.requirement = ueRequirement.getContent();
    return datas;
};


$(function () {
    var status = $("#tr").val();
    if (status == "") {
        $("#updatetimeTr").hide()
    }
});
