/**
 * 회원가입
로그인/로그아웃
id중복테스트
마이페이지
id  영어 숫자 가능  6글자 12글자 이하
password  영어 숫자 특수문자 6글자이상 12글자이하 각 부분 1나씩 무조건 사용
생년월일 카피 (잘모름)
이메일1 -> 값이 있어야함 무조건  // email 2 .** or email3  선택값만 있으면 된다.
휴대폰번호 11자리
- 안들어가게
prising — 오늘 오후 3:49
성별 (선택안함)
남자
여자
8 ~ 12자리까지
중복확인
Idcheck
로그인 - 로그인 실패시 아이디 또는 비밀번호가 틀렸습니다.
alert
로그인 footer
 */
function idCheck() {
	// $(this).val() : this 적용 안됨
	var id=$('#id').val();
	if (id.length < 6 || id.length>12) {
		$('#iMessage').html(' ID는 6글자 이상 12글자 이하로 입력하세요 ~~');
		return false;
	}else if (id.replace(/[a-z.0-9]/gi,'').length > 0 ) {
		$('#iMessage').html(' ID는 영문과 숫자로만 입력하세요 ~~ ');
		return false;
	}else {
		//$('#iMessage').html('');
		return true;
	}
} //idCheck

function pwCheck(){
	var password=$("#password").val();
	var password2=$("#password2").val();
	var pLength = password.length;
	if(pLength <6 || pLength >12){
		$('#pMessage').html(' password는 6글자 이상 12글자 이하로 입력하세요 ~~');
	    return false;
	}else if(password.replace(/[0-9]/gi,'').length>=pLength){
		$('#pMessage').html(' Password는 영어,숫자,특수문자가 모두 포함돼야합니다 다시 입력하세요 ~~');
	    return false;
	}else if (password.replace(/[!-*]/gi,'').length>=pLength){
		$('#pMessage').html(' Password는 영어,숫자,특수문자가 모두 포함돼야합니다 다시 입력하세요 ~~');
	    return false;
	}else if (password.replace(/[a-z]/gi,'').length>=pLength){
		$('#pMessage').html(' Password는 영어,숫자,특수문자가 모두 포함돼야합니다 다시 입력하세요 ~~');
	    return false;
	}else {
		$('#pMessage').html('');
		if (password != password2) { // 패스워드1에서도 패스워드2와 매치 체크해줘야함. p2메시지에 표현
			$('#p2Message').html('~~ password 가 다릅니다. 확인하세요  ~~');
			p2Check=false;		//안맞으면 p2 false. 서브밋 방해
		}else{
			$('#p2Message').html('');
			p2Check=true;
		}
		return true;
	}
} //pwCheck

//  password 재입력 동일성 확인
function pw2Check(){
	var password=$('#password').val();
	var password2=$('#password2').val();
	if (password != password2) {
		$('#p2Message').html('~~ password 가 다릅니다. 확인하세요  ~~');
		return false;
	}else {
		$('#p2Message').html('');
		return true;
	}
}
//***********************
// 이름추가하면 그때 추가
/*function nmCheck() {
	var name=$("#name").val();
	if(name.length < 2){
		$('#nMessage').html(' Name 2글자 이상 입력하세요 ~~');
	    return false;
	}else if(name.replace(/[a-z.가-힇]/gi,'').length > 0 ){ //다음 확인
	   	$('#nMessage').html(' Name은 한글과 영문으로만 입력하세요 ~~');	
	    return false;
	}else {
	 	$('#nMessage').html('');
	   	return true;
	}
} //nmCheck*/

function bdCheck() {
	var birthday=$("#birthday").val();
	if(birthday.length != 10){
		$('#bMessage').html(' 생일은 YYYY-MM-DD 정확하게 입력하세요 ~~');
	    return false;
	}else {
	 	$('#bMessage').html('');
	   	return true;
	}
} //bdCheck 

function emailCheck() {
	var email1=$("#email1").val(); // 사용자 입력값
	if(email1.length <= 0 ){
	   	$('#eMessage').html(' email id를 입력해주세요');
	   	return false;
	}else {
	  	//$('#eMessage').html('');
	  	return true;
	}
} //emailCheck 
function email2Check() {
	var email2=$("#email2").val(); // 사용자 입력값
	var email2Length= email2.length; // 문자길이 저장
	if(email2==null || email2.length <= 0){ // 1글자라도 값이 들어온지 확인
	   	$('#eMessage').html(' email뒷부분을 입력해주세요 ~~');
		return false;
	}else if(email2.replace(/[.]/g,'').length >= email2Length ){
	   	$('#eMessage').html(' email뒷부분의 형식은 (.)이 들어가야 합니다 ~~');
	   	return false;
	}else if(email2.replace(/[a-z]/g,'').length >= email2Length ){
	   	$('#eMessage').html(' email뒷부분의 형식은 소문자 알파벳이 들어가야 합니다 ~~');
		return false;
	}else {
	  	//$('#eMessage').html('');
	  	return true;
	}
} //email2Check 

function email3Check() {
	var email3=$("#email3").val(); // 사용자 입력값
	if(e2Check == true){ // email2나 email3의 포커스아웃결과가 이미 true이면 통과
		return true;
	}else if(email3==null || email3 =='direct'){ //위 조건에서 e2Check가 true가 아닌데 email3의 값이 없거나
		$('#eMessage').html(' email 뒷부분을 확인하세요~'); //- 직접입력의 값이 없으면 false
		return false;
	}else {
		//$('#eMessage').html(''); // 위 조건이 아니라면 성공
	  	return true;
	}
} //email3Check

function phoneCheck() {
	var phone1=$("#phone1").val();
	var phone2=$("#phone2").val();
	var phone3=$("#phone3").val();
	var phone= phone1+phone2+phone3
	if ( phone.length<10){
    	$('#phMessage').html('10자리 이상의 전화번호를 정확히 입력해주세요~');
	    return false;
    }else if($.isNumeric(phone)==false){
    	$('#phMessage').html(' 전화번호는 숫자로만 입력하세요 ~~');
        return false;
    }else {
	    //$('#phMessage').html('');
	    return true;
	}
} //phoneCheck 
