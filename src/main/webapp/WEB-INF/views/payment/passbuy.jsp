<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 구매</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chela+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/topmenu.js"></script>
<script src="resources/myLib/footer.js"></script>
<script src="resources/myLib/login.js"></script>
<script src="resources/myLib/mypage.js"></script>
<script src="resources/myLib/myinfochange.js"></script>
<script src="resources/myLib/chartcount.js"></script>
<style>
body {
   margin: 0;
}

h1 {
   color: #0b3f9a;
   text-align: center;
   font-size: 25px;
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
#section {
   margin: 0 auto; /* 중앙정렬 */
   width: 75%;
   height: 600px;
}

.box1 {
   float: left;
   height: 200px;
   text-align: center;
   margin-bottom: 20px;
}

.div1 {
   width: 25%;
   background-color: #0b3f9a;
   border: solid #bcbcbc;
   border-width: 1px 0 1px 1px;
   border-radius: 15px 0 0 15px;
   display: table;
}

.div2 {
   width: 25%;
   background-color: #fafafa;
   border: solid #bcbcbc;
   border-width: 1px 0 1px 0;
   display: table;
}

.div3 {
   width: 49%;
   border: solid #bcbcbc;
   border-width: 1px 1px 1px 0;
   border-radius: 0 15px 15px 0;
   display: table;
}

.fontdiv1 {
   color: #fff;
   font-size: 40px;
   font-weight: bold;
   display: table-cell;
   vertical-align: middle;
}

.fontdiv2 {
   font-size: 25px;
   font-weight: bold;
   display: table-cell;
   vertical-align: middle;
}

.fontdiv3 {
   font-size: 18px;
   font-weight: bold;
   display: table-cell;
   vertical-align: middle;
   color: #979bb1;
}

.fontdiv4 {
   font-size: 25px;
   font-weight: bold;
   display: table-cell;
   vertical-align: middle;
   color: #00314a;
}

/* section */

/* 로그인 파트부분 */
#login {
   border-bottom: solid green;
   height: 265px;
   padding: 16px 16px 12px 17px;
   border: 1px solid #dae1e6;
}

#login_location {
   height: 50px;
   width: 244px;
   margin: 0 auto;
   padding: 50px 88px 47px 13px;
}

#login_button {
   height: 60px;
   width: 322px;
   background-color: #0b3f9a;
   font-size: 20px;
   color: #fff;
}

#loginsuccess {
   height: 126px;
   width: 293px;
   background-color: ghostwhite;
   border: 3px black;
}

#welcome {
   height: 81px;
   width: 290px;
   background-color: ghostwhite;
}

#logout_btn {
   height: 38px;
   width: 136px;
   background-color: #0b3f9a;
   font-size: 15px;
   color: #fff;
}

/* ----------- login 부분--------- */

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
   function passbuy(grade) {
      
        var check = confirm("결제 하시겠습니까?");
        var price = 0; 
        if(grade == "vvip"){
          price = 10000;
        }else{
          price = 5000; 
        }
        if(check == true){
               if (${loginVO.point} < price) {
                  alert("현재 포인트가 부족합니다.\n충전 후 이용해 주세요");
               }else{
              console.log(grade);
                 location.href = 'passbuy?grade=' + grade;
                 alert("결제 성공")
                }
            }else{
               return false;
            } 
       
      }
</script>
<c:if test="${message!=null}">
   <script>
      alert('${message}');
   </script>
</c:if>
</head>
<body>
   <div id="header">
      <ul id="headermenu">
         <!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
         <!-- <li>로그아웃</li> -->

         <li><button>
               <a href="javascript:;" onClick="location.reload()">이용권구매</a>
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
   <!-- header -->

   <div id="nav">
      <div id="searchdiv">
         <a href="home" id="logofont">GMUSIC</a>
         <form action="mSearch" id="search" name="search" class="search">

            <select name="searchType" id="searchType" style="display: none">
               <option value="all" selected>All</option>
            </select>
            <input type="text" name="keyword" id="keyword" maxlength="35" size="50" style="vertical-align: middle;" value="${pageMaker.cri.keyword}">
            <button type="button" id="searchBtn" style="vertical-align: middle;">Search</button>
         </form>
      </div>
      <hr>
      <div id="topmenu"></div>
      <!-- topmenu -->
   </div>
   <!--//////////////////// section start //////////////////////////// -->
   <h1>이용권 구매</h1>
   <div id="section">

      <div class="box1 div1">
         <div class="fontdiv1">VVIP PASS</div>
      </div>
      <div class="box1 div2">
         <div class="fontdiv2">
            GMUSiC의 모든것을<br> 무제한 이용!
         </div>
      </div>
      <div class="box1 div3">
         <div class="fontdiv3">
            무제한 음악감상<br> 무제한 뮤직비디오 감상<br> 무제한 다운로드<br>
         </div>
         <div class="fontdiv4">
            <c:if test="${loginVO.grade != 'vvip' && loginVO.grade == 'c'}">
            10000원
               <button type="button" onclick="passbuy('vvip')">구매하기</button>
            </c:if>
            <c:if test="${loginVO.grade != 'vvip' && loginVO.grade == 'vip'}">
            5000원
               <button type="button" onclick="passbuy('upgrade')">구매하기</button>
            </c:if>
         </div>
      </div>
      <div class="box1 div1">
         <div class="fontdiv1"">VIP PASS</div>
      </div>
      <div class="box1 div2">
         <div class="fontdiv2">스트리밍 이용권</div>
      </div>
      <div class="box1 div3">
         <div class="fontdiv3">
            무제한 음악감상<br> 무제한 뮤직비디오 감상
         </div>
         <div class="fontdiv4">
            5000원
            <c:if test="${loginVO.grade != 'vvip' && loginVO.grade != 'vip'}">
               <button type="button" onclick="passbuy('vip')">구매하기</button>
            </c:if>
         </div>
      </div>
   </div>

   <!--//////////////////// section end //////////////////////////// -->
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