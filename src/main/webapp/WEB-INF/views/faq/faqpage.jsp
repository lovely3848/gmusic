<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/footer.js"></script>
<!-- https://stove99.tistory.com/103  여기 사이트 참고해서 클릭시 슬라이드로 내려가게끔 -->

<style>
a {
	color: black;
	text-decoration: none;
}

#totalList { /* ul 부분 */
	list-style: none;
}

.menu {
	cursor: pointer;
}

#Q { /* menu li부분 Q쪽 */
	font-weight: bold;
	display: block;
	font-size: 16px;
	color: #000;
	position: relative;
}

.hide { /* hide ol부분 A쪽 */
	list-style: none;
	position: relative;
	display: none;
	font-size: 16px;
}

#searchBar {
	height: 50px;
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
/* nav */
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
/* body */
body {
	margin: 0;
}

section {
	margin: 0 auto;
	width: 75%;
	height: 100%;
	padding-top: 20px;
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

<script>
	/* 이미지 클릭했을시 슬라이드 형식으로 내려가게 하는게 하는 스크립트 */
	$(document).ready(function() {
		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			var submenu = $(this).next("ol");

			// submenu 가 화면상에 보일때는 위로 접고 아니면 아래로  펼치기
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});

	/*  ---------------검색창------------------ */
	$(function() {
		// SearchType 이 '---' 면 keyword 클리어
		$('#searchType').change(function() {
			if ($(this).val() == 'n') {
				$('#keyword').val('');
			}
		});
		$('#searchBtn').on(
				"click",
				function() {
					self.location = "faq" + "${pageMaker.makeQuery(1)}"
							+ "&searchType=" + $('#searchType').val()
							+ "&keyword=" + $('#keyword').val();
				}); //click 

	}); //ready
</script>

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
		<ul>
			<li><a href="home">메인페이지</a>
			<li><a href="notice">공지사항</a>
			<li><a href="qna">1대1 문의</a>
			<li><a href="javascript:;" onClick="location.reload()" style="color: #0b3f9a; font-size: 25px;">자주묻는 질문</a>
		</ul>
	</nav>
	<!-- -------------- -->
	<section>
		<h3>고객센터</h3>

		<!--------------------------------------검색창-------------------------------------------->
		<div id="searchBar">
			<select name="searchType" id="searchType">
				<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected' : ''}"/>>Title</option>
				<option value="c" <c:out value="${pageMaker.cri.searchType=='c' ? 'selected' : ''}"/>>Content</option>
				<option value="tc" <c:out value="${pageMaker.cri.searchType=='tc' ? 'selected' : ''}"/>>Title or Content</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
			<button id="searchBtn">Search</button>
		</div>
		<!-------------------------------------- main  title , content 부분 -------------------------------->
		<div>
			<ul style="padding-left: 0px;" id="totalList">
				<c:forEach var="Apple" items="${Banana}">
					<li class="menu"><a id="Q">
							<img src="resources/image/qq.png" width="15px" height="15px" /> ${Apple.title}
							<c:if test="${loginGRADE=='admin'}">
                  &nbsp; <a href="fdetail?seq=${Apple.seq}&jcode=U">FAQ수정</a>
                  &nbsp;  <a href="fdelete?seq=${Apple.seq}">글삭제</a>&nbsp;
            </c:if>
						</a> <c:if test="${loginGRADE!='admin'}">
							<!-- 관리자로 로그인시 list 숨기는거 조건을줌 -->
							<ol class="hide">
						</c:if>
					<li><img src="resources/image/aa.png" width="15px" height="15px" /> ${Apple.content}</li>
					</ol>
					</li>
					<hr align="center" style="width: 100%;">
				</c:forEach>
			</ul>
		</div>

		<!-- ------------------페이징---------------------------->
		<!--** Page Criteria 추가   
    1) First << ,  Prev < : enabled 여부
    2) sPage~ePage 까지 displayPageNo 값 만큼 출력, 
    3) Next >  ,   Last >> : enabled 여부
   -->
		<div align="center" style="font-size: 20px;">
			<!-- ** ver01 : pageMaker.makeQuery(?) -->
			<!-- ** ver02 : pageMaker.searchQuery(?)  -->
			<!-- 1) First << ,  Prev < : enabled 여부 -->
			<c:if test="${pageMaker.prev && pageMaker.sPageNo>1 }">
				<a href="faq${pageMaker.searchQuery(1)}">First</a>&nbsp;  
      <!-- "bpage?currPage=1" -->
				<a href="faq${pageMaker.searchQuery(pageMaker.sPageNo-1)}">Prev</a>&nbsp;&nbsp;
   </c:if>

			<!-- 2) sPage~ePage 까지 displayPageNo 값 만큼 출력, -->
			<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
				<c:if test="${i==pageMaker.cri.currPage}">
					<font size="5" color="Orange">${i}&nbsp;</font>
				</c:if>
				<c:if test="${i!=pageMaker.cri.currPage}">
					<a href="faq${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
      </c:if>
				<!-- 삼항식과 비교  
      <c:out value="${i==pageMaker.cri.currPage ? 'class=active' : '' }"/>
      -->
			</c:forEach>

			<!-- 3) Next >  ,   Last >> : enabled 여부    -->
			<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
				<a href="faq${pageMaker.searchQuery(pageMaker.ePageNo+1)}">&nbsp;&nbsp;Next</a>&nbsp;  
      <a href="faq${pageMaker.searchQuery(pageMaker.lastPageNo)}">Last</a>&nbsp;&nbsp;
   </c:if>
		</div>
		<!-- ///////////////////SECTION END////////////////////////////////////////////////////// -->
	</section>
	<br>

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