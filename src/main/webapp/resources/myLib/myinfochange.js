$(function(){ //ready로 감싸야 id식별 가능
	$('#myinfochangep').click(function(){
		$.ajax({ // nav topmenu
				type:'Get',
				url:'myinfochangep?id=' + id,
				success:function(resultPage){
					$('#area1').html('');
					$('#area1').html(resultPage);
					},
				error:function(){
					$('#area1').html("~~ 오류발생 ~~");
				}
			});//ajax
	});
});//ready