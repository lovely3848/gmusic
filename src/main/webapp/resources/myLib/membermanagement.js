$(function(){
	$('.memberdelete').click(function() {
		var id = $('.memberdelete').attr('value');
		var result = confirm('정말 삭제 하시겠습니까?')
		if(result == true){
			$.ajax({ // nav topmenu
				type : 'Get',
				url : 'memberdeletes?id=' + id,  // 컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success : function() {
					$(location).attr("href", "management");
				},
				error : function() {
				}
			});//ajax	
		}else{
			return false
		}
			$(location).attr("href", "management");
	});	
	$('.memberpointchange').click(function() {
		var id = $('.memberpointchange').attr('value');
		var result = prompt('포인트를 입력하세요', 0);
			$.ajax({ // nav topmenu
				type : 'Get',
				url : 'memberpointchange?point=' + result + '&id=' + id,  // 컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success : function() {
					$(location).attr("href", "management");
				},
				error : function() {
				}
			});//ajax	
	});	
	$('.membergradechange').click(function() {
		var id = $('.membergradechange').attr('value');
		do{
		var result = prompt('회원등급을 입력하세요', 'c');
		}while(result != 'c' && result != 'vvip' && result != 'vip' && result != 'admin')
		
			$.ajax({ // nav topmenu
				type : 'Get',
				url : 'membergradechange?grade=' + result + '&id=' + id,  // 컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success : function() {
					$(location).attr("href", "management");
				},
				error : function() {
				}
		});//ajax	
	});	
});//ready