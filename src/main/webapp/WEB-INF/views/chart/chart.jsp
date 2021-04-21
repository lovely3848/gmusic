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

#chart {
	height: 50px;
	width: 100%;
	margin: 0 auto;
}

#playbutten {
	background-color: transparent !important;
	border: none;
}

#textoverflow {
	width: 50px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<script>
	$(function() { //ready
		$("button[name=sname]").click(function() {

			var buttonSnumVal = $(this).val();
			console.log(buttonSnumVal)
			url = "playlist";
			window.open(url, "myview",
							"toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");

			document.musiclist.action = url;
			document.musiclist.method = "post";
			document.musiclist.target = "myview";

			$('input[name=snumVal]').attr('value',
					buttonSnumVal);
			document.musiclist.submit();
		}); // playlist
	});//click
</script>
</head>
<body>
	<c:if test="${message != null}">
		<h3 align="center" id="headname">${message}</h3>
	</c:if>
	<div>
		<form name="musiclist">
			<input type="hidden" id="snumVal" name="snumVal" value="">
		</form>
		<div align="right">
			<a href="chart?part=${message}">더보기</a>
		</div>
		<table border="1" id="chart">
			<tr align="center" height="2" bgcolor="pink">
				<td width="40">순 위</td>
				<td>앨 범</td>
				<td>곡 명</td>
				<td>재 생</td>
			</tr>
			<c:forEach var="row" items="${Banana}" varStatus="vs" step="1">
				<tr>
					<td>${row.rnum}</td>
					<td>
						<img src="${row.image}" width="40" height="30">
					</td>
					<td id=textoverflow>${row.sname}</td>
					<td>
						<button type="button" id="playbutten" name="sname" value="${row.snum}">
							<img src="resources/image/play.jpg" width="30" height="30">
						</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>