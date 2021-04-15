<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글수정 Form</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/footer.js"></script>
<style type="text/css">
<
style>.title {
	display: block;
	margin: 71px 0 0;
	font-size: 40px;
	color: #1f284f;
	font-weight: 400;
	line-height: 1;
	text-align: center;
	height: 84px;
}

a {
	color: black;
	text-decoration: none;
}

.menu a { /* 클릭했을때 리스트 나오게끔 */
	cursor: pointer;
	font-weight: 400;
	font-size: 25px;
	padding: 30px 28px 5px 79px;
}

toplist {
	list-style: none; /*  리스트 할때 점을 없애려고 추가 여기 한줄*/
	display: block;
	font-size: 50px;
	color: #000;
	padding: 35px 1px 9px 0px; /* 여기수정 */
	position: relative;
}

#seqbody {
	list-style: none;
	padding: 35px 1px 9px 0px; /* 여기수정 */
}

.seq {
	font-size: 50px;
}

li.menu {
	padding: 35px 103px 9px 0px;
}

li.menu2 {
	padding: 35px 103px 9px 0px;
}

#input {
	padding: 3px 133px 21px 294px;
	font-size: 16px;
}

.button {
	background-color: #0b3f9a;
	color: #fff;
	padding: 5px;
	width: 150px;
	height: 40px;
}

#wrap_updatef {
	text-align: center;
}
/* ---------------------- */
/* header */
header {
	background-color: black;
	height: 40px;
	margin: 0 auto;
	width: 75%;
}

#headermenu {
	float: right;
	list-style: none;
	margin: 8px 8px 8px 8px;
}

#headermenu>li {
	display: inline;
}
/* nav */
nav {
	background-color: ghostwhite;
	border-bottom-width: 3px;
	border-bottom-color: navy;
	border-bottom-style: solid;
	margin: 0 auto;
	width: 75%;
	height: 70px; /* 변경 */
	padding-top: 1px;
}
/* body */
body {
	margin: 0;
}

section {
	margin: 0 auto;
	width: 75%;
	height: 600px;
}
/* topmenu(nav) */
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

footer {
	border-top-style: solid;
	border-top-color: navy;
	border-top-width: 1px;
}
/*footer---------------------------- */
footer {
	height: 100px;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
}

#footerinfo {
	text-align: center;
	padding-top: 15px;
	margin-bottom: 10px;
	font-size: 20px;
	font-family: "Cute Font", sans-serif;
}

#footerlist {
	text-align: center;
	padding-bottom: 10px;
	font-family: "Cute Font", sans-serif;
	font-size: 15px;
	padding-bottom: 10px;
}

#footerbar {
	font-size: 5px;
}
/*footer---------------------------- */
/* 반응형 미디어 쿼리 */
@media ( max-width :650px) {
}
</style>

</head>
<body>
	<c:if test="${message!=null}">
		<script>
			alert('${message}');
		</script>
	</c:if>
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
		<ul id="toplist">
			<li><a href="home">메인페이지</a>
			<li><a href="notice">공지사항</a>
			<li><a href="qna">1대1 문의</a>
			<li><a href="faq" style="color: #0b3f9a; font-size: 25px;">자주묻는 질문</a>
		</ul>
	</nav>
	<!-- -------------- -->
	<section>
		<div class="title"></div>
		<div id="wrap_updatef">
			<form action="fupdate" method="post">
				<ul id="seqbody">
					<!-- readonly="readonly"  -->
					<li class="seq">SEQ&nbsp;<input type="number" name="seq" id="seq" style="text-align: left; border: 0; width: 70px; height: 60px; font-size: 50px" readonly value="${Apple.seq}">
					</li>
					<li class="menu"><img src="resources/image/qq.png" width="70px" height="70px" /> <textarea rows="6" cols="70" name="title">${Apple.title}</textarea></li>
					<li class="menu2"><img src="resources/image/aa.png" width="70px" height="70px" /> <textarea rows="6" cols="70" name="content">${Apple.content}</textarea></li>
				</ul>
				<div id="input">
					<input type="submit" value="전송" class="button">
					&nbsp;&nbsp;
					<input type="reset" value="초기화" class="button">
					&nbsp;&nbsp;
				</div>
			</form>
		</div>
		<c:if test="${message != null}">
            => ${message}
      </c:if>
		<!-- ///////////////////SECTION END////////////////////////////////////////////////////// -->
	</section>
	<!-- -------------- -->
	<footer>
		<div id="footerinfo">
			<a href="javascript:;" class="footergroup" id="introcompany">회사 소개</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="termsp">이용약관</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="privacy">개인정보처리방침</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="youth">청소년보호정책</a>
		</div>
		<div id="footerlist">
			<font>G-MUSIC</font> &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 그린 컴퓨터 아카데미 &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 공동작업 : 김지수, 남철우, 정재필, 정현근 &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 사업자등록번호 : ???-??-????? <br> 문의전화 : 0000-0000 (평일 09:00 ~ 05:00) &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 이메일 : gproject @ naver.com
		</div>
	</footer>

</body>
</html>