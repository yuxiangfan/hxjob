var layer;
var laypage;
$(function(){
	
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	
	layui.use('laypage', function(){
	  laypage = layui.laypage;
	  getSelectors();
//	  recommendlist();
	});
	
});

var newlist = function(){
	type = 'new';
	getSelectors(1);
	$("#new").css("border-bottom",'2px solid #717171');
	$("#hot").css("border-bottom",'none');
}

var hotlist = function(){
	type = 'hot';
	getSelectors(1);
	$("#hot").css("border-bottom",'2px solid #717171');
	$("#new").css("border-bottom",'none');
}

var recommendlist = function(){
	type = 'recommend';
	getRecommendSelectors();
}

var total=0;
var current=1;
var currentIndex;
var currPage;
var type = 'new';

var getSelectors = function(curr){
	
	var datas = {};
	if(curr==null || curr==undefined){
		currPage = 1;
	}
	else{
		currPage = curr;
	}
	datas.page = currPage;
	
	datas.type = type;
	
	$.ajax({
		url:'pcviews/selectorList',
		data:datas,
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=null){
				$(".group_list").html("");
				var rows = data.rows;
				for(var i=0;i<rows.length;i++){
					var add = "<div class='jxkc'>" +
							"<a style='text-decoration:none;cursor: pointer; color: #4f4f4f;' href='h5views/selectorDetail/"+rows[i].desEntryId+"'>" +
							"<div class='jxkc_img'>" +
							"<img src="+rootPath+rows[i].image+" />" +
							"</div>" +
							"<div class='jxkc_text'>" +
							"<p>"+rows[i].title+"</p>" +
							"</div>" +
							"</a>" +
							"</div>";
					$(".group_list").append(add);
				}
				if(curr==null || curr==undefined || curr==1){
	        		paging(data.total);
	        	}
			}
		}
	});
}

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




