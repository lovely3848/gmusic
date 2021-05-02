<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Gmusic</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
   rel="stylesheet">
   <script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/login.js"></script>
<style>
#logo {
   font-size: 20;
   color: #0b3f9a;
   font-family: 'Chela One', cursive;
}

a {
   text-decoration: none;
   color: black;
}

#login_button {
   height: 60px;
   width: 374px;
   background-color:#0b3f9a;
   font-size: 20px;
   color: #fff;
}

#id, #password {
   height: 40px;
   width: 366px;
}
</style>
</head>
<body>
   <div id="logo">
      <h1>GMUSIC</h1>
   </div>
   <form action="mlogin" method="get">
      <table>
         <tr>
            <td><input type="text" id="id"  name="id" placeholder="아이디">
         </tr>
         <tr>
            <td><input type="password" id="password" name="password" placeholder="비밀번호">
         <tr style="text-align: right;">
            <td><a href="searchID" class="searchID">아이디 찾기</a>&nbsp; 
            <a href="searchPassword" class="searchPassword">비밀번호 찾기</a></td>
         </tr>
         <tr>
              <td><input type="submit" id="login_button" value="로그인" ></td> 
      </table>
   </form>
</body>
</html>