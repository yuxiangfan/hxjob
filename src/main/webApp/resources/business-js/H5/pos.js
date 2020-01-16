
var layer;
var laypage;
$(function(){
	
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	
	layui.use('laypage', function(){
	  laypage = layui.laypage;
	  getPoss();
	});
	
});


var getPoss = function(industry,city,type){
	
	$.ajax({
		url:'h5views/posDatas',
		data:{"industry":industry,"city":city,"type":type,'searchContent':$("#searchContent").val()},
		dataType:'json',
		type:'post',
		success:function(data){
			$(".body").html("");
			if(data!=null){
				for(var i=0;i<data.length;i++){
					var rindexPercent = data[i].rindex/0.05;
					var pos = "<div class='body_title' >" +
							"<div class='body_title_img'>" +
							"<a href='h5views/posd/"+data[i].organization.code+"'>" +
							"<img src="+baseRoot+data[i].organization.logo+" />" +
							"</a>" +
							"</div>" +
							"<div class='body_title_name'>" +
							"<a href='h5views/posd/"+data[i].organization.code+"' style='color:#f98057'>" +
							data[i].organization.shortname + 
							"</a>" +
							"-" +data[i].title +
							"</div>" +
							"<div class=''body_title_comment'>" +
							"<span class='grade_star'>" +
							"<i style='width:"+rindexPercent+"%;'></i>" +
							"</span>" +
							"</div>" +
							"<span class='gt' style=''>" +
							"<a href='h5views/posd/"+data[i].code+"'>" +
							"<img src='resources/pc/icon/right.png' />" +
							"</a>" +
							"</span>" +
							"</div>";
					
					$(".body").append(pos);
				}
			}
		}
	});
	
}