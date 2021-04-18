<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** G-MUSIC 차트 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/topmenu.js"></script>
<script src="resources/myLib/footer.js"></script>
<style>
body {
	margin: 0;
}

hr {
	margin-top: 0px;
	margin-bottom: 0px;
}

a {
	text-decoration: none;
	color: black;
}

/* header */
#header {
	background-color: silver;
	height: 40px;
	width: 100%;
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
/* header */

/* nav */
#nav {
	height: 160px;
	background-color: ghostwhite;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
	border-bottom-width: 3px;
	border-bottom-color: navy;
	border-bottom-style: solid;
}

#keyword {
	margin-bottom: 25px;
}

#searchBtn {
	margin-bottom: 25px;
}

#logofont {
	font-family: 'Chela One', cursive;
}

#searchdiv {
	height: 80px;
}

#topmenu {
	position: absolute;
	z-index: 100;
	background-color: ghostwhite;
	height: 80px;
	width: 75%;
}

#topmenu ul {
	list-style: none;
}

#topmenu ul ul {
	display: none;
}

#topmenu ul li a:hover {
	color: hotpink;
}

#topmenu ul li:hover ul {
	display: table-row-group;
	background-color: ghostwhite;
}

#topmenu>ul>li {
	float: left;
	margin-left: 15px;
}

#topmenu ul a {
	line-height: 30px;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: gray;
	padding: 5px;
}

@media ( max-width :1200px) {
	#topmenu>ul>li {
		margin-left: 1px;
	}
}

/* nav */

/* section */
#headname {
	text-transform: uppercase;
}

#chart {
	width: 75%;
	text-align: center;
	margin: 0 auto;
}

#playbutten {
	background-color: transparent !important;
	border: none; /* 버튼 보더 없애기 */
}

#textoverflow {
	white-space: nowrap; /* 제목을 1렬로 정렬 */
	text-overflow: ellipsis; /* 정렬시 제목이 일정칸 이상이라면 ...으로 표시 */
	text-align: left;
}

#line {
	margin-top: 4px;
	margin-bottom: 4px;
}
/* section  */

/*footer---------------------------- */
#footer {
	height: 100px;
	background-color: ghostwhite;
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
</style>

<script>
	$(function() { //ready
		$("button[name=sname]")
				.click(
						function() {

							var buttonSnumVal = $(this).val();
							console.log(buttonSnumVal)
							url = "playlist";
							window
									.open(url, "myview",
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

	<div id="header">
		<ul id="headermenu">
			<!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
			<!-- <li>로그아웃</li> -->

			<li><button>
					<a href="javascript:;">이용권구매</a>
				</button></li>
			<c:if test="${loginID == null}">
				<li><button>
						<a href="memberloginpage">로그인</a>
					</button></li>
				<li><button>
						<a href="checkterm">회원가입</a>
					</button></li>
			</c:if>
			<c:if test="${loginID != null}">
				<li><button>
						<a href="mlogout">로그아웃</a>
					</button></li>

				<li><button>
						<a href="mypage?id=${loginID}"> 마이페이지</a>
					</button></li>
			</c:if>
		</ul>
	</div>
	<div id="nav">
		<div id="searchdiv">
			<a href="home" id="logofont">GMUSIC</a>
			<input type="text" name="keyword" id="keyword" maxlength="10" size="50" style="vertical-align: middle;">
			<button id="searchBtn" style="vertical-align: middle;">Search</button>
		</div>
		<hr>
		<div id="topmenu"></div>
		<!-- topmenu -->
	</div>
	<div id=section>
		<c:if test="${part != null}">
			<h1 align="center" id="headname">${part}</h1>
		</c:if>
		<form name="musiclist">
			<input type="hidden" id="snumVal" name="snumVal" value="">
			<table border="1" id="chart">
				<tr align="center" height="2" bgcolor="pink">
					<td width="40">순 위</td>
					<td>앨 범</td>
					<td>곡 명</td>
					<td>재 생</td>
				</tr>
				<c:forEach var="row" items="${Banana}" varStatus="vs">
					<tr>
						<td>${row.rnum}</td>
						<td>
							<img src="${row.image}" width="60" height="60">
						</td>
						<td id=textoverflow>${row.sname}
							<hr id="line">${row.singername }
						</td>
						<td>
							<button type="button" id="playbutten" name="sname" value="${row.snum}">
								<img src="resources/image/play.jpg" width="60" height="60">
							</button>
						</td>
					</tr>
				</c:forEach>

			</table>
		</form>
	</div>
	<div align="center">
		<!-- ver 01 : pageMaker.makeQuery(?) -->
		<!-- ver 02 : pageMaker.searchQuery(?) -->
		<!-- 1) First << , Prev < : enabeld 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="dailyChart${pageMaker.makeQuery(1)}&part=jsp">&#8666;</a>&nbsp; <!-- First -->
			<!-- "qna?currPage=1" -->
			<a href="dailyChart${pageMaker.makeQuery(pageMaker.sPageNo-1)}&part=jsp">&#8636;</a>
			<!-- Prev -->
		</c:if>

		<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="dailyChart${pageMaker.makeQuery(i)}&part=jsp">${i}</a>&nbsp;
					</c:if>
		</c:forEach>

		<!-- 3) Next > , Last >> : enabled 여부 -->
		<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="dailyChart${pageMaker.makeQuery(pageMaker.ePageNo+1)}&part=jsp">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
			<a href="dailyChart${pageMaker.makeQuery(pageMaker.lastPageNo)}&part=jsp">&#8667;</a>&nbsp;&nbsp; <!-- Last -->

		</c:if>
	</div>
	<div id="footer">
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
	</div>


</body>
</html>