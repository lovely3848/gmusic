<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색음악</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="resources/myLib/footer.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<style>
#logo {
   font-size: 20;
   color: #0b3f9a;
   font-family: 'Chela One', cursive;
}

#searchBtn {
   margin-bottom: 3px;
}

#logofont {
   font-family: 'Chela One', cursive;
}

#searchdiv {
   height: 80px;
   padding: 22px 262px 10px 262px;
   /* height: 50px; */
}

#musicSearch {
   margin: 64px 262px -8px;
}

#totalSearch {
   text-align: right;
}

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
   $(function() { //ready

      // input checkbox
      // https://emessell.tistory.com/149 참고
      //1. 전체 선택, 전체 해제
      $("#check_all_1").click(function() {

         var checked = $(this).is(":checked");

         if (checked) {
            $(".normalCheck_1").prop('checked', true);
         } else {
            $(".normalCheck_1").prop('checked', false);
         }
      });
   
      $("#check_all_2").click(function() {

          var checked = $(this).is(":checked");

          if (checked) {
             $(".normalCheck_2").prop('checked', true);
          } else {
             $(".normalCheck_2").prop('checked', false);
          }
       });
      
      $("#check_all_3").click(function() {

          var checked = $(this).is(":checked");

          if (checked) {
             $(".normalCheck_3").prop('checked', true);
          } else {
             $(".normalCheck_3").prop('checked', false);
          }
       });
      
      $("#check_all_4").click(function() {

          var checked = $(this).is(":checked");

          if (checked) {
             $(".normalCheck_4").prop('checked', true);
          } else {
             $(".normalCheck_4").prop('checked', false);
          }
       });
/* -------------------------------------------전체선택 end---------------------------------------------------------- */
      // 2. 전체선택 후 하나만 해제했을 때, 전체선택도 해체
      // 3. 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
      $(".normalCheck_1").click(function() {
         var checked = $(this).is(":checked");
         if (!checked) {
            $("#check_all_1").prop('checked', false);
         } else {
            var is_checked = true;
            $(".normalCheck_1").each(function() {
               is_checked = is_checked && $(this).is(":checked");
            });
            $("#check_all_1").prop("checked", is_checked);
         }
      });//1
      
      $(".normalCheck_2").click(function() {
          var checked = $(this).is(":checked");
          if (!checked) {
             $("#check_all_2").prop('checked', false);
          } else {
             var is_checked = true;
             $(".normalCheck_2").each(function() {
                is_checked = is_checked && $(this).is(":checked");
             });
             $("#check_all_2").prop("checked", is_checked);
          }
       });//2
      
      $(".normalCheck_3").click(function() {
          var checked = $(this).is(":checked");
          if (!checked) {
             $("#check_all_3").prop('checked', false);
          } else {
             var is_checked = true;
             $(".normalCheck_3").each(function() {
                is_checked = is_checked && $(this).is(":checked");
             });
             $("#check_all_3").prop("checked", is_checked);
          }
       });//3
      
      $(".normalCheck_4").click(function() {
          var checked = $(this).is(":checked");
          if (!checked) {
             $("#check_all_4").prop('checked', false);
          } else {
             var is_checked = true;
             $(".normalCheck_4").each(function() {
                is_checked = is_checked && $(this).is(":checked");
             });
             $("#check_all_4").prop("checked", is_checked);
          }
       });
      
     /* -----------------------------------단일선택 end------------------------------------- */
      // 곡명 버튼 눌렀을때 실행 
      // 플레이 리스트에 단일로 실행됨
      $("button[name=sname]").click(function() {
         var buttonSnumVal = $(this).val();
         url = "playlist";
         window.open(url, "myview",
                     "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
       
         document.musicSearch.action =url;
         document.musicSearch.method="post";
         document.musicSearch.target="myview";
         
         $('input[name=snumVal]').attr('value',buttonSnumVal);
      
         document.musicSearch.submit();
      });
   });//ready *
   
   
   // window.open post 방식으로 전달하기
   // https://darkhorizon.tistory.com/284 참고
   // 체크박스(checkbox)에 선택 된 값 출력하기
   // https://hianna.tistory.com/430 참고
   function getCheckboxValue()  {
      // 선택된 목록 가져오기
      const query = 'input[name="snum"]:checked';
      const selectedEls = document.querySelectorAll(query);
   
      // 선택된 목록에서 value 찾기
      let result = '';
      selectedEls.forEach((el) => {
      result += el.value + ',';
      });
      
      url = "playlist";
      window.open(url, "myview",
                  "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
    
      document.musicSearch.action =url;
      document.musicSearch.method="post";
      document.musicSearch.target="myview";
      
      // 항목 추가 실험중 넣으면 항목 추가됨
      //var addsnumVal = $('input[name=snumVal]').val();
      //if (addsnumVal != null) {
      //   $('input[name=snumVal]').attr('value',addsnumVal+result);
      //}else{
         $('input[name=snumVal]').attr('value',result);
      //}
      document.musicSearch.submit();
   }
</script>

<script type="text/javascript">
$(function(){
   $('#searchBtn').on("click",function(){
      self.location="mSearch"
                +"?currPage=1" 
               /* +"${pageMaker.makeQuery(1)}" */
               +"&searchType="
               +$('#searchType').val()
               +"&keyword="
               +$('#keyword').val();
      // => ?currPage=7&rowPerPage=10&searchType=tc&keyword=java
   }); //click
});//ready

</script>


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
         <li><a href="home">메인 페이지</a>
         <li><a href="javascript:;" onClick="location.reload()" style="color: #0b3f9a; font-size: 25px;">통합 검색</a>
         <li ><a href="mSearch?keyword=${UserKeyword}&searchType=sname">곡 검색</a>
         <li><a href="mSearch?keyword=${UserKeyword}&searchType=singername">아티스트 검색</a>
         <li><a href="mSearch?keyword=${UserKeyword}&searchType=lyrics">가사 검색</a>
      </ul>
   </nav>
   <br>

   <div id="searchdiv">
      <div id="logo">
         <h1>GMUSIC</h1>
         <form action="mSearch" id="search" name="search" class="search">

            <select name="searchType" id="searchType" style="display: none">
               <option value="all" selected>All</option>
            </select>
            <input type="text" name="keyword" id="keyword" maxlength="35" size="50" style="vertical-align: middle;" value="${UserKeyword}">
            <button type="button" id="searchBtn" style="vertical-align: middle;">Search</button>
         </form>
      </div>
   </div>

   <form id="musicSearch" name="musicSearch" align="center">
      <h3 align="left">'${UserKeyword}'에 대한 검색 결과입니다.</h3>
		<div id="snameSearchAjax">
      <!-- 곡검색 -->
      <h1>곡 검색 결과 (${Aanana2})</h1>
      <button type="button" onclick="getCheckboxValue()">플레이리스트</button>
      <input type="hidden" id="snumVal" name="snumVal" value="">
      <table style="width: 100%;" border="1">
         <tr align="center" height="2" bgcolor="ghostwhite">
            <td width="50">
               <input type="checkbox" id="check_all_2" name="check_all_2">
            </td>
            <td width="40">번 호</td>
            <td>Image</td>
            <td>곡 명</td>
            <td>가 수</td>
            <td>앨범명</td>
            <td>downloadfile</td>
         </tr>
         <c:forEach var="row" items="${Aanana}" varStatus="vs">
            <tr>
               <td align="center">
                  <input type="checkbox" class="normalCheck_2" id="snum${row.snum}" name="snum" value="${row.snum}">
               </td>
               <td align="center">${vs.count}</td>
               <td>
                  <img src="${row.image}" width="70" height="70">
               </td>
               <td>
                  <button type="button" name="sname" value="${row.snum}">${row.sname}</button>
               </td>
               <td>${row.singername}</td>
               <td>${row.stitle}</td>
               <td>
                  <a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
               </td>
            </tr>
         </c:forEach>
      </table>
      <c:if test="${empty Aanana}">
         <h2>곡으로 검색한 결과가 없습니다.</h2>
      </c:if>
      <div id="totalSearch">
         <a href="mSearch?keyword=${UserKeyword}&searchType=sname">곡 검색 전체보기></a>
      </div>

 	</div>
 	<div id="singernameSearchAjax">
      <!-- 아티스트명 검색 -->
      <h1>아티스트 검색 결과 (${Banana2})</h1>
      <button type="button" onclick="getCheckboxValue()">플레이리스트</button>
      <input type="hidden" id="snumVal" name="snumVal" value="">
      <table style="width: 100%;" border="1">
         <tr align="center" height="2" bgcolor="ghostwhite">
            <td width="50">
               <input type="checkbox" id="check_all_3" name="check_all_3">
            </td>
            <td width="40">번 호</td>
            <td>Image</td>
            <td>곡 명</td>
            <td>가 수</td>
            <td>앨범명</td>
            <td>downloadfile</td>
         </tr>
         <c:forEach var="row" items="${Banana}" varStatus="vs">
            <tr>
               <td align="center">
                  <input type="checkbox" class="normalCheck_3" id="snum${row.snum}" name="snum" value="${row.snum}">
               </td>
               <td align="center">${vs.count}</td>
               <td>
                  <img src="${row.image}" width="70" height="70">
               </td>
               <td>
                  <button type="button" name="sname" value="${row.snum}">${row.sname}</button>
               </td>
               <td>${row.singername}</td>
               <td>${row.stitle}</td>
               <td>
                  <a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
               </td>
            </tr>
         </c:forEach>
      </table>
      <c:if test="${empty Banana}">
         <h2>아티스트로 검색한 결과가 없습니다.</h2>
      </c:if>
      <div id="totalSearch">
         <a href="mSearch?keyword=${UserKeyword}&searchType=singername">아티스트 검색 전체보기></a>
      </div>
      </div>
      <!--------------------------------------------------아티스트 검색 end----------------------------------------------------- -->
      <!-- 가사검색 -->
      <div id="lyricsSearchAjax">
      <h1>가사 검색 결과 (${Canana2})</h1>
      <button type="button" onclick="getCheckboxValue()">플레이리스트</button>
      <input type="hidden" id="snumVal" name="snumVal" value="">
      <table style="width: 100%;" border="1">
         <tr align="center" height="2" bgcolor="ghostwhite">
            <td width="50">
               <input type="checkbox" id="check_all_4" name="check_all_4">
            </td>
            <td width="40">번 호</td>
            <td>Image</td>
            <td>곡 명</td>
            <td>가 수</td>
            <td>앨범명</td>
            <td>downloadfile</td>
         </tr>
         <c:forEach var="row" items="${Canana}" varStatus="vs">
            <tr>
               <td align="center">
                  <input type="checkbox" class="normalCheck_4" id="snum${row.snum}" name="snum" value="${row.snum}">
               </td>
               <td align="center">${vs.count}</td>
               <td>
                  <img src="${row.image}" width="70" height="70">
               </td>
               <td>
                  <button type="button" name="sname" value="${row.snum}">${row.sname}</button>
               </td>
               <td>${row.singername}</td>
               <td>${row.stitle}</td>
               <td>
                  <a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
               </td>
            </tr>
         </c:forEach>
      </table>
      <c:if test="${empty Canana}">
         <h2>가사로 검색한 결과가 없습니다.</h2>
      </c:if>
      <div id="totalSearch">
         <a href="mSearch?keyword=${UserKeyword}&searchType=lyrics">가사 검색 전체보기></a>
      </div>
      </div>
   </form>
   <br>
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