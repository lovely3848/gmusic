/**
 * 
 */
$(function(){
	$('.pagingAjax1').click(function(){
		var paging = $(this).attr('value1');
		console.log("paging: "+paging);
		$.ajax({ // nav topmenu
				type:'Get',
				url: paging,
				success:function(resultPage){
					$('#sec1_1').html('');
					$('#sec1_1').html(resultPage);
					},
				error:function(){
					$('#sec1_1').html("~~ 오류발생 ~~");
				}
			});//ajax
	});//click
});//ready