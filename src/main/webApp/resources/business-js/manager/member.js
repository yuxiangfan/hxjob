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
    	
    	var resetPassword = function(id){
    		layer.confirm('确定重设密码?',function(){
    			$.ajax({
        			url:'member/resetPassword/'+id,
        			dataType:'json',
        			success:function(data){
        	    		
						if(data.code==0){
							layer.alert(data.msg + "<br/>新密码：" + data.newPassword);
						}
						else{
							layer.alert(data.msg);
						}
        			}
        		});
    		});
    	}
    	
    	var changeStatus = function(id,status){
    		$.ajax({
    			url:'member/changeStatus',
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
				url:'member/memberPage',
				data:datas,
				dataType:'json',
				success:function(data){
					$("#body").html('');
					console.log(data);
					if(data!=null){
						total = data.total;
						var list = data.rows;
						for(var i=0;i<data.rows.length;i++){
							var bt = "<button class='bt' onclick=resetPassword('"+list[i].desEntryId+"') >重设密码</button>";
							var status = list[i].status;
							if(status=='ENABLE'){
								status = "启用";
								bt = bt + "<button class='bt' onclick=changeStatus('"+list[i].desEntryId+"','DISABLE') >禁用</button>";
							}
							else{
								status = "禁用";
								bt = bt + "<button class='bt' onclick=changeStatus('"+list[i].desEntryId+"','ENABLE') >启用</button>";
							}
							var add = "<tr>"+
							"<td>"+((parseInt(currPage)-1)*15+i+1)+"</td>"+
							"<td>"+list[i].username+"</td>"+
							"<td>"+list[i].nickname+"</td>"+
							"<td>"+list[i].score+"</td>"+
							"<td>"+list[i].createtime+"</td>"+
							"<td>"+list[i].lastlogintime+"</td>"+
							"<td>"+status+"</td>"+
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