<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>

<script>
var pCheck=false;
var p2Check=false;

$(function(){
	$('#password').focusout(function() {
		pCheck=pwCheck();
	}); //password

	$('#password2').focusout(function() {
		p2Check=pw2Check();
	}); //ready
}); //password2
//--------------- js파일이 적용이안되서 직접 입력------------------
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
//--------------- js파일이 적용이안되서 직접 입력------------------
function inCheck() { //password 무결성 check
	if (pCheck==false) {
		$('#pMessage').html(' Password 를 확인 하세요 ~~');
	}
	if (p2Check==false) {
		$('#p2Message').html(' 올바르게 Password 재입력 하셨나요?');
	}
	if (pCheck==true && p2Check==true) {
			var fix = confirm('~~ 입력 성공, 전송하시겠습니까?'); //컨펌 확인누를시 수정 취소누를시 취소
			if(fix == true){
				return true;
			}else{
				return false;
			}
		}else {
	        return false;
	        $('#password').focusout;
	        $('#password2').focusout;    
		}
} //inCheck
</script>
<style>
.layer {
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
}

.layer .content {
	display: inline-block;
	vertical-align: middle;
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

/* 전체 테이블 */
#table {
	width: 700px;
	height: 2400px;
	border-radius: 5px 5px 5px 5px;
}

/* 필수사항 테이블 */
#essential {
	width: 610px;
	height: 500px;
	border: 1px solid #bcbcbc;
	border-radius: 5px 5px 5px 5px;
}

#sub {
	width: 610px;
	height: 500px;
	border: 1px solid #bcbcbc;
	border-radius: 5px 5px 5px 5px;
	position: absolute;
	top: 0px;
	left: 50%;
	margin-top: 0px;
	left: 50%;
	text-align: center;
}
/* 메인 div class */
.box1 {
	padding-bottom: 20px;
	margin-left: 35px;
}

/* 비밀번호, 선호장르 div class */
.box2 {
	margin-bottom: 10px;
}

/* 메인 font(span css class */
.font1 {
	font-size: 13px;
	color: #8a8a8d;
	font-weight: bold;
}

/* input태그 css */
div>input, #email2 {
	background-color: #FAFAFA;
	padding: 9px 35px 9px 16px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	padding: 9px 35px 9px 16px;
}

/* 중복확인 버튼 태그 css */
#idDup {
	background-color: #EEEEEF;
	padding: 9px 35px 9px 16px;
	border: 0px;
	font-weight: bold;
	text-align: center;
	color: #8a8a8d;
}

/*select 태그 성별,장르 css */
.genre {
	background-color: #FAFAFA;
	padding-left: 12px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	width: 530px;
	height: 35px;
}

/*select 태그 이메일 css */
#email3 {
	background-color: #FAFAFA;
	padding-left: 12px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	width: 155px;
	height: 35px;
}

/* uploadfile css */
#uploadfilef {
	width: 275px;
	height: 25px;
}

/* 가입하기 버튼 css */
#submit, #reset {
	background-color: #EEEEEF;
	width: 150px;
	height: 50px;
	font-weight: bold;
	color: #8a8a8d;
	margin-left: 30px;
}
</style>

</head>
<body>

	<form action="myinfochange" method="post">
		<table>
			<div id="table">
				<div id="essential">
					<div style="text-align: left;" class="box1">
						<span class="font1">아이디</span>
						<div>
							<input type="text" name="id" id="id" size="50" value="${vo.id }" placeholder="${vo.id}" readonly="readonly">
						</div>
					</div>
					<br>
					<div style="text-align: left;" class="box1">
						<span class="font1">비밀번호</span>
						<div class="box2">
							<input type="password" name="password" id="password" size="50" placeholder="비밀번호">
							<br> <span id="pMessage" class="message"> <br></span>
						</div>
						<br>
						<div>
							<input type="password" name="password2" id="password2" size="50" placeholder="비밀번호 확인">
							<br> <span id="p2Message" class="message"></span>
						</div>
					</div>
					<br>
					<div style="text-align: left;" class="box1">
						<span class="font1">생년월일</span>
						<div>
							<input type="text" name="birthday" id="birthday" value="${vo.birthday }" placeholder="${vo.birthday}" size="50" readonly="readonly">
							<br> <span id="bMessage" class="message"></span>
						</div>
					</div>
					<br>
					<div style="text-align: left;" class="box1">
						<span class="font1">성별</span>
						<div>
							<input type="text" name="sex" id="sex" placeholder="${vo.sex }" value="${vo.sex }" readonly="readonly" size="50">
						</div>
					</div>

				</div>

			</div>
			<div id="sub">
				<br>
				<div style="text-align: left;" class="box1">
					<span class="font1">이메일</span>
					<div>
						<input type="text" name="email" id="email" size="50" value="${vo.email }" placeholder="${vo.email }" readonly="readonly">
						<br> <span id=iMessage class="message"></span>
					</div>
				</div>
				<br>
				<div style="text-align: left;" class="box1">
					<span class="font1">휴대폰 번호</span>
					<div>
						<input type="text" name="phone1" id="phone1" size="50" value="${vo.phone }" placeholder="${vo.phone }" readonly="readonly">
					</div>
					<br>
					<div style="text-align: left;" class="box1">
						<span class="font1">선호장르</span>
						<div class="box2">
							<select name="genre1" class="genre" id="genre1" size="1">
								<option selected="selected" value="${vo.genre1}">${vo.genre1}
								<option value="N">선택 안함
								<option value="dance">댄스
								<option value="ballad">발라드
								<option value="rap">랩/힙합
								<option value="rnb">R&B/Soul
								<option value="indie">인디
								<option value="rock">록/메탈
								<option value="trot">트로트
								<option value="jazz">재즈
							</select>
						</div>
					</div>
					<br>
					<button type="submit" value="수정하기" id="submit" size="10" onclick="return inCheck()">수정하기</button>
					<input type="reset" value="취소하기" id="reset" size="10">
				</div>
			</div>
		</table>
	</form>

</body>
</html>