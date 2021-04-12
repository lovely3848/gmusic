<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script type="text/javascript">var id = '<%=(String) session.getAttribute("loginID")%>';</script>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/myinfochange.js"></script>
<script src="resources/myLib/topmenu.js"></script>
<script src="resources/myLib/footer.js"></script>
<title>내 정보</title>
<style>
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
	width: 100%;
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
#area1 {
	width: 1220px;
	height: 500px;
	border: 3px solid;
	text-align: center;
	position: absolute;
	top: 30%;
	left: 15%;
}

body {
	background-size: cover;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
	background-size: cover;
}
/*section */
#section {
	background-color: ghostwhite;
}

.wrap {
	text-align: center;
	position: absolute;
	left: 27%;
}

.mypagebutton {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
	float: left;
	background-color: white;
}

.mypagebutton {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.mypagebutton:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(11, 63, 154, 0.7) 0 0px 0px 40px inset;
}
/*section */
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
$(function(){ //ready로 감싸야 id식별 가능
			//loginID 세션값을 불러 id변수에다 넣음
		$.ajax({ // nav topmenu
				type:'Get',
				url:'myinfopage?id=' + id, //컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success:function(resultPage){
					$('#area1').html(''); 
					$('#area1').html(resultPage);// area1에 ajax를 이용해 화면 구현
					},
				error:function(){
					$('#area1').html("~~ 오류발생 ~~");// 오류시 area1에 오류발생 메세지 발생
				}
			});//ajax
		
});//ready
$(function(){ //ready로 감싸야 id식별 가능
	
		//loginID 세션값을 불러 id변수에다 넣음
		$('#myinfopage').click(function() {
			$.ajax({ // nav topmenu
				type : 'Get',
				url : 'myinfopage?id=' + id, // 컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success : function(resultPage) {
					$('#area1').html('');
					$('#area1').html(resultPage);// area1에 ajax를 이용해 화면 구현
				},
				error : function() {
					$('#area1').html("~~ 오류발생 ~~");// 오류시 area1에 오류발생 메세지 발생
				}
			});//ajax
		});
	});//ready

$(function(){
	$('#memberdelete').click(function() {
		var result = confirm('정말 삭제 하시겠습니까?')
		if(result == true){
			$.ajax({ // nav topmenu
				type : 'Get',
				url : 'memberdelete?id=' + id, // 컨트롤러에서 selectOne sql문을 이용하여 id에 해당하는 값을 불러오기 위한 전달
				success : function(resultPage) {
					$(location).attr("href", "home");
				},
				error : function() {
					$('#area1').html("오류발생");// 오류시 area1에 오류발생 메세지 발생
				}
			});//ajax	
		}else{
			return false
			$(location).attr("href", "mypage");
		}
	});	
});//ready
	
	
	
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
					<a href="javascript:;">이용권구매</a>
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
				<li><button id="mypage">마이페이지</button></li>
			</c:if>
		</ul>
	</div>
	<!-- header -->

	<div id="nav">
		<div id="searchdiv">
			<a href="home" id="logofont">GMUSIC</a> <input type="text"
				name="keyword" id="keyword" maxlength="10" size="50"
				style="vertical-align: middle;">
			<button id="searchBtn" style="vertical-align: middle;">Search</button>
		</div>
		<hr>
		<div id="topmenu"></div>
		<!-- topmenu -->
	</div>
	<div id="section">
		<div class="wrap">
			<button class="mypagebutton" id="myinfopage" >회원정보</button>
			<button class="mypagebutton" id="myinfochangep">정보수정</button>
			<button class="mypagebutton" id="memberdelete">회원탈퇴</button>
		</div>
		<br> <br>
		<div id="area1"></div>
	</div>
</body>
</html>