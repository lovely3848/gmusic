<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** G-MUSIC 차트 **</title>
<link rel="stylesheet" type="text/css" 
		  href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/chart.js"></script>
</head>
<body>
<h3>** G-MUSIC 차트 **</h3>
<hr>
<!-- <span id="dlist" class="textLink">[일일차트]</span> &nbsp;&nbsp; -->
<span id="pmlist" class="textLink">[일일차트]</span> &nbsp;&nbsp; 
<span id= "wlist" class="textLink">[주간차트]</span>&nbsp;&nbsp;
<span  id= "monlist" class="textLink">[월간차트]</span>&nbsp;&nbsp;
<a href="home">[Home]</a>&nbsp;&nbsp;
<hr>
<div id="dlistArea1"></div>
<div id="wlistArea2"></div>
<div id="monlistArea3"></div>
</body>
</html>