<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${Apple.sname} - ${Apple.singername}</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>
/* 중앙정렬코드 */
.layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
}

.layer .content {
	display: inline-block;
	vertical-align: middle;
	text-align: left;
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}
/* 배경색 */
body {
	background-color: ghostwhite;
}

/* 가사 textarea css */
#lyrics {
	resize: none;
	width: 400px;
	height: 500px;
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size: 14px;
}

/* 클릭후 포커스 없애기 */
#lyrics:focus {
	outline: none;
}
</style>
<c:if test="${message!=null}">
	<script>
		alert('${message}');
	</script>
</c:if>
</head>
<body>
	<div class="layer">
		<span class="content"> <textarea id="lyrics" readonly="readonly">
<c:choose><c:when test="${Apple.lyrics!=null}">${Apple.lyrics}</c:when><c:otherwise>가사가 없습니다</c:otherwise></c:choose></textarea>
		</span> <span class="blank"></span>
	</div>
</body>
</html>