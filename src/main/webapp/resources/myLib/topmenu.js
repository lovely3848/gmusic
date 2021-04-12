/**
 * 
 */
// ** Ajax BoardList
$(function(){
	$.ajax({ // nav topmenu
			type:'Get',
			url:'topmenu',
			success:function(resultPage){
				$('#topmenu').html('');
				$('#topmenu').html(resultPage);
				},
			error:function(){
				$('#topmenu').html("~~ 오류발생 ~~");
			}
		});//ajax
});//ready