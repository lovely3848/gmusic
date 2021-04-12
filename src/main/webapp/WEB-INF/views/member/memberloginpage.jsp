<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Gmusic LoginPage</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
   rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<!-- <script src="resources/myLib/footer.js"></script> -->
<style>
body {
   height: 95%;
   width: 100%; 
   margin : auto;
   background-color: ghostwhite;
}

a {
   text-decoration: none;
   color: black;
}

#loginf_location{
   position : absolute;
   top: 23%; left: 48%;
   width: 300px; height: 160px;
   margin-left: -150px;
   margin-top:-80px;
}

#logo {
   font-size: 93px;
   color: #0b3f9a;
   font-family: 'Chela One', cursive;
}

#login_button2{
   height: 60px;
   width: 374px;
   background-color: #0b3f9a;
   font-size: 20px;
   color: #fff;
}

#id, #password {
   height: 40px;
   width: 366px;
}
/* --------------footer--------------- */
#footer {
   height: 143px;
   background-color: ghostwhite;
   margin: 0 auto; /* 중앙정렬 */
   width: 75%;
   position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
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
</style>

   <c:if test="${message!=null}">
      <script>
         alert('${message}');
      </script>
   </c:if>

</head>
<body>
   <div id= loginf_location>
   <div ><a href="home" id="logo">GMUSIC</a></div><br><br>
   <form action="mlogin" method="get">
      <table>
      <tr>
            <td><input type="text" id="id"  name="id" placeholder="아이디">
         </tr>
         <tr>
            <td><input type="password" id="password" name="password" placeholder="비밀번호">
         <tr style="text-align: right;">
            <td><a href="search_id" class="search_id">아이디 찾기</a>&nbsp; 
            <a href="search_password" class="search_password">비밀번호 찾기</a></td>
         </tr>
         <tr>
         <td><input type="submit" id="login_button2" value="로그인" ></td> 
         </tr>
      </table>
   </form>
   </div>
   <!------------------------------------------------------ footer ----------------------------------------------------->
   <div id="footer">
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
   </div>
</body>
</html>