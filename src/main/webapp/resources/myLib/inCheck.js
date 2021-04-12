function pwCheck(){
	var password=$("#password").val();
	var pLength = password.length;
	if(pLength <4){
		$('#pMessage').html(' password는 4글자 이상 입력하세요 ~~');
	    //$('#password').focus();
	    return false;
	}else if(password.replace(/[!-*]/gi,'').length>=pLength){
		$('#pMessage').html(' Password는 특수문자를 반드시 1개 이상 포함해야 됩니다 ~~');
	    //$('#password').focus();
	    return false;
	}else if (password.replace(/[0-9.!-*]/gi,'').length>0){
		$('#pMessage').html(' Password는 숫자와 특수문자로만 입력하세요 ~~');
	    //$('#password').focus();
	    return false;
	}else {
		$('#pMessage').html('');
		return true;
	}
} //pwCheck

//  password 재입력 동일성 확인
function pw2Check(){
	var password=$('#password').val();
	var password2=$('#password2').val();
	if (password != password2) {
		$('#p2Message').html('~~ password 가  다릅니다. 확인하세요  ~~');
		//$('#password').focus();
		return false;
	}else {
		$('#p2Message').html('');
		return true;
	}
}
