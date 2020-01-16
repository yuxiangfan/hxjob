var memberPhoto = null;
var imgUpload = null;
var layer;

var path = "/smartBR";
layui.use('layer', function () {
    layer = layui.layer;
});
$(function () {
    $("#memberPhoto").on('change', function () {
        memberPhoto = document.getElementById("memberPhoto").files[0];
        document.getElementById("memberPhotoPreview").src = window.URL.createObjectURL(memberPhoto);
    });
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

    formData.append("memberPhoto", memberPhoto);

    //新增
    if (datas.id == undefined || datas.id.trim().length == 0) {
        $.ajax({
            url: path + '/pcviews/userOrgComment',
            data: formData,
            dataType: 'json',
            type: 'post',
            async: false,
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    $("#decEntryId").val(data.id);
                    layer.confirm("评论成功", {btn: ['新建岗位', '保留当前']}, function () {
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
