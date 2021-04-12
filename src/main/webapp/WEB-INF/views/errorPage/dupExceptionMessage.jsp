<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring DupKeyException Message **</title>
<link rel="stylesheet" type="text/css" href="resources/jqLib/myStyle.css">
</head>
<body>
<h2>** Spring DupKeyException Message **</h2>
<h3>자료 입력시 문제가 발생 했습니다 ~</h3>
<h3>=> ID 가 중복 되어 RollBack 되었습니다 ~</h3>
<h5>exception Message => ${exception.message}</h5>
 
<h2>다시 하세요 ~~~~~</h2>
<br><br>
<a href="#" onclick="history.back()">[다시 하기]</a>&nbsp;
<a href="home">[HOME]</a>
</body>
</html>