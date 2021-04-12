<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E R R O R 4 0 4</title>

<style type='text/css'>
a:link    {color:black; text-decoration:none;}  /* 아직 방문하지 않은경우 */
a:visited {color:blue; text-decoration:none;} /* 한번 이상 방문한 링크 처리 */
a:active  {color:yellow; text-decoration:none;} /* 마우스로 클릭하는 순간 */
a:hover  {color:green; text-decoration:none;}  /* 마우스 링크 위 올려 놓았을때 */
</style>

</head>
<body>
<div style = 'text-align:center'>
<font face = "돋움" size = 3><br>
<b>요청하신 페이지는 존재하지 않습니다.</b>
주소를 올바르게 입력했는지 확인해주세요. <br><br>
<img src="resources/image/adv.gif"><br><br>
<!-- 
** 동일경로 표현
<img src="./img/adv.gif"> 
** 절대경로
=> 웹 애플리케이션 상의 절대 경로
D:\MTest\MyWork\Web01\jsp06_errorPage\img => OS 의 절대경로아님
<img src="/Web01/jsp06_errorPage/img/adv.gif"> 
 -->
<a href="#" onclick="history.back()">
	[돌아가기]</a>
</font></div>
</body>
</html>