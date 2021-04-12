<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<!-- https://stove99.tistory.com/103  여기 사이트 참고해서 클릭시 슬라이드로 내려가게끔-->
<style>
.title {
	display: block;
	margin: 71px 0 -35px;
	font-size: 40px;
	color: #1f284f;
	font-weight: 400;
	line-height: 1;
	text-align: center;
	height: 130px;
}

a { text-decoration:none } 

.menu a {                       /* 클릭했을때 리스트 나오게끔 */
	cursor: pointer;
	font-weight: 400;
	font-size: 25px;
}

.hide {                               /* 리스트로 나오는거 숨기는거 */
	display: none;
} 

li{
	list-style: none; /*  리스트 할때 점을 없애려고 추가 여기 한줄*/
	display: block;
	font-size: 23px;
	color: #000;
	 padding: 30px 28px 5px 79px;
	position: relative;  
}

ol{
	padding: 17px 0px 0px 0px;
	 position: relative;
    display: none;
   /*  border-top: 1px solid #bebebe; */
    padding: 30px 15px 30px 0px;
    font-size: 16px;
}


#searchBar{
	padding: 22px 10px 21px 124px;
	height: 50px;
}
body{
height: 60%;
width: 60%;
margin: 0 auto;
}

</style>

<script>  

	/* 이미지 클릭했을시 슬라이드 형식으로 내려가게 하는게 하는 스크립트 */
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ol");
 
            // submenu 가 화면상에 보일때는 위로 접고 아니면 아래로  펼치기
            if(submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    
   /*  ---------------검색창------------------ */
   $(function(){
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function(){
		if($(this).val() == 'n'){
			$('#keyword').val('');
		}
	});
	$('#searchBtn').on("click", function() {
  		self.location="faq"
		+"${pageMaker.makeQuery(1)}"
		+"&searchType="
		+$('#searchType').val()
		+"&keyword=" 
		+$('#keyword').val();  
	}); //click 
	
}) ; //ready 
</script>

</head>
<body>
	<c:if test="${message != null}">
   			=> ${message}
	</c:if>
	<div class="title">
	<a href="home"><h2>FAQ</h2></a>
	</div>
	<!-------------------------------------- main  title , content 부분 -------------------------------->
<div>
		<ul>
			<c:forEach var="Apple" items="${Banana}">
				<li class="menu"><a><img src="resources/image/qq.png" width="30px" height="30px"/>
				${Apple.title}
				<c:if test="${loginGRADE=='admin'}">
						&nbsp; <a href="fdetail?seq=${Apple.seq}&jcode=U">FAQ수정</a>
						&nbsp;  <a href="fdelete?seq=${Apple.seq}">글삭제</a>&nbsp;
				</c:if> 
				</a>
			 <c:if test="${loginGRADE!='admin'}"> <!-- 관리자로 로그인시 list 숨기는거 조건을줌 -->
					<ol class="hide">
					</c:if> 
						<li> <img src="resources/image/aa.png" width="30px"height="30px" /> 
						${Apple.content}
						</li>
					</ol>
					</li>
			<hr align="center" style="width: 82%;">
			</c:forEach>
		</ul>
	</div>
<br>
	<!--------------------------------------검색창-------------------------------------------->
	<div id="searchBar">
		<select name="searchType" id="searchType">
			<option value="t"
				<c:out value="${pageMaker.cri.searchType=='t' ? 'selected' : ''}"/>>
				Title</option>
			<option value="c"
				<c:out value="${pageMaker.cri.searchType=='c' ? 'selected' : ''}"/>>
				Content</option>
			<option value="tc"
				<c:out value="${pageMaker.cri.searchType=='tc' ? 'selected' : ''}"/>>
				Title or Content</option>
		</select> <input type="text" name="keyword" id="keyword"
			value="${pageMaker.cri.keyword}">
		<button id="searchBtn">Search</button>
	</div>
	<br>
	<!-- ------------------페이징---------------------------->
	<!--** Page Criteria 추가   
    1) First << ,  Prev < : enabled 여부
    2) sPage~ePage 까지 displayPageNo 값 만큼 출력, 
    3) Next >  ,   Last >> : enabled 여부
	-->
<div  align="center"style="font-size: 20px; ">
	<!-- ** ver01 : pageMaker.makeQuery(?) -->
	<!-- ** ver02 : pageMaker.searchQuery(?)  -->
	<!-- 1) First << ,  Prev < : enabled 여부 -->
	<c:if test="${pageMaker.prev && pageMaker.sPageNo>1 }">
		<a href="faq${pageMaker.searchQuery(1)}">First</a>&nbsp;  
		<!-- "bpage?currPage=1" -->
		<a href="faq${pageMaker.searchQuery(pageMaker.sPageNo-1)}">Prev</a>&nbsp;&nbsp;
	</c:if>
	
	<!-- 2) sPage~ePage 까지 displayPageNo 값 만큼 출력, -->
	<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<font size="5" color="Orange">${i}&nbsp;</font>
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="faq${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
		<!-- 삼항식과 비교  
		<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : '' }"/>
		-->
	</c:forEach>
		
	<!-- 3) Next >  ,   Last >> : enabled 여부	 -->
	<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
		<a href="faq${pageMaker.searchQuery(pageMaker.ePageNo+1)}">&nbsp;&nbsp;Next</a>&nbsp;  
		<a href="faq${pageMaker.searchQuery(pageMaker.lastPageNo)}">Last</a>&nbsp;&nbsp;
	</c:if>
	
</div>
	</body>
</html>