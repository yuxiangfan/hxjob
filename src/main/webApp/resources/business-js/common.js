var currentIndex;

var editpsd = function () {

    var editpage = "<div><div>" +
        "<table style='width:100%;margin-top:15px;'>" +
        "<tr>" +
        "<td style='width:40%;text-align:right;line-height:36px;'>输入原密码：</td><td><input id='oldpsd' type='password' /></td>" +
        "</tr>" +
        "<tr>" +
        "<td style='width:40%;text-align:right;line-height:36px;'>输入新密码：</td><td><input id='newpsd1' type='password' /></td>" +
        "</tr>" +
        "<tr>" +
        "<td style='width:40%;text-align:right;line-height:36px;'>再次输入新密码：</td><td><input id='newpsd2' type='password' /></td>" +
        "</tr>" +
        "<tr>" +
        "<td colspan='2' style='text-align:center;padding-top:10px;'>" +
        "<button onclick='editing()' style='width:75px;height:26px;border:1px solid #ccc;background-color:#3385ff;color:#fff;padding:0px 5px;border-radius:5px'>提交</button>" +
        "<button onclick='closeLayer()' style='width:75px;height:26px;border:1px solid #ccc;background-color:#3385ff;color:#fff;padding:0px 5px;border-radius:5px'>取消</button>" +
        "</td>" +
        "</tr>"
    "</table>" +
    "</div></div>";

    currentIndex = layer.open({
        type: 1,
        area: ['400px', '280px'],
        shadeClose: false, //点击遮罩关闭
        title: '修改密码',
        closeBtn: 0,
        content: editpage,
    });

};

var editing = function () {
    $.ajax({
        url: 'business/editpad',
        data: {"oldpsd": $("#oldpsd").val(), "newpsd1": $("#newpsd1").val(), "newpsd2": $("#newpsd2").val()},
        dataType: 'json',
        success: function (data) {

            if (data.code == 0) {
                layer.confirm(data.msg, {btn: ['确定']}, function () {
                    window.location.href = 'login';
                });
            } else {
                layer.alert(data.msg);
            }

        }
    });
}

var closeLayer = function () {
    layer.close(currentIndex);
}