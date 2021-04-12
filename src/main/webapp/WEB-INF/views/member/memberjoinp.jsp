<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery 적용 src 위치에 맞게 설정 -->
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/idCheck.js"></script>
<script>
//** 입력 오류 확인 ( inCheck )
//1. 개별적 오류 확인을 위한 switch 변수 정의
var iCheck=false;
var pCheck=false;
var p2Check=false;
var	eCheck=false;
var	e2Check=false;
var	bCheck=false;
var	phCheck=false;
var idoverlapping=false; // id 중복체크
var emailoverlapping=false; // email 중복체크
var phoneoverlapping=false; // phone 중복체크
//2. 개별적 focusout 이벤트리스너 function 작성 : JQuery,
$(function(){
	// 이메일 직접입력 하게 해주는 jquery
	// https://hiworldbye.tistory.com/43 참고함
		// 직접입력 인풋박스 기존에는 숨김
		$("#email2").hide();

		$("#email3").change(function() {
			// 직접입력을 누를 때 나타남
			// 아닐때는 값을 지움
			// select 태그는 css를 조절하여 숨김
			if ($('#email3').val() == "direct") {
				$('#email2').show();
				$('#email3').css({
					width : "15px",
					height : "35px"
				});

			} else {
				$('#email2').hide();
				$('#email2').val('');
				$('#email3').css({
					width : "155px",
					height : "35px"
				});
			}
		})
	
	// *** 무결성 체크 ***
	$('#id').focus();
	$('#id').on("propertychange change keyup paste", function() {
		iCheck=idCheck();
	}); //id
	
	$('#password').on("propertychange change keyup paste", function() {
		pCheck=pwCheck();
	}); //password
	
	$('#password2').on("propertychange change keyup paste", function() {
		p2Check=pw2Check();
	}); //password2
	
	$('#email1').on("propertychange change keyup paste", function() {
		eCheck=emailCheck();
	}); //email

	$('#email2').on("propertychange change keyup paste", function() {
		e2Check=email2Check();
	}); //email2
	
 	$('#email3').on("propertychange change keyup paste", function() {
		e2Check=email3Check();
	}); //email3
	
	$('#birthday').focusout(function() {
		bCheck=bdCheck();
	}); //birthd
	
	$('.phone').on("propertychange change keyup paste", function() {
		phCheck=phoneCheck();
	}); //phone
	
	//추가부분///////////////////////////////////////////
		// focusout, blur 이벤트 차이
	// https://mygumi.tistory.com/321
	// ajax,json,gson 이용 id 중복 검사
	// https://blog.naver.com/vnemftnsska2/221407559074 참고
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	// 완성은 했으나 exception 발생
	// exception Message => No converter found for return value of type: class java.lang.Integer
	// https://mkil.tistory.com/426 참고 porm.xml에 gson dependency 추가 후 exception해결
/* 	<!-- gson -->
	<dependency>
	    <groupId>com.google.code.gson</groupId>
	    <artifactId>gson</artifactId>
	    <version>2.8.5</version>
	</dependency> */
	
	$("#id").on("propertychange change keyup paste input", function() {
		var id = $('#id').val();
		$.ajax({
			url : 'userCheck?id='+ id,
			type : 'get',
			success : function(data) {
				console.log("id 중복 검사 1 = 중복o / 0 = 중복x : "+ data);							
					if (data == 1) {
						if(idCheck()){
							// 1 : 아이디가 중복되는 문구
							$("#iMessage").text("사용중인 아이디입니다 :p");
							$("#iMessage").css("color", "red");
							idoverlapping=false;
						}
					} else {
						if(idCheck()){
							$("#iMessage").text("사용 가능한 아이디입니다");
							$("#iMessage").css("color", "green");
							idoverlapping=true;
						}else{
							$("#iMessage").css("color", "red");
							idoverlapping=false;
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
	});//id
	

	
	// ajax,json,gson 이용 email 중복 검사
	// email2,email3 는 backemail 클래스임
	$(".backemail").on("propertychange change keyup paste input", function() { // email2,email3 둘중하나라도 포커스 아웃하면.
		var backemail = $(this).attr('id'); // 이벤트발생 클래스의 id:(email2 or email3). email2 포커스 아웃인지 email3에 의한 포커스아웃인지 판별
		if($("#email3").val()=="direct"){ // email3가 직접입력이라면 backemail을 email2로 바꿈
			backemail = "email2";		  //- 직접입력을 누르고 email2에 아무것도 안쓰고 넘어갔을때 문제가 안생기는 오류를 막음.  
		}else{							  //- 직접입력시 email2를 무결성체크,중복체크해줌
			backemail = "email3";
		}								  

		var email = $('#email1').val();
			
		if($('#email2').val() != null && $('#email2').val().length > 0){
			var email = $('#email1').val() + "@" + $('#email2').val();
		}
		
		if($('#email3').val() != null && $('#email3').val().length > 0 && $('#email3').val() != 'direct'){
			var email = $('#email1').val() + "@" + $('#email3').val();
		}			// email 1,2,3 병합 코드
		
		$.ajax({
			url : 'userCheck?email='+ email,
			type : 'get',
			success : function(data) {
				console.log("email 중복 검사 1 = 중복o / 0 = 중복x : "+ data);							
				
					if (data == 1) { 
						if("email2"==backemail){ // 미리 무결성체크한 변수로 처리하는건 어떤 오류를 야기할지 모름-> 함수로 체크.
							if(emailCheck() && email2Check()){ //email 1,2 체크
								// 1 : 이메일이 중복되는 문구
								$("#eMessage").text("사용중인 이메일입니다 :p");
								$("#eMessage").css("color", "red");
								emailoverlapping=false;
							}//eCheck
						}else{ // 포커스 아웃이 email3이고 direct가 아니라면
							if(emailCheck() && email3Check()){ //email 1,3 체크
								// 1 : 이메일이 중복되는 문구
								$("#eMessage").text("사용중인 이메일입니다 :p");
								$("#eMessage").css("color", "red");
								emailoverlapping=false;
							}//eCheck
						}
					} else { // data == 0
						if("email2"==backemail){ // 포커스아웃이 email2에서 일어났다면.
							if(emailCheck() && email2Check()){ //email 1,2 체크
								$("#eMessage").text("사용 가능한 이메일입니다");
								$("#eMessage").css("color", "green");
								emailoverlapping=true; // email 중복체크 되면 서브밋가능
							}else{
								$("#eMessage").css("color", "red");
								emailoverlapping=false;
							}//eCheck
						}else{	// 포커스 아웃이 email3이고 direct가 아니라면
							if(emailCheck() && email3Check()){ //email 1,3 체크
								$("#eMessage").text("사용 가능한 이메일입니다");
								$("#eMessage").css("color", "green");
								emailoverlapping=true; // email 중복체크 되면 서브밋가능
							}else{
								$("#eMessage").css("color", "red");
								emailoverlapping=false;
							}//eCheck
							
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		}); //email
	
	// ajax,json,gson 이용 phon 중복 검사
	$(".phone").on("propertychange change keyup paste input", function() {
		var phone = $('#phone1').val() + $('#phone2').val() + $('#phone3').val();
		$.ajax({
			url : 'userCheck?phone='+ phone,
			type : 'get',
			success : function(data) {
				console.log("phone 중복 검사 1 = 중복o / 0 = 중복x : "+ data);							
					if (data == 1) {
						if(phoneCheck()){
							// 1 : 핸드폰이 중복되는 문구
							$("#phMessage").text("사용중인 핸드폰 번호입니다 :p");
							$("#phMessage").css("color", "red");
							phoneoverlapping=false;
						}
					} else {
						if(phoneCheck()){
							$("#phMessage").text("사용 가능한 핸드폰 번호입니다");
							$("#phMessage").css("color", "green");
							phoneoverlapping=true;
						}else{
							$("#phMessage").css("color", "red");
							phoneoverlapping=false;
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
	});//phone
	
	// input 값 실시간 감지 
	// https://karismamun.tistory.com/66 참고
	// 필수사항이 모두 true면 가입하기 버튼 css 변경
	$(".essentialinput").on("propertychange change keyup paste input", function() {
		var essentialinput = false;
		if (iCheck==true && pCheck==true && p2Check==true && eCheck==true && e2Check==true && bCheck==true && 
				phCheck==true && emailoverlapping==true && idoverlapping==true && phoneoverlapping==true) {
			essentialinput = true;
		}
		if(essentialinput){
	 		$('#submit').css({
	 			backgroundColor: "#0b3f9a",
				color: "#fff"
			}); 
			
		}else{
			$('#submit').css({
				backgroundColor: "#EEEEEF",
				color: "#8a8a8d"
			});
		}
	});

	
}); //ready	

//3. 전체적으로 입력 오류 가 없음을 확인하고 submit 여부를 판단
function inCheck() {
	if (iCheck==false) {
		$("#iMessage").css("color", "red");
		$('#iMessage').html(' ID 를 확인 하세요 ~~');
	}
	if (pCheck==false) {
		$("#pMessage").css("color", "red");
		$('#pMessage').html(' Password 를 확인 하세요 ~~');
	}
	if (p2Check==false) {
		$("#p2Message").css("color", "red");
		$('#p2Message').html(' 올바르게 Password 재입력 하셨나요?');
	}
	if (eCheck==false) {
		$("#eMessage").css("color", "red");
		$('#eMessage').html(' email 을 확인 하세요 ~~');
	}
	if (e2Check==false) {
		$("#eMessage").css("color", "red");
		$('#eMessage').html(' email 형식을 확인 하세요 ~~');
	}
	if (bCheck==false) {
		$("#bMessage").css("color", "red");
		$('#bMessage').html(' 샐년월일을 확인 하세요 ~~');
	}
	if (phCheck==false) {
		$("#phMessage").css("color", "red");
		$('#phMessage').html(' 전화번호 를 확인 하세요 ~~');
	}
	if (iCheck==true && pCheck==true && p2Check==true && eCheck==true && e2Check==true && bCheck==true && 
		phCheck==true && emailoverlapping==true && idoverlapping==true && phoneoverlapping==true) {
		
		// confirm 으로 submit 하기
		// https://blog.naver.com/kim1417/221029960262 참고
		var answer = confirm("~~ 입력 성공, 전송하시겠습니까?");

		if (answer){    //확인
		}else{   //취소
		   return false;
		}
	}else {
        return false;   // submit 무효화 
	}
} //inCheck


</script>
<style type="text/css">

/* 중앙정렬코드 */
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
	width: 500px;
	height: 1400px;
	border-radius: 5px 5px 5px 5px;
}

/* 테이블명 */
#tablename {
	color: #0b3f9a;
}

/* 필수사항 테이블 */
#essential {
	width: 400px;
	height: 640px;
	border: 1px solid #bcbcbc;
	margin-left: 50px;
	border-radius: 5px 5px 5px 5px;
}

/* 선택사항 테이블 */
#optional {
	width: 400px;
	height: 500px;
	border: 1px solid #bcbcbc;
	margin-left: 50px;
	border-radius: 5px 5px 5px 5px;
}

/* 메인 div class */
.box1 {
	padding-bottom: 15px;
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
#sex, .genre {
	background-color: #FAFAFA;
	padding-left: 12px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	width: 330px;
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
#submit {
	background-color: #EEEEEF;
	width: 330px;
	height: 50px;
	font-weight: bold;
	color: #8a8a8d;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
}

</style>
</head>


<body>
	<div class="layer">
		<span class="content">
			<form action="memberjoin" method="post" enctype="multipart/form-data">
				<div id="table">
					<h2 id="tablename">정보 입력</h2>
					<div id="essential">
						<br> <span>필수 사항</span> <br>
						<div style="text-align: left;" class="box1">
							<span class="font1">아이디</span>
							<div>
								<input type="text" name="id" id="id" class="essentialinput" size="36" placeholder="아이디" maxlength="12">
								<br> <span id=iMessage class="message"><br></span>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">비밀번호</span>
							<div class="box2">
								<input type="password" name="password" id="password" class="essentialinput" size="36" placeholder="비밀번호" maxlength="12">
								<br> <span id="pMessage" class="message"> <br></span>
							</div>
							<div>
								<input type="password" name="password2" id="password2" class="essentialinput" size="36" placeholder="비밀번호 확인" maxlength="12">
								<br> <span id="p2Message" class="message"> <br></span>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">생년월일</span>
							<div>
								<input type="date" name="birthday" id="birthday" class="essentialinput">
								<br> <span id="bMessage" class="message"> <br></span>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">성별</span>
							<div>
								<select name="sex" id="sex" size="1">
									<option selected="selected" value="N">(성별)선택 안함
									<option value="M">남자
									<option value="F">여자
								</select>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">이메일</span>
							<div>
								<input type="text" name="email1" id="email1" class="backemail essentialinput" size="10" placeholder="이메일" maxlength="20">
								@
								<input type="text" name="email2" id="email2" class="backemail essentialinput" size="7" placeholder="직접입력" maxlenth="15">
								<select name="email3" id="email3" class="backemail essentialinput" size="1">
									<option selected="selected" disabled="disabled">선택
									<option value="direct">직접입력
									<option value="naver.com">naver.com
									<option value="hanmail.net">hanmail.net
									<option value="daum.net">daum.net
									<option value="nate.com">nate.com
									<option value="gmail.com">gmail.com
									<option value="hotmail.com">hotmail.com
									<option value="lycos.co.kr">lycos.co.kr
									<option value="empal.com">empal.com
									<option value="cyworld.com">cyworld.com
									<option value="yahoo.co.kr">yahoo.co.kr
									<option value="paran.com">paran.com
									<option value="dreamwiz.com">dreamwiz.com
								</select>
								<br> <span id=eMessage class="message"> <br></span>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">휴대폰 번호</span>
							<div>
								<input type="text" name="phone1" id="phone1" class="phone essentialinput" size="2" placeholder="010" maxlength="3">&nbsp;-&nbsp;
								<input type="text" name="phone2" id="phone2" class="phone essentialinput" size="2" placeholder="0000" maxlength="4">&nbsp;-&nbsp;
								<input type="text" name="phone3" id="phone3" class="phone essentialinput" size="2" placeholder="0000" maxlength="4">

								<br> <span id=phMessage class="message"> <br></span>
							</div>
						</div>


					</div>
					<br>
					<div id="optional">
						<br> <span>선택 사항</span><br>
						<div style="text-align: left;" class="box1">
							<span class="font1">추천인</span>
							<div>
								<input type="text" name="rid" id="rid" size="36" placeholder="추천인" maxlength="12">
								<br><!-- <span id=iMessage class="message"> <br></span> -->
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">선호장르1</span>
							<div class="box2">
								<select name="genre1" class="genre" id="genre1" size="1">
									<option selected="selected" value="N">선택 안함
									<option value="dance">댄스
									<option value="rap">랩/힙합
									<option value="r&b">R&B/Soul
									<option value="indie">인디음악
									<option value="rock">록/메탈
									<option value="trot">트로트
									<option value="jazz">재즈
									<option value="oldpop">올드팝
								</select>
							</div>
							<span class="font1">선호장르2</span>
							<div>
								<select name="genre2" class="genre" id="genre2" size="1">
									<option selected="selected" value="N">선택 안함
									<option value="dance">댄스
									<option value="rap">랩/힙합
									<option value="r&b">R&B/Soul
									<option value="indie">인디음악
									<option value="rock">록/메탈
									<option value="trot">트로트
									<option value="jazz">재즈
									<option value="oldpop">올드팝
								</select>
							</div>
						</div>
						<div style="text-align: left;" class="box1">
							<span class="font1">이미지</span>
							<div>
							<span id="imgspace">
							<br><br><br>
							</span>
								<img src="" class="select_img" />
								<input type="file" name="uploadfilef" id="uploadfilef" size="36">
								<script>
									// 해당 파일의 서버상의 경로를 src로 지정하는것으로는 클라이언트 영역에서 이미지는 표시될 수 없기 때문에
									// 이를 해결하기 위해 FileReader이라는 Web API 를 사용
									// => 이 를 통해 url data를 얻을 수 있음.
									//    ( https://developer.mozilla.org/ko/docs/Web/API/FileReader)
									// ** FileReader
									// => 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는File
									//    혹은 Blob 객체를 이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 
									//    사용자의 컴퓨터에 저장하는 것을 가능하게 해줌.	
									// => FileReader.onload 이벤트의 핸들러.
									//    읽기 동작이 성공적으로 완료 되었을 때마다 발생.
									// => e.target : 이벤트를 유발시킨 DOM 객체

									$('#uploadfilef').change(function() {
										if (this.files&& this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(e) {
												$('#imgspace').html('');
												$(".select_img")
														.attr("src",e.target.result)
														.width(70)
														.height(70);
											} // onload_function
											reader.readAsDataURL(this.files[0]);
										} // if
									}); // change
								</script>

							</div>
						</div>
						<br>
						<button type="submit" id="submit" onclick="return inCheck()">가입하기</button>
					</div>
				</div>
			</form>
		</span> <span class="blank"></span>
	</div>





</body>
</html>