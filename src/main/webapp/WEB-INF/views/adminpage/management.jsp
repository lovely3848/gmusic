<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/management.js"></script>
<style>
h1 {
	color: #0b3f9a;
}

a {
	color: black;
	text-decoration: none;
}

header {
	background-color: black;
	height: 40px;
	margin: 0 auto;
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
/* topmenu(nav) */
nav {
	background-color: ghostwhite;
	border-bottom-width: 3px;
	border-bottom-color: navy;
	border-bottom-style: solid;
	margin: 0 auto;
	width: 75%;
	height: 70px;
	padding-top: 1px;
}

nav ul {
	list-style: none;
}

nav ul ul {
	display: none;
}

nav ul li a:hover {
	color: #0b3f9a;
}

nav ul li:hover ul {
	display: table-row-group;
	background-color: ghostwhite;
}

nav>ul>li {
	float: left;
	margin-left: 30px;
}

nav ul a {
	line-height: 30px;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: gray;
	padding: 5px;
}
/*nav  */
/* ----------------섹션---------------- */
section {
	margin: 0 auto;
	width: 75%;
	height: 100%;
	padding-top: 20px;
}

/*------------------------------------------------------- */
</style>

</head>
<body>
	<header>
		<a href="home">
			<img src="resources/uploadImage/gm.png" width="40px" height="40px">
		</a>
		<ul id="headermenu">
			<!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
			<!-- <li>로그아웃</li> -->
			<li><button>
					<a href="javascript:;">이용권구매</a>
				</button></li>
			<c:if test="${loginID == null}">
				<li><button>
						<a href="memberloginpage?jcode=Q">로그인</a>
					</button></li>
				<li><button>
						<a href="checkterm?jcode=Q">회원가입</a>
					</button></li>
			</c:if>
			<c:if test="${loginID != null}">
				<li><button>
						<a href="mlogout?jcode=Q">로그아웃</a>
					</button></li>
				<li><button id="mypage">
						<a href="mypage?id=${loginID}"> 마이페이지</a>
					</button></li>
			</c:if>
		</ul>
	</header>
	<nav>
		<ul>
			<li><a href="home">메인페이지</a>
			<li><a id="membermanagementajax">회원관리</a>
			<li><a id="musicinsertf">음악추가</a>
		</ul>
	</nav>
	<div id="section"></div>
</body>
</html>