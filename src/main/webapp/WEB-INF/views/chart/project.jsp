<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gmusic</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Croissant+One&display=swap"
	rel="stylesheet">
	<!-- 아래두개 넣어줬음 -->
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>   
	<script src="resources/myLib/axPtest01.js"></script>
<style>
a {
	text-decoration: none;
	color: black;
}

body {
	margin: 0;
}

hr {
	margin-top: 0px;
	margin-bottom: 0px;
}

#header {
	background-color: ghostwhite;
	height: 40px;
	width: 100%;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
}

#headermenu {
	float: right;
	list-style: none;
	margin: 8px 8px 8px;
}

#headermenu>li {
	display: inline;
}

#nav {
	height: 160px;
	background-color: ghostwhite;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
}

#menubar {
	padding-top: 15;
	float: left;
	list-style: none;
	height: 40px;
	float: left;
	padding: 0px;
}

#menubar>li {
	display: inline;
}

#menubar>li>a {
	font-family: "Croissant One", sans-serif;
	float: left;
	text-align: center;
	line-height: 50px;
	margin-left: 15px;
}

#section {
	height: 900px;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
	background-color: ghostwhite;
	display: grid;
	grid-template-columns: 2fr 1fr;
}

#section>#sec1 {
	border-right: solid green;
}

#sec1>div {
	border-bottom: solid green;
	height: 299px;
}

#sec1>div>ul>li {
	margin: 0 auto;
	list-style-type: none;
	float: left;
}

#login {
	border-bottom: solid green;
	height: 150px;
	padding: 16px 16px 12px 17px;
	border: 1px solid #dae1e6;
}

#login_btn {
	height: 50px;
	width: 244px;
	margin: 0 auto;
	padding: 50px 88px 47px 13px;
}

#login_button {
	height: 60px;
	width: 322px;
	background-color: #00d344;
	font-size: 20px;
	color: #fff;
}

#chart {
	border-bottom: solid green;
	height: 722px;
	border-top: 1px solid #d8ddde;
	list-style: none;
	font-weight: normal;
}
#footer {
	height: 160px;
	background-color: ghostwhite;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
}

/* 로고 이미지 */
#gm {
	width: 80px;
	height: 80px;
	margin-left: 8px;
	margin-top: 8px;
}

#keyword {
	margin-bottom: 25px;
}

#searchBtn {
	margin-bottom: 25px;
}

#tese {
	font-family: "Croissant One", sans-serif;
	padding-left: 15px;
	padding-right: 15px;
}
</style>
</head>
<body>
	<div id="header">
		<ul id="headermenu">
			<!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
			<!-- <li>로그아웃</li> -->
			<li><button>
					<a href="javascript:;">공지사항/이벤트</a>
				</button></li>
			<li><button>
					<a href="javascript:;">이용권구매</a>
				</button></li>
			<li><button>
					<a href="javascript:;">로그인</a>
				</button></li>
			<li><button>
					<a href="javascript:;">회원가입</a>
				</button></li>
		</ul>

	</div>
	<div id="nav">
		<br>
		<div>
			<font id="tese" size="20">GMUSIC</font> <input type="text"
				name="keyword" id="keyword" maxlength="10" size="50"
				style="vertical-align: middle;">
			<button id="searchBtn" style="vertical-align: middle;">Search</button>
		</div>
		<div>
			<ul id="menubar">
				<li><a href="javascript:;">차트순위</a></li>&nbsp;&nbsp;
				<li><a href="javascript:;">최신음악</a></li>&nbsp;&nbsp;
				<li><a href="javascript:;">장르음악</a></li>&nbsp;&nbsp;
				<li><a href="javascript:;">뮤직비디오</a></li>
			</ul>
		</div>
	</div>

	<div id="section">
		<div id="sec1">
			<div>
				<a href="javascript:;">선호장르음악&nbsp;&gt;</a>

				<ul>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
					</li>
				</ul>
			</div>
			<div>
				<a href="javascript:;">최신음악&nbsp;&gt;</a>

				<ul>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
					</li>
				</ul>
			</div>
			<div>
				<a href="javascript:;">뮤직비디오&nbsp;&gt;</a>
				<ul>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
						&nbsp;&nbsp;&nbsp;</li>
					<li><img src="./image/IU1.JPG" width="200" height="200">
					</li>
				</ul>
			</div>
		</div>
		<!-- 로그인 버튼 -->
		<div id="sec2">
			<div id="login" button type="button">
				<div id="login_btn">
					<button type="button" id="login_button">로그인</button>
				</div>
			</div>
			
			<!-- 일일,주간,월간 차트리스트 -->
			<div id="chart" role="group">
				<h3>** G-MUSIC 차트 **</h3>
				<hr>
				<!-- <span id="dlist" class="textLink">[일일차트]</span> &nbsp;&nbsp; -->
				<span id="pmlist" class="textLink">[일일차트]</span> &nbsp;&nbsp; <span
					id="wlist" class="textLink">[주간차트]</span>&nbsp;&nbsp; <span
					id="monlist" class="textLink">[월간차트]</span>&nbsp;&nbsp; <a
					href="home">[Home]</a>&nbsp;&nbsp;
				<hr>
				<div id="dlistArea1"></div>
				<div id="wlistArea2"></div>
				<div id="monlistArea3"></div>
			</div>
		</div>
	</div>

	<div id="footer"></div>
</body>
</html>
