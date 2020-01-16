$(function(){
			$("#type").on('change',function(){
				if($(this).val()=='1'){
					$(".kc").css('display','none');
					$(".pa").css('display','none');
				}
				if($(this).val()=='2'){
					$(".kc").css('display','table-row');
					if($("#needpay").val()=='YES'){
						$(".pa").css('display','table-row');
					}
					else{
						$(".pa").css('display','none');
					}
				}
			});
			$("#needpay").on('change',function(){
				if($(this).val()=='YES'){
					$(".pa").css('display','table-row');
				}
				if($(this).val()=='NO'){
					$(".pa").css('display','none');
				}
			});
		});
var layer;
layui.use('layer', function(){
	layer = layui.layer;
});

var submit = function(){

	var datas = getDatas('table');

	console.log(datas);

	var formData = new FormData();

	formData.append("datas",JSON.stringify(datas));

	formData.append("image",file);

	//新增
	if(datas.decEntryId==undefined || datas.decEntryId.trim().length==0){
		$.ajax({
			url:'selector/addAC',
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
					layer.confirm("新增成功",{btn:['新增精选','保留当前']},function(){
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
			url:'selector/editAC',
			data:formData,
			dataType:'json',
			type:'post',
			async:false,
			cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
			success:function(data){
				if(data.code==0){
					layer.confirm("编辑成功",{btn:['新增精选','保留当前']},function(){
						window.location.href='selector/new';
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
	datas.brief = ueBrief.getContent();
	datas.content = ueContent.getContent();
	return datas;
}
