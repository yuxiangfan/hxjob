/*上传头像*/
var id = $(".personId").val();
var path = "/hxjob";

$(function () {

    getCollect();
    getRemark();
    praise();
    alreadyPraise();
    letter();
    getCollectOrg();
});

/*判断JS*/


var submitHead = function (id) {
    var datas = new getDatas();
    var formData = new FormData();
    $(".card input").css('border', 'none');
    $(".card textarea").css('border', 'none');
    console.log(datas);
    formData.append("datas", JSON.stringify(datas));
    if ($("#nickname").val() == "") {
        layer.alert("昵称不可为空");
    } else {
        $.ajax({
            url: 'addHeadPhotp/' + id,
            data: formData,
            type: 'post',
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                if (data.code == 0) {
                    layer.confirm("保存成功", function () {
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
};


/*个人中心(用户填写数据)*/
var getDatas = function () {
    var datas = {};
    $("#position").find("input").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    $("#position").find("select").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    $("#position").find("textarea").each(function () {
        datas[$(this).attr(('id'))] = $(this).val();
    });
    $(".left_box").find("input").each(function () {
        datas[$(this).attr('id')] = $(this).val();
    });
    return datas;

};


var editPassWord = function () {
    var oldPassWord = $("#oldPassWord").val();
    var newPassWord = $("#newPassWord").val();
    var againPassWord = $("#againPassword").val();
    $.ajax({
        url: 'editPassword',
        data: {'oldPasWord': oldPassWord, 'newPassWord': newPassWord, 'againPassWord': againPassWord},
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                layer.confirm("修改成功", function () {
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


/*我收藏的招聘*/
var getCollect = function () {
    $.ajax({
        url: 'getCollect',
        dataType: "json",
        type: 'post',
        success: function (data) {
            $("#collect").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var collect = " <tr>" +
                        "      <td>" + data[i].title + "</td>" +
                        "      <td>" + data[i].organization.fullname + "</td>" +
                        "      <td>" +
                        "      <a type=\"button\" href=/hxjob/pcviews/posDetail/" + data[i].code + " target='_blank' class=\"btn btn-warning\">查看</a>" +
                        "      <a type=\"button\" onclick=deleteCollect('" + data[i].code + "') class=\"btn btn-warning\">删除</a>" +
                        "         </td>" +
                        "             </tr>";
                    $("#collect").append(collect);
                }
            }
        }
    })
};

/*我收藏的机构*/
var getCollectOrg = function () {
    $.ajax({
        url: 'getCollectOrg',
        dataType: "json",
        type: 'post',
        success: function (data) {
            $("#collectOrg").html("");
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var collect = " <tr>" +
                        "      <td>" + data[i].fullname + "</td>" +
                        "      <td>" + data[i].salary + " K</td>" +
                        "      <td>" + data[i].grade + " 分</td>" +
                        "      <td>" +
                        "      <a type=\"button\" href=/hxjob/pcviews/tocommentlist/" + data[i].code + " target='_blank' class=\"btn btn-warning\">查看</a>" +
                        "      <a type=\"button\" onclick=deleteCollectOrg('" + data[i].code + "') class=\"btn btn-warning\">删除</a>" +
                        "         </td>" +
                        "             </tr>";
                    $("#collectOrg").append(collect);
                }
            }
        }
    })
}

/*删除职业*/
var deleteCollect = function (code) {
    $.ajax({
        url: "/hxjob/pcviews/deleteSave/" + code,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                layer.alert(data.msg);
                getCollect()
            }
        }
    })
};

/*删除机构*/
var deleteCollectOrg = function (code) {
    $.ajax({
        url: "/hxjob/pcviews/deleteCollectOrg/" + code,
        dataType: 'json',
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                layer.alert(data.msg);
                getCollectOrg()
            }
        }
    })
};


/*点评个人中心*/
var getRemark = function () {
    $.ajax({
        url: "/hxjob/pcviews/getRemark",
        datatype: "json",
        type: 'post',
        success: function (data) {
            $(".id_4").html('');
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var rindexPercent = data[i].satisfaction / 0.05;
                    var remark =
                        "<div class=\"card_one\" >" +
                        "                    <a onclick=deleteRemark('" + data[i].id + "') class=\"deleteRemark\"></a>" +
                        "                    <img style='cursor: pointer'  onclick=detailRemark('" + data[i].orgcode + "') class=\"card_one_img\" src=/hxjob" + data[i].logo + " alt=\"#\">" +
                        "                    <label style=' cursor: pointer'  onclick=detailRemark('" + data[i].orgcode + "')>" + data[i].orgname + "</label>" +
                        "                    <div class=\"span_postion\"><span class=\"span_lable\">" + data[i].otherBenefit + "</span>" +
                        "                    <span class='grade_star'  ><i style='width:" + rindexPercent + "%;'></i></span>" +
                        "</div>" +
                        "                    <p class=\"card_one_p\">" + data[i].writingEvaluation + "</p>" +
                        "                </div>";
                    $(".id_4").append(remark);
                }
            }
        }
    })
};

/*X个人中心点评*/
var deleteRemark = function (id) {
    $.ajax({
        url: "/hxjob/pcviews/deleteRemark/" + id,
        datatype: "json",
        type: 'post',
        success: function (data) {
            if (data.code == 0) {
                layer.alert(data.msg);
                getRemark()
            }
        }
    })
};


/*点评详情页*/
var detailRemark = function (code) {
    window.location.href = "/hxjob/pcviews/tocommentlist/" + code;
}


/*我收获的赞*/
var praise = function () {
    $.ajax({
        url: "/hxjob/pcviews/getPraise",
        datatype: "json",
        type: 'post',
        success: function (data) {
            $(".id_5").html("");
            for (var i = 0; i < data.length; i++) {
                var praise =
                    " <div class=\"card_one\">" +
                    "                    <label>  " + data[i].remarkTime + "</label>" +
                    "                    <label> 名为:<span style='color: red'>" + data[i].nickname + "</span></label>" +
                    "                    <label>给您点评的" + data[i].fullname + "点了赞</label>" +
                    "                </div>";
                $(".id_5").append(praise);
            }
        }
    })
};


/*我赞过的*/
var alreadyPraise = function () {
    $.ajax({
        url: "/hxjob/pcviews/alreadyPraise",
        datatype: "json",
        type: "post",
        success: function (data) {
            $(".id_6").html("");
            for (var i = 0; i < data.length; i++) {
                var alreadyPraise =
                    "<div class=\"card_one\" >" +
                    "                    <label> " + data[i].remarkTime + "</label>" +
                    "                    <label>您给名为:<span style='color: red'>" + data[i].nickname + "点评的</label>" +
                    "                    <label>" + data[i].fullname + "点了赞</label>" +
                    "                </div>";
                $(".id_6").append(alreadyPraise);
            }
        }
    })
};

/*我的私信*/
var letter = function () {
    $.ajax({
        url: "/hxjob/pcviews/letter",
        datatype: 'json',
        type: 'post',
        success: function (data) {
            $(".id_7").html("");
            var a = " <a onclick='clearLetter(id)' class='clear' ></a>";
            $(".id_7").append(a);
            for (var i = 0; i < data.length; i++) {
                var letter = " <div class=\"card_one\">" +
                    "                    <label>" + data[i].publishTime + "</label>" +
                    "                    <label>名为:<span style='font-style: italic;color: red'>" + data[i].nickname + "</span>给您点评的<span style='font-style: italic;color: black'>" + data[i].fullname + " </span>写了私信</label>" +
                    "                    <p>(<span style='background-color: gainsboro'>" + data[i].replyData + "</span>)</p>" +
                    "                </div>";
                $(".id_7").append(letter);
            }

        }
    })
};

/*清空评论*/
var clearLetter = function () {
    layer.confirm('确认清空所有私信吗？', function () {
        $.ajax({
            url: "/hxjob/pcviews/clearLetter/" + id,
            dataType: 'json',
            success: function (data) {
                layer.alert(data.msg);
                if (data.code == 0) {
                    layer.alert(data.msg);
                    letter();
                }
            }
        });
    });
}

