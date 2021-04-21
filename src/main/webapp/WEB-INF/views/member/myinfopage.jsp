<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
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

/* 정보출력 테이블 */
#essential {
	width: 610px;
	height: 500px;
	border: 1px solid #bcbcbc;
	border-radius: 5px 5px 5px 5px;
}
/* 내 프로필 이미지 div  */
#img {
	width: 610px;
	height: 500px;
	border: 1px solid #bcbcbc;
	border-radius: 5px 5px 5px 5px;
	position: absolute;
	top: 0px; left : 50%;
	margin-top: 0px;
	left: 50%;
	text-align: center;
}
#profile{
margin-top: 50px;
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

/*select 태그 성별,장르 css */
.genre {
	background-color: #FAFAFA;
	padding-left: 12px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	width: 450px;
	height: 15px;
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
/* 가입하기 버튼 css */
#submit {
	background-color: #EEEEEF;
	width: 330px;
	height: 50px;
	font-weight: bold;
	color: #8a8a8d;
}
</style>

</head>
<body>
<form action="memberfiximage" method="post" enctype="multipart/form-data">
	<table>
		<div id="table">
			<div id="essential">
				<div style="text-align: left;" class="box1">
					<span class="font1">아이디</span>
					<div>
						<input type="text" name="id" id="id" size="50" value="${vo.id}"
							placeholder="${vo.id}" readonly="readonly">
					</div>
				</div>
				<div style="text-align: left;" class="box1">
					<span class="font1">생년월일</span>
					<div>
						<input type="text" name="birthday" id="birthday" value="${vo.birthday}"
							placeholder="${vo.birthday}" size="50" readonly="readonly">
						<br> <span id="bMessage" class="message"></span>
					</div>
				</div>
				<div style="text-align: left;" class="box1">
					<span class="font1">성별</span>
					<div>
						<input type="text" name="sex" id="sex" placeholder="${vo.sex }" value="${vo.sex}"
							readonly="readonly" size="50">
					</div>
				</div>
				<div style="text-align: left;" class="box1">
					<span class="font1">이메일</span>
					<div>
						<input type="text" name="email" id="email" size="50" value="${vo.email}"
							placeholder="${vo.email }" readonly="readonly"> <br>
						<span id=iMessage class="message"></span>
					</div>
				</div>
				<div style="text-align: left;" class="box1">
					<span class="font1">휴대폰 번호</span>
					<div>
						<input type="text" name="phone1" id="phone1" size="50" value="${vo.phone}"
							placeholder="${vo.phone }" readonly="readonly">
					</div>
				</div>
				<br>
				<div style="text-align: left;" class="box1">
					<span class="font1">선호장르</span>
					<div class="box2">
						<input type="text" name="genre1" class="genre" id="genre1" value="${vo.genre1}"
							size="1" placeholder="${vo.genre1 }" readonly="readonly">
					</div>
					<div id="img">
						<img src="${vo.uploadfile}" id ="profile" class="select_img" width="300" height="300"/>
						<br>
								<input type="file" name="uploadfilef" id="uploadfilef" size="36">
								<script>
									$('#uploadfilef').change(function() {
										if (this.files&& this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(e) {
												$(".select_img")
														.attr("src",e.target.result)
														.width(300)
														.height(300);
											} // onload_function
											reader.readAsDataURL(this.files[0]);
										} // if
									}); // change
								</script>
								<br>
								<input type="submit" id="submit" value="전송">
							</div>
				
				</div>
			</div>
		</div>
	</table>
	</form>
</body>
</html>