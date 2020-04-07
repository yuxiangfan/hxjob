
var layer;
layui.use('layer', function(){
	layer = layui.layer;
});

var submit = function(){
	
	var datas = getDatas('table');
	
	console.log(datas);
	
	var formData = new FormData();
	
	formData.append("datas",JSON.stringify(datas));
	
	formData.append("logo",file);
	
	//新增
	if(datas.code==undefined || datas.code.trim().length==0){
		$.ajax({
			url:'org/addNewOrg',
			data:formData,
			dataType:'json',
			type:'post',
			async:false,
  			cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
			success:function(data){
				if(data.code==0){
					$("#code").val(data.id);
					layer.confirm("新增成功",{btn:['新增机构','保留当前']},function(){
						window.location.reload();
					},
					function(index){
						layer.close(index);
					});
				}
				else{
					layer.alert(data.msg);
				}
			}
		})
	}
	//编辑
	else {
		$.ajax({
			url:'org/editOrg',
			data:formData,
			dataType:'json',
			type:'post',
			async:false,
			cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
			success:function(data){
				if(data.code==0){
					layer.confirm("编辑成功",{btn:['新增机构','保留当前']},function(){
						window.location.href='org/newOrg';
					},
					function(index){
						layer.close(index);
					});
				}
				else{
					layer.alert(data.msg);
				}
			}
		})
	}
	
	
}

var getDatas = function(id){
	var datas = {};
	$("#"+id).find("input").each(function(){
		datas[$(this).attr('id')] = $(this).val();
	});
	$("#"+id).find("select").each(function(){
		datas[$(this).attr('id')] = $(this).val();
	});
	$("#" + id).find("textarea").each(function () {
		datas[$(this).attr('id')] = $(this).val();
	});
	datas.description = ueDescription.getContent();
	return datas;
}
