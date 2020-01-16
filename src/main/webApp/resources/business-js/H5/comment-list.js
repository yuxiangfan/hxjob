var layer;
var laypage;
$(function(){
	
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	
	layui.use('laypage', function(){
	  laypage = layui.laypage;
	  getOrgComments();
	});
	
});


var total=0;
var current=1;
var currentIndex;
var currPage;

var getOrgComments = function(curr){
	
	var datas = {};
	if(curr==null || curr==undefined){
		currPage = 1;
	}
	else{
		currPage = curr;
	}
	datas.page = currPage;
	
	datas.orgcode = orgcode;
	
	$.ajax({
		url:'pcviews/orgComments',
		data:datas,
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=null){
				$("#comments").html("");
				var rows = data.rows;
				for(var i=0;i<rows.length;i++){
					var org = "<div class='content'>" +
							"<p class='username'>"+rows[i].nickname+"("+rows[i].workrole+"|"+rows[i].workyear+"年)</p>" +
							"<p>"+rows[i].message+"</p>" +
							"</div>";
					$("#comments").append(org);
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
    	   getOrgComments(obj.curr);
       }
     }
     });
   }

