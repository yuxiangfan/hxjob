var imgUpload = null;
var layer;
layui.use('layer', function () {
    layer = layui.layer;
});
$(function () {

    $("#imgUpload").on('change', function () {
        imgUpload = document.getElementById("imgUpload").files[0];
    })
});


var submit = function () {

    var datas = getDatas();

    console.log(datas);

    var formData = new FormData();
    formData.append("datas", JSON.stringify(datas));

    formData.append("imgUpload", imgUpload);

    //新增
    if (datas.id == undefined || datas.id.trim().length == 0) {
        $.ajax({
            url: 'org/addNewComment',
            data: formData,
            dataType: 'json',
            type: 'post',
            async: false,
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    $("#code").val(data.id);
                    layer.confirm("新增成功", {btn: ['新增点评', '保留当前']}, function () {
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
            url: 'org/editComment',
            data: formData,
            dataType: 'json',
            type: 'post',
            async: false,
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    layer.confirm("编辑成功", {btn: ['新增点评', '保留当前']}, function () {
                            window.location.href = 'org/comment';
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
}

var getDatas = function () {
    var datas = {};
    $("#remark").find("input").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });

    $("#remark").find("select").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    $("#remark").find("textArea").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    return datas;
};
