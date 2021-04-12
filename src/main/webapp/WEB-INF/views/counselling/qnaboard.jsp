<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시판</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
   rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/footer.js"></script>
<script>
/* $(document).ready(function(){.......}); */
$(function(){
	// SearchType에 '---'인 keyword클리어
	$('#searchType').change(function(){
		if($(this).val() == 'n'){
			$('#keyword').val('');
		}
	});
	$('#searchBtn').on("click",function(){
		self.location="qna"
					+"${pageMaker.makeQuery(1)}"
					+"&searchType="
					+$('#searchType').val()
					+"&keyword="
					+$('#keyword').val();
		// => ?currPage=7&rowPerPage=10&searchType=tc&keyword=java
	}); //click
});//ready
</script>
<style type="text/css">
.leftbar{color:white;
	font-weight: bold;
	background-color: #0b3f9a;
}
a {
   text-decoration: none;
   color: black;
}
th{color:white;
  height:50px;
}
table{
  width:100%
}
textarea{
  width:100%
}
h1{ text-align: center;font-size:50px; margin-top:20px; margin-bottom:20px;
   color: #0b3f9a; 
}
/* header */
header {
   background-color: black;
   height: 40px;
   width: 75%;
   margin:0 auto;
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
   width: 75%;
   margin:0 auto;
   height: 70px;
   padding-top: 1px;
}
/* body */
body{
	margin:0;
}
section{
   margin: 0 auto;
   width: 75%;
   height: 450px;
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
/*footer---------------------------- */
footer {
border-top-style:solid;
border-top-color:navy;
border-top-width:1px;
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
/* 반응형 미디어 쿼리 */
@media(max-width:650px) {
	#searchType{width:100px;}
	#keyword{width:120px;
	}
}
/*footer---------------------------- */
</style>
</head>
<body>
<c:if test="${message!=null}">
	<script>
		alert('${message}');
	</script>
</c:if>
<header><a href="home"><img src="resources/uploadImage/gm.png" width="40px" height="40px"></a>
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
		<li><a href="javascript:;" onClick="location.reload()">1대1 문의</a>
		<li><a href="faq">자주묻는 질문</a>
	</ul>
</nav>
<section>
<!-- /////////////////SECTION START//////////////////////////////////////////////////////// -->
	
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected' : ''}" /> >
		검색옵션</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected' : ''}" /> >
		제목</option>
		<option value="w" <c:out value="${pageMaker.cri.searchType=='w' ? 'selected' : ''}" /> >>
		글쓴이</option>
		<option value="tw" <c:out value="${pageMaker.cri.searchType=='tw' ? 'selected' : ''}" /> >>
		제목이나 글쓴이</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
	<input type="reset" value="Reset"><!-- 쓸모없음. 구동안됨 -->
</div>
<br>
<table style="width: 100%">
	<tr align="center" height="30" bgcolor="#0b3f9a">
	<th>No.</th><th>제목</th><th>글쓴이</th><th>작성일자</th><th>조회수</th>
	</tr>
  <c:forEach var="row" items="${Banana}">
	<tr>
		<td>${row.seq}</td>
		<td>
			<!-- 답글 구분 -->
			<c:if test="${row.step != 0}"> 
				<span style="color:#0b3f9a; background-color: ghostwhite;">&nbsp;&nbsp;&nbsp;답변&nbsp;&nbsp;</span>
			</c:if>
			<a href="bdetail?seq=${row.seq}" style="font-weight: bold;">${row.title}</a>
		</td>
		<td>${row.id}</td><td>${row.regdate}</td><td>${row.count}</td>
	</tr>
  </c:forEach>
</table>
<br><hr>
<!-- Paging 추가 
 	 => view1 
<div align="center">
	<c:forEach var="i" begin="1" end="${totalPageNo}">
		 currPage : 강조 , Link 필요없음 / 아니면 : Link 적용 
		<c:if test="${i==currPage}">
			<font size = "5" color="Orange" >${i}&nbsp;</font>
		</c:if>
		<c:if test="${i!=currPage}">
			<a href="bpage?currPage=${i}">${i}&nbsp;</a>
		</c:if>
	</c:forEach>
</div>
-->
<!-- ** page Criteria 추가
	1) First << , Prev < : enabeld 여부
	2) sPage~ePage까지 displayPageNo 값 만큼 출력
	3) Next > , Last >> : enabled 여부
   -->
<div  align="center">
	<!-- ver 01 : pageMaker.makeQuery(?) -->
	<!-- ver 02 : pageMaker.searchQuery(?) -->
<!-- 1) First << , Prev < : enabeld 여부 -->
	<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
		<a href="qna${pageMaker.searchQuery(1)}">&#8666;</a>&nbsp; <!-- First -->
		<!-- "qna?currPage=1" -->
		<a href="qna${pageMaker.searchQuery(pageMaker.sPageNo-1)}">&#8636;</a> <!-- Prev -->
	</c:if>

<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
	<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="qna${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
		
		<!-- 삼항식과 비교 
		<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
		-->
	</c:forEach>

<!-- 3) Next > , Last >> : enabled 여부 -->
	<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
		<a href="qna${pageMaker.searchQuery(pageMaker.ePageNo+1)}">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
		<a href="qna${pageMaker.searchQuery(pageMaker.lastPageNo)}">&#8667;</a>&nbsp;&nbsp; <!-- Last -->
		
	</c:if>
</div>
<hr>
<c:if test="${loginID!=null}">
	<a href="binsertf">[새글등록]</a>&nbsp;
</c:if>
	
<!-- ///////////////////SECTION END////////////////////////////////////////////////////// -->
</section>
<footer>
	<div id="footerinfo">
         <a href="javascript:;" class="footergroup" id="introcompany">회사
            소개</a>&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; <a
            href="javascript:;" class="footergroup" id="termsp">이용약관</a>&nbsp;&nbsp;
         <font class="footerbar">|</font> &nbsp;&nbsp; <a href="javascript:;"
            class="footergroup" id="privacy">개인정보처리방침</a>&nbsp;&nbsp; <font
            class="footerbar">|</font> &nbsp;&nbsp; <a href="javascript:;"
            class="footergroup" id="youth">청소년보호정책</a>
      </div>
      <div id="footerlist">
         <font>G-MUSIC</font> &nbsp;&nbsp; <font class="footerbar">|</font>
         &nbsp;&nbsp; 그린 컴퓨터 아카데미 &nbsp;&nbsp; <font class="footerbar">|</font>
         &nbsp;&nbsp; 공동작업 : 김지수, 남철우, 정재필, 정현근 &nbsp;&nbsp; <font
            class="footerbar">|</font> &nbsp;&nbsp; 사업자등록번호 : ???-??-????? <br>
         문의전화 : 0000-0000 (평일 09:00 ~ 05:00) &nbsp;&nbsp; <font
            class="footerbar">|</font> &nbsp;&nbsp; 이메일 : gproject @ naver.com
      </div>
</footer>
</body>
</html>