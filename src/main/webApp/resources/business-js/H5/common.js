

$(function(){
	
	$("#search").on('click',function(){
		
		var content = $(this).parents(".input").find('input:eq(0)').val();
		content = escape(escape(content));
		window.location.href = "pos?sc="+content;
		
	});
	
});