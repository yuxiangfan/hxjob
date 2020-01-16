
$(function(){
	getOrgs();
	
	var layer;
	layui.use('layer', function(){
		layer = layui.layer;
	});
});

var praise = function(code){
	
	$.ajax({
		url:"pcviews/orgPraise/"+code,
		dataType:"json",
		type:'post',
		success:function(data){
			if(data.code==-9){
				window.location.href = "pcm/login";
			}
			else if(data.code==0){
				$("#p"+code).css('color','#fb8341');
			}
			else if(data.code==1){
				$("#p"+code).css('color','#9f9f9f');
			}
			else{
				layer.msg(data.msg);
			}
		}
	});
}

var collect = function(code){
	
	$.ajax({
		url:"pcviews/orgCollect/"+code,
		dataType:"json",
		type:'post',
		success:function(data){
			if(data.code==-9){
				window.location.href = "pcm/login";
			}
			else if(data.code==0){
				$("#c"+code).css('color','#fb8341');
			}
			else if(data.code==1){
				$("#c"+code).css('color','#9f9f9f');
			}
			else{
				layer.msg(data.msg);
			}
		}
	});
	
}

var getOrgs = function(industry,city){
	
	$.ajax({
		url:'pcviews/orgDatas',
		data:{"industry":industry,"city":city},
		dataType:'json',
		type:'post',
		success:function(data){
			$(".body").html("");
			if(data!=null){
				for(var i=0;i<data.length;i++){
					var index = data[i].score/0.05;
					var org = "<div class='body_title' >" +
							"<a href='h5views/tocommentlist/"+data[i].code+"'>" +
							"<div class='body_title_img'>" +
							"<img src="+baseRoot+data[i].logo+" />" +
							"</div>" +
							"<div class='body_title_name'>" +
							data[i].shortname +
							"</div>" +
							"<div class='body_title_comment'>" +
							"<span class='grade_star'>" +
							"<i style='width:"+index+"%;'></i>" +
							"</span>" +
							"</div>" +
							"<span class='gt' style=''>" +
							"<img src='resources/pc/icon/right.png' />" +
							"</span>" +
							"</a>" +
							"</div>";
					$(".body").append(org);
				}
			}
		}
	});
	
}