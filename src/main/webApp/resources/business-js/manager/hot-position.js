		$(function(){
			$("#save").on("click",function(){
				var aid = $("#aid").val();
				var name = $("#name").val();
				var sort = $("#sort").val();
				var keywords = $("#keywords").val();
				
				if(aid!=undefined && parseInt(aid)>0){
					$.ajax({
						url:'position/editHotPosition',
						data:{'id':aid,'name':name,'sort':sort,'keywords':keywords},
						dataType:'json',
						type:'post',
						success:function(data){
							layer.alert(data.msg);
							if(data.code==0){
								refresh();
								layer.close(currentIndex);
							}
						}
					});
				}
				else{
					$.ajax({
						url:'position/addHotPosition',
						data:{'name':name,'sort':sort,'keywords':keywords},
						dataType:'json',
						type:'post',
						success:function(data){
							layer.alert(data.msg);
							if(data.code==0){
								refresh();
								layer.close(currentIndex);
							}
						}
					});
				}
				
			});
		});

		var currentIndex;
		
		var laypage;
		layui.use('laypage', function(){
		  laypage = layui.laypage;
		  getHotPositions();
		});
		
		var layer;
		layui.use('layer', function(){
			layer = layui.layer;
		});
    
    
		var add = function(){
			initAccount();
    		
    		currentIndex = layer.open({
				type: 1,
				area: ['400px', '280px'],
				shadeClose: false, //点击遮罩关闭
				title: '新增',
				content: $('.account')
			});
    	}
		
		var initAccount = function(){
			$("#aid").val("");
			$("#name").val("");
			$("#sort").val("");
			$("#keywords").val("");
		}
    	
    	var editHotPosition = function(id,name,sort,keywords){
    		
    		$("#aid").val(id);
			$("#name").val(name);
			$("#sort").val(sort);
			$("#keywords").val(keywords);
    		
    		currentIndex = layer.open({
				type: 1,
				area: ['400px', '280px'],
				shadeClose: false, //点击遮罩关闭
				title: '编辑',
				content: $('.account')
			});
    		
    		
    	}
    	
    	var deleteHotPosition = function(id){
    		layer.confirm('确定删除?',function(){
    			$.ajax({
        			url:'position/deleteHotPosition/'+id,
        			dataType:'json',
        			success:function(data){
        	    		
        				layer.alert(data.msg);
						if(data.code==0){
							refresh();
						}
        			}
        		});
    		});
    	}
    	
    	
    	
    	var total=0;
		var current=1;
		var currentIndex;
		var currPage;
		var getHotPositions = function(curr){
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
				url:'position/hotposdata',
				data:datas,
				dataType:'json',
				success:function(data){
					$("#body").html('');
					console.log(data);
					if(data!=null){
						total = data.total;
						var list = data.rows;
						for(var i=0;i<data.rows.length;i++){
							var bt = "<button class='bt' onclick=editHotPosition('"+list[i].id+"','"+list[i].name+"','"+list[i].sort+"','"+list[i].keywords+"') >编辑</button>" +
									"<button class='bt' onclick=deleteHotPosition('"+list[i].id+"') >删除</button>";
							
							var add = "<tr>"+
							"<td>"+((parseInt(currPage)-1)*15+i+1)+"</td>"+
							"<td>"+list[i].name+"</td>"+
							"<td>"+list[i].sort+"</td>"+
							"<td>"+list[i].keywords+"</td>"+
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
		    	   getHotPositions(obj.curr);
		       }
		     }
		     });
		   }
		
		 var refresh = function(){
			 getHotPositions(current);
		 }
		 
		 var searchData = function(){
			 getHotPositions();
		 }
		 
		 var reset = function(){
		 	$(".params").find("input").val('');
		 	$(".params").find('select').val('');
		 	getHotPositions();
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