var layer;
$(function(){
	
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	
});


var addEdu = function(){
	if($("#eduBody").find("tr").length>=3){
		layer.msg("教育背景最多填三项");
		return;
	}
	var index = parseInt(Math.random()*10000000);
	var edu = "<tr id=tr"+index+">" +
			"<td><input type='text' id=s"+index+" class='myinput' /></td>" +
			"<td><input type='text' id=e"+index+" class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><a href='javascript:void(0)' onclick='deleteEdu("+index+")'>删除</a></td>" +
			"</tr>";
	
	$("#eduBody").append(edu);
	laydate.render({
		elem: '#s'+index, 
		type:'month'
	});
	laydate.render({
		elem: '#e'+index, 
		type:'month'
	});
}

var deleteEdu = function(index){
	console.log($("#tr"+index).length);
	$("#tr"+index).remove();
}

var addExp = function(){
	if($("#expBody").find("tr").length>=3){
		layer.msg("实习经历最多填三项");
		return;
	}
	var index = parseInt(Math.random()*10000000);
	var exp = "<tr id=tr"+index+">" +
			"<td><input type='text' id=s"+index+" class='myinput' /></td>" +
			"<td><input type='text' id=e"+index+" class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><a href='javascript:void(0)' onclick='deleteExp("+index+")'>删除</a></td>" +
			"</tr>";
	
	$("#expBody").append(exp);
	laydate.render({
		elem: '#s'+index, 
		type:'month'
	});
	laydate.render({
		elem: '#e'+index, 
		type:'month'
	});
}

var deleteExp = function(index){
	console.log($("#tr"+index).length);
	$("#tr"+index).remove();
}


var addPro = function(){
	
	if($("#proBody").find("tr").length>=3){
		layer.msg("社会实践最多填三项");
		return;
	}
	
	var index = parseInt(Math.random()*10000000);
	var pro = "<tr id=tr"+index+">" +
			"<td><input type='text' id=s"+index+" class='myinput' /></td>" +
			"<td><input type='text' id=e"+index+" class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><input type='text' class='myinput' /></td>" +
			"<td><a href='javascript:void(0)' onclick='deletePro("+index+")'>删除</a></td>" +
			"</tr>";
	
	$("#proBody").append(pro);
	laydate.render({
		elem: '#s'+index, 
		type:'month'
	});
	laydate.render({
		elem: '#e'+index, 
		type:'month'
	});
}

var deletePro = function(index){
	console.log($("#tr"+index).length);
	$("#tr"+index).remove();
}
