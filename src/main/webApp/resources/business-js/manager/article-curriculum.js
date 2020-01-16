$(function(){

});

var currentIndex;

var laypage;
layui.use('laypage', function(){
    laypage = layui.laypage;
    getPositions();
});

var layer;
layui.use('layer', function(){
    layer = layui.layer;
});

var editAc = function(id){
    window.location.href = "selector/edit/"+id;
};

var deleteAc = function(id){
    layer.confirm("确定删除？",function(){
        $.ajax({
            url:'selector/deleteAC/'+id,
            dataType:'json',
            success:function(data){
                if(data.code==0){
                    refresh();
                }
                layer.alert(data.msg);
            }
        });
    });
}

var changeAccount = function(id,status){
    $.ajax({
        url:'system/changeAccount',
        data:{"id":id,"status":status},
        dataType:'json',
        success:function(data){

            layer.alert(data.msg);
            if(data.code==0){
                refresh();
            }
        }
    });
};

var total=0;
var current=1;
var currentIndex;
var currPage;
var getPositions = function(curr){
    var datas = getData();
    if(curr==null || curr==undefined){
        currPage = 1;
    }
    else{
        currPage = curr;
    }
    var datas = getData();
    datas.page = currPage;
    $.ajax({
        url:'selector/pages',
        data:datas,
        dataType:'json',
        success:function(data){
            $("#body").html('');
            console.log(data);
            if(data!=null){
                total = data.total;
                var list = data.rows;
                for(var i=0;i<data.rows.length;i++){
                    var bt = "<button class='bt' onclick=editAc('"+list[i].desEntryId+"') >编辑</button>" +
                        "<button class='bt' onclick=deleteAc('"+list[i].desEntryId+"') >删除</button>";
                    var type = list[i].type;
                    if(type=='1'){
                        type = "文章";
                    }
                    else if(type=='2'){
                        type = "课程";
                    }
                    var ishot = list[i].ishot;
                    if(ishot=='YES'){
                        ishot = "是";
                    }
                    else{
                        ishot = "否";
                    }
                    var add = "<tr>"+
                        "<td>"+((parseInt(currPage)-1)*15+i+1)+"</td>"+
                        "<td>"+type+"</td>"+
                        "<td>"+list[i].title+"</td>"+
                        "<td>"+list[i].author+"</td>"+
                        "<td>"+list[i].publishtime+"</td>"+
                        "<td>"+list[i].shelftime+"</td>"+
                        "<td>"+list[i].readcount+"</td>"+
                        "<td>"+list[i].paycount+"</td>"+
                        "<td>"+ishot+"</td>"+
                        "<td>"+bt+"</td>"+
                        "</tr>";
                    $("#body").append(add);
                }
                if(curr==null || curr==undefined || curr==1){
                    paging(data.total);
                }
            }
        }
    });
}

var paging = function(totalCount){
    laypage.render({
        elem: 'page'
        ,count: totalCount
        ,limit:15
        ,jump: function(obj, first){
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数
            console.log(first);
            current = obj.curr;
            //首次不执行
            if(!first){
                getPositions(obj.curr);
            }
        }
    });
}

var refresh = function(){
    getPositions(current);
}

var searchData = function(){
    getPositions();
}

var reset = function(){
    $(".params").find("input").val('');
    $(".params").find('select').val('');
    getPositions();
}

var getData = function(){
    var datas = {};
    $(".params").find('input').each(function(){
        datas[$(this).attr('name')] = $(this).val();
    });
    $(".params").find('select').each(function(){
        datas[$(this).attr('name')] = $(this).val();
    });
    return datas;
}

var initaccount = function(){
    $(".account").attr('uid','0');
    $(".account").find("input").val("");
    $(".account").find("select").each(function(){
        $(this).val($(this).find('option:eq(0)').val());
    });
}