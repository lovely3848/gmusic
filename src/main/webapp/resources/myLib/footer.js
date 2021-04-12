/**
 * 
 */
$(function(){ //ready로 감싸야 id식별 가능
	$('.footergroup').click(function(){
		$.ajax({ // nav topmenu
				type:'Get',
				url:$(this).attr('id'),
				success:function(resultPage){
					$('#section').html('');
					$('#section').html(resultPage);
					},
				error:function(){
					$('section').html("~~ 오류발생 ~~");
				}
			});//ajax
	});
	
});//ready


