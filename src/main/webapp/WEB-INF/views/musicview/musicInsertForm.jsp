<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery 적용 src 위치에 맞게 설정 -->
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style type="text/css">
section {
	margin: 0 auto;
	width: 75%;
	height: 1000px;
}

.leftbar {
	color: white;
	font-weight: bold;
	background-color: #0b3f9a;
	text-align: center;
	width: 100px;
}

a {
	text-decoration: none;
	color: black;
}

th {
	color: white;
	height: 50px;
}

table {
	width: 100%;
}

textarea {
	width: 100%;
	height: 200px;
	resize: none;
}

h2 {
	text-align: center;
	font-size: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
	color: #0b3f9a;
}
</style>
</head>
<body>
	<section>
		<h2 id="tablename">음악 추가</h2>
		<form action="musicinsert" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th class="leftbar" colspan="2">Write</th>
				</tr>
				<tr height="40">
					<td class="leftbar">곡 명</td>
					<td>
						<input type="text" name="sname" id="sname" size="50" maxlength="110">
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">앨범명</td>
					<td>
						<input type="text" name="stitle" id="stitle" size="50" maxlength="110">
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">아티스트</td>
					<td>
						<input type="text" name="singername" id="singername" size="50" maxlength="110">
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">발매일</td>
					<td>
						<input type="text" name="releasedate" id="releasedate" placeholder="1900.01.01" maxlength="10">
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">장 르</td>
					<td>
						<select name="genre" id="genre" size="1">
							<option selected="selected" value="dance">댄스
							<option value="ballad">발라드
							<option value="rap">랩/힙합
							<option value="rnb">R&B/Soul
							<option value="indie">인디
							<option value="rock">록/메탈
							<option value="trot">트로트
							<option value="jazz">재즈
						</select>
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">가사</td>
					<td>
						<textarea rows="10" cols="40" name="lyrics" id="lyrics" maxlength="4000"></textarea>
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">국내/해외</td>
					<td>
						<input type="radio" name="country" id="domestic" value="0">
						<label for="domestic">국내</label>&nbsp;&nbsp;
						<input type="radio" name="country" id="foreign" value="1">
						<label for="foreign">해외</label>
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">유튜브링크</td>
					<td>
						<label for="musicurl">https://www.youtube.com/embed/</label>
						<input type="text" name="musicurl" id="musicurl" placeholder="11자리의 고유 ID값 입력" maxlength="11">
					</td>
				</tr>
				<tr height="40">
					<td class="leftbar">노래 파일</td>
					<td>
					<audio src="" controls="controls" class="select_audio"></audio>
						<input type="file" name="downloadfilef" id="downloadfilef" size="36">
						<script>
							$('#downloadfilef').change(function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(e) {
										$(".select_audio").attr("src",e.target.result)
									} // onload_function
									reader.readAsDataURL(this.files[0]);
								} // if
							}); // change
						</script>
					</td>
				</tr>
				<tr height="70">
					<td class="leftbar">이미지 파일</td>
					<td>
						<span id="imgspace"><img src="resources/image/f1f3f4.png" width="70" height="70"/></span>
						<img src="" class="select_img" />
						<input type="file" name="imagefilef" id="imagefilef" size="36">
						<script>
							$('#imagefilef').change(function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(e) {
										$('#imgspace').html('');
										$(".select_img").attr("src",e.target.result)
												.width(70)
												.height(70);
									} // onload_function
									reader.readAsDataURL(this.files[0]);
								} // if
							}); // change
						</script>
					</td>
				</tr>
				<tr height="40">
					<td></td>
					<td>
						<input type="submit" value="전송">
						&nbsp;&nbsp;
						<input type="reset" value="취소">
						&nbsp;&nbsp;
				</tr>
			</table>
		</form>
		<hr>
		<a href="#" onClick="history.back()">이전페이지</a>
		<!-- ///////////////////SECTION END////////////////////////////////////////////////////// -->
	</section>
</body>
</html>