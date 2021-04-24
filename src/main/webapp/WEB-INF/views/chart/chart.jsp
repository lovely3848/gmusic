<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** G-MUSIC 차트 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>
#headname {
	text-transform: uppercase;
}

#table {
	width: 100%;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-spacing: 0px;
}

#table td {
	border-bottom: 1px solid;
	border-collapse: collapse;
	border-color: #EEEEEF;
	padding: 5px;
}

.category {
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size: 14px;
}

.rnum {
	font-size: 18px;
}

.albumimage {
	width: 40px;
	height: 40px;
	padding: 6px;
	vertical-align: middle;
}

.playbutten, .icon {
	background-color: transparent !important; /* 배경 없애기 */
	border: none; /* 버튼 보더 없애기 */
	padding: 0;
	align-self: auto;
	white-space: nowrap; /* 한라인 쓰기 */
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size: 14px;
	font-weight: 600;
	color: #333333;
}

.playbutten:hover, .icon:hover {
	text-decoration: underline; /* hover시 밑줄 */
	cursor: pointer; /* hover시 마우스 손가락 모양 */
}

.playbutten:focus, .icon:focus {
	outline: none; /* 클릭후 포커스 없애기 */
}

.singername {
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size: 12px;
	color: #8b8b8b;
}

.textoverflow {
	/* 텍스트 넘치면 ... 표시 */
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 200px;
}


</style>

<script>
	$(function() { //ready
		$(".playbutten").click(function() {

			var buttonSnumVal = $(this).attr('value')+',';

			url = "playlist";
			window.open(url, "playlistView",
							"toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=340,height=720");
			$('.musiclistForm').attr('action', url);
			$('.musiclistForm').attr('method', "post");
			$('.musiclistForm').attr('target', "playlistView");

			// 항목 추가
			var addsnumVal = $('input[name=snumVal]').val();
			console.log('addsnumVal => ' + addsnumVal);
			if (addsnumVal != null) {
				$('input[name=snumVal]').attr('value',
						addsnumVal + buttonSnumVal);
			} else {
				$('input[name=snumVal]').attr('value',
						buttonSnumVal);
			}

			$('.musiclistForm').submit();
		});
	});//click
</script>
</head>
<body>
	<c:if test="${message != null}">
		<h3 align="center" id="headname">${message}</h3>
	</c:if>
	<div>
		<form name="musiclistForm">
			<input type="hidden" id="snumVal" name="snumVal" value="${snumValSession}">
		</form>
		<div align="right">
			<a href="chart?part=${message}">더보기</a>
		</div>
		<table id="table">
			<tr class="category" align="center" height="2" bgcolor="ghostwhite">
				<td width="40">순 위</td>
				<td colspan="2">곡정보</td>
				<td width="40">듣 기</td>
			</tr>
			<c:forEach var="row" items="${Banana}" varStatus="vs" step="1">
				<tr>
					<td class="rnum" align="center">${row.rnum}</td>
					<td>
						<img class="albumimage" src="${row.image}">
					</td>
					<td>
						<div class="playbutten textoverflow" value="${row.snum}">${row.sname}</div>
						<div class="singername textoverflow">${row.singername}</div>
					</td>
					<td align="center">
						<button type="button" class="playbutten" name="sname" value="${row.snum}">
							<img src="resources/image/play_icon.png" width="30" height="30">
						</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>