<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글수정 Form</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>

<style>
.title {
	display: block;
	margin: 71px 0 0;
	font-size: 40px;
	color: #1f284f;
	font-weight: 400;
	line-height: 1;
	text-align: center;
	height: 84px;
}

a {
	text-decoration: none
}

.menu a { /* 클릭했을때 리스트 나오게끔 */
	cursor: pointer;
	font-weight: 400;
	font-size: 25px;
	padding: 30px 28px 5px 79px;
}

li {
	list-style: none; /*  리스트 할때 점을 없애려고 추가 여기 한줄*/
	display: block;
	font-size:50px;
	color: #000;
	padding: 35px 53px 9px 0px;
	position: relative;
}

li.menu{
     padding: 35px 103px 9px 0px;
}
li.menu2{
     padding: 35px 103px 9px 0px;
}

#input{
	padding: 18px 134px 24px 373px;
	font-size: 16px;
}
.button{
background-color: #0b3f9a;
color: #fff;
padding:5px;
width:150px;
height:40px;
}
#wrap_updatef{
text-align: center;
}


</style>

</head>
<body>
	<div class="title">
		<h2> <a href="faq" style="color: black;">Update form</a></h2>
	</div>
	<div id="wrap_updatef">
	<form action="fupdate" method="post">
		<ul>  <!-- readonly="readonly"  -->
		<li>SEQ&nbsp;<input type="number" name="seq" id="seq" style="text-align: left; border: 0; width: 70px; height: 60px; font-size: 50px
		" readonly value="${Apple.seq}">
		</li>
			<li class="menu"><img src="resources/image/qq.png" width="70px"
				height="70px" /> 
				<textarea rows="6" cols="70" name="title">${Apple.title}</textarea>
			</li>
			<li class="menu2"><img src="resources/image/aa.png" width="70px" height="70px" />
				<textarea rows="6" cols="70" name="content">${Apple.content}</textarea>
			</li>
		</ul>
		<div id="input">
				<input type="submit" value="전송" class="button" >&nbsp;&nbsp;
            <input type="reset" value="초기화" class="button">&nbsp;&nbsp;
           </div> 
            </form>
	</div>
	<c:if test="${message != null}">
   => ${message}
</c:if>

</body>
</html>