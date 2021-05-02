<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TopMenu</title>
</head>
<body>
	<ul id="navTopmenu">
		<li><a href="notice">공지사항 </a>
		<li><a href="musiclist">최신음악</a>
		<li><a href="javascript:;">순위차트</a>
			<ul>
				<li><a href="chart?part=DAILY">일간차트</a>
				<li><a href="chart?part=WEEKLY">주간차트</a>
				<li><a href="chart?part=MONTHLY">월간차트</a>
			</ul>
		<li><a href="javascript:;">장르음악</a>
			<ul>
				<li><a href="genrelist?genre=dance">댄스</a>
				<li><a href="genrelist?genre=ballad">발라드</a>
				<li><a href="genrelist?genre=rap">랩/힙합</a>
				<li><a href="genrelist?genre=rnb">R&B/Soul</a>
				<li><a href="genrelist?genre=indie">인디</a>
				<li><a href="genrelist?genre=rock">록/메탈</a>
				<li><a href="genrelist?genre=trot">트로트</a>
				<li><a href="genrelist?genre=jazz">재즈</a>
			</ul>
		<li><a href="javascript:;">고객센터</a>
			<ul>
				<li><a href="qna">1:1 문의</a>
				<li><a href="faq">FAQ</a>
			</ul>
	</ul>
</body>
</html>