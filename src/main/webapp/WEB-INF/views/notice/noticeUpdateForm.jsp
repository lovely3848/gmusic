<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시판(글수정)</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
   rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/footer.js"></script>
<style type="text/css">
.leftbar{color:white;
	font-weight: bold;
	background-color: #0b3f9a;
	text-align: center;
	width:70px;
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
   margin:0 auto;
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
   margin:0 auto;
   width: 75%;
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
footer{
border-top-style:solid;
border-top-color:navy;
border-top-width:1px;
	
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
@media(max-width:650px) {
	
}
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
		<li><a href="qna">1대1 문의</a>
		<li><a href="faq">자주묻는 질문</a>
	</ul>
</nav>
<section>
<!-- /////////////////SECTION START//////////////////////////////////////////////////////// -->
<h1>게시글 수정</h1>
<form action="boardupdate" method="post"><table>
  <tr><th class="leftbar" colspan="2">${Apple.title}</th></tr>
  <tr height="40"><td class="leftbar">No.</td>
  	  <td><input type="text" name="seq" id="seq" readonly value="${Apple.seq}" style="border: none;"></td>
  	  <!-- disabled: value가 서버로 전송되지않음 , readonly: value가 서버로 전송됨 -->
  </tr>
  <tr height="40"><td class="leftbar">글쓴이</td>
  	  <td>${Apple.id}</td>
  </tr>
  <tr height="40"><td class="leftbar">제목</td>
	<td><input type="text" name="title" value="${Apple.title}" maxlength="100"></td>
  </tr>
  <tr height="40"><td class="leftbar">내용</td>
	<td><textarea rows="10" cols="40" name="content"maxlength="2000">${Apple.content}</textarea></td>
  </tr>
  <tr height="40"><td class="leftbar">작성일자</td>
  	  <td>${Apple.regdate}</td>
  </tr>
 <tr height="40"><td class="leftbar">조회수</td>
  	  <td>${Apple.count}</td>
  </tr>
  <tr height="40"><td></td>
  	  <td><input type="submit" value="전송">&nbsp;&nbsp;
  	      <input type="reset" value="취소">&nbsp;&nbsp;
  </tr>
</table></form>
<hr>
<a href="#" onClick="history.back()">이전페이지</a>&nbsp;&nbsp; 
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