		$(function(){
			$("#save").on("click",function(){
				var aid = $("#aid").val();
				var username = $("#username").val();
				var password = $("#password").val();
				var realname = $("#realname").val();
				var mobile = $("#mobile").val();
				var role = $("#role").val();
				var status = $("#status").val();
				
				if(aid!=undefined && parseInt(aid)>0){
					$.ajax({
						url:'system/editAccount',
						data:{'id':aid,'username':username,'password':password,'realname':realname,
							'mobile':mobile,'role':role,'status':status},
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
						url:'system/addAccount',
						data:{'username':username,'password':password,'realname':realname,
							'mobile':mobile,'role':role,'status':status},
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
			$("#username").val("");
			$("#password").val("");
			$("#realname").val("");
			$("#mobile").val("");
			$("#role").val($("#role").find("option:eq(0)").val());
			$("#status").val($("#status").find("option:eq(0)").val());
		}
    	
    	var editAccount = function(id){
    		initAccount();
    		$.ajax({
    			url:'system/getAccountById',
    			data:{'userid':id},
    			dataType:'json',
    			success:function(data){
    				if(data!=null){
    					$("#aid").val(id);
    					$("#username").val(data.userName);
    					$("#password").val(data.password);
    					$("#realname").val(data.realName);
    					$("#mobile").val(data.mobile);
    					$("#role").val(data.roleDesEntryId);
    					$("#status").val(data.status);
    					currentIndex = layer.open({
    						type: 1,
    						area: ['400px', '280px'],
    						shadeClose: false, //点击遮罩关闭
    						title: '编辑',
    						content: $('.account')
    					});
    				}
    				else{
    					layer.msg("未找到数据");
    				}
    			}
    		});
    		
    		
    	}
    	
    	var deleteAccount = function(id){
    		layer.confirm('确定删除?',function(){
    			$.ajax({
        			url:'system/deleteAccount/'+id,
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
    	
    	var showDetail = function(id){
    		window.open("test/posAcomD/"+id);
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
				url:'test/posAcomPage',
				data:datas,
				dataType:'json',
				success:function(data){
					$("#body").html('');
					console.log(data);
					if(data!=null){
						total = data.total;
						var list = data.rows;
						for(var i=0;i<data.rows.length;i++){
							var bt = "<button class='bt' onclick=showDetail('"+list[i].id+"') >查看详情</button>";
							var add = "<tr>"+
							"<td>"+((parseInt(currPage)-1)*15+i+1)+"</td>"+
							"<td>"+list[i].member.nickname+"</td>"+
							"<td>"+list[i].score+"</td>"+
							"<td>"+list[i].result+"</td>"+
							"<td>"+list[i].createtime+"</td>"+
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