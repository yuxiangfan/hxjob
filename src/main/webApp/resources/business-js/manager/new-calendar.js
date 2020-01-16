var layer;
layui.use('layer', function () {
    layer = layui.layer;
});

$(function () {
    $("#type").on('change', function () {
        if ($(this).val() == '0') {
            $("#contentTr").css('display', 'table-row');
            $("#urlTr").css('display', 'none');
            $("#url").val("");
        } else if ($(this).val() == '1') {
            $("#urlTr").css('display', 'table-row');
            $("#contentTr").css('display', 'none');
            ueContent.setContent("");
        }
    });
});

var submit = function () {

    var datas = getDatas('table');

    console.log(datas);

    var formData = new FormData();

    formData.append("datas", JSON.stringify(datas));


    //新增
    if (datas.applyCode == undefined || datas.applyCode.trim().length == 0) {
        datas.applyCode = 0;
        $.ajax({
            url: 'calendar/addCalendar',
            data: formData,
            dataType: 'json',
            type: 'post',
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    $("#code").val(data.id);
                    layer.confirm("新增成功", {btn: ['新增日历', '保留当前']}, function () {
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
            url: 'calendar/editCalendar',
            data: formData,
            dataType: 'json',
            type: 'post',
            async: false,
            cache: false, //上传文件无须缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false,
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    layer.confirm("编辑成功", {btn: ['新增日历', '保留当前']}, function () {
                            window.location.href = 'news/add';
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
    return datas;
};
