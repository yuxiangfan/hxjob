		$(function(){
			$("#save").on("click",function(){
				var cid = $("#cid").val();
				var name = $("#name").val();
				var ishot = $("#ishot").val();
				var sort = $("#sort").val();
				if(!/^\d{1,5}$/.test(sort)){
					layer.alert("排序号格式有误");
					return;
				}
				if(cid!=undefined && parseInt(cid)>0){
					$.ajax({
						url:'commonset/editIndustry',
						data:{'id':cid,'name':name,'ishot':ishot,'sort':sort},
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
						url:'commonset/addIndustry',
						data:{'name':name,'ishot':ishot,'sort':sort},
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
		  getPositions();
		});
		
		var layer;
		layui.use('layer', function(){
			layer = layui.layer;
		});
    
    
		var add = function(){
    		initcity();
    		
    		currentIndex = layer.open({
				type: 1,
				area: ['400px', '280px'],
				shadeClose: false, //点击遮罩关闭
				title: '新增',
				content: $('.account')
			});
    	}
		
		var initcity = function(){
			$("#cid").val("");
			$("#name").val("");
			$("#ishot").val("NO");
			$("#sort").val("10");
		}
    	
    	var editIndustry = function(id){
    		initcity();
    		$.ajax({
    			url:'commonset/getIndustryById',
    			data:{'cid':id},
    			dataType:'json',
    			success:function(data){
    				if(data!=null){
    					$("#cid").val(data.id);
    					$("#name").val(data.name);
    					$("#ishot").val(data.ishot);
    					$("#sort").val(data.sort);
    					currentIndex = layer.open({
    						type: 1,
    						area: ['400px', '280px'],
    						shadeClose: false, //点击遮罩关闭
    						title: '新增',
    						content: $('.account')
    					});
    				}
    				else{
    					layer.msg("未找到数据");
    				}
    			}
    		});
    	}
    	
    	var deleteIndustry = function(id){
    		layer.confirm('确定删除?',function(){
    			$.ajax({
        			url:'commonset/deleteIndustry/'+id,
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
				url:'commonset/industryPage',
				data:datas,
				dataType:'json',
				success:function(data){
					$("#body").html('');
					console.log(data);
					if(data!=null){
						total = data.total;
						var list = data.rows;
						for(var i=0;i<data.rows.length;i++){
							var bt = "<button class='bt' onclick=editIndustry('"+list[i].id+"') >编辑</button>" +
									"<button class='bt' onclick=deleteIndustry('"+list[i].id+"') >删除</button>";
							var ishot = list[i].ishot;
							if(ishot=='YES'){
								ishot = "是";
							}
							else{
								ishot = "否";
							}
							var add = "<tr>"+
							"<td>"+((parseInt(currPage)-1)*15+i+1)+"</td>"+
							"<td>"+list[i].name+"</td>"+
							"<td>"+ishot+"</td>"+
							"<td>"+list[i].sort+"</td>"+
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