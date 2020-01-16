var layer;
var laypage;
$(function(){
	
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	
	layui.use('laypage', function(){
	  laypage = layui.laypage;
	});
	
});

var collect = function(id){
	$.ajax({
		url:'h5views/acCollect/'+id,
		dataType:"json",
		success:function(data){
			layer.msg(data.msg);
			if(data.code==-9){
				window.location.href = "pcm/login";
			}
			if(data.code==0){
				$("#collect").remove();
			}
			
		}
	});
};

var toLearn = function(id){
	window.location.href = "h5views/tolearn/"+id;
}


var recommendlist = function(){
	type = 'recommend';
	getRecommendSelectors();
};

var total=0;
var current=1;
var currentIndex;
var currPage;
var type = 'new';


var getRecommendSelectors = function(){
	var datas = {};
	datas.type = type;
	
	$.ajax({
		url:'pcviews/selectorList',
		data:datas,
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=null){
				$(".group_recommend").html("");
				var rows = data.rows;
				for(var i=0;i<rows.length;i++){
					var add = "<div class='r_box'>" +
							"<a href='pcviews/selectorDetail/"+rows[i].desEntryId+"'>"+
							"<div class='r_box_img'>" +
							"<img src='"+rootPath+rows[i].image+"'/>" +
							"</div>" +
							"<div class='r_box_text'>" +
							"<p style='font-size: 12px;color: #4f4f4f;font-weight: bold;line-height: 20px;'>"+rows[i].title+"</p>" +
							"</div>" +
							"</a>"+
							"</div>";
					$(".group_recommend").append(add);
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
    	   getSelectors(obj.curr);
       }
     }
     });
   }




