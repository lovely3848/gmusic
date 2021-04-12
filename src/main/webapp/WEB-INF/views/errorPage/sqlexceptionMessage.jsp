<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring SQLException Message **</title>
<link rel="stylesheet" type="text/css" href="resources/jqLib/myStyle.css">
</head>
<body>
<h2>** Spring SQLException Message **</h2>
<h2>처리 도중  SQL Exception이 발생 했습니다 ~</h2>
<h2>exception Message => ${exception.message}</h2>
<%-- <h2>exception ToString => ${exception.toString}</h2>  --%>
<h2>다시 하세요 ~~~~~</h2>
<br><br>
<a href="#" onclick="history.back()">[다시 하기]</a>&nbsp;
<a href="home">[HOME]</a>
</body>
</html>