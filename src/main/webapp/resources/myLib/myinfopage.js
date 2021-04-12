/**
 * 
 */
// ** Ajax BoardList
$(function() { //ready로 감싸야 id식별 가능
	id = $('id').val();
	$.ajax({ // nav topmenu
		type: 'Get',
		url: 'myinfopage?id=' + id, //컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
		success: function(resultPage) {
			$('#area1').html('');
			$('#area1').html(resultPage);// area1에 ajax를 이용해 화면 구현
		},
		error: function() {
			$('#area1').html("~~ 오류발생 ~~");// 오류시 area1에 오류발생 메세지 출현
		}
	});//ajax
});//ready