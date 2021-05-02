$(function(){ //ready로 감싸야 id식별 가능
	$.ajax({ // 관리자 페이지 시작과 동시에 아이작스 실행
		type:'Get',
		url:'membermanagement',
		success:function(resultPage){
			$('#section').html('');
			$('#section').html(resultPage);
			},
		error:function(){
			$('#section').html("~~ 오류발생 ~~");
		}
	});//ajax
	
	$('#membermanagementajax').click(function(){
		$.ajax({ // nav topmenu
				type:'Get',
				url:'membermanagement',
				success:function(resultPage){
					$('#section').html('');
					$('#section').html(resultPage);
					},
				error:function(){
					$('#section').html("~~ 오류발생 ~~");
				}
		});//ajax
	});
	
	$('#musicinsertf').click(function(){
		$.ajax({ // nav topmenu
				type:'Get',
				url:'musicinsertf',
				success:function(resultPage){
					$('#section').html('');
					$('#section').html(resultPage);
					},
				error:function(){
					$('#section').html("~~ 오류발생 ~~");
				}
		});//ajax
	});
});//ready