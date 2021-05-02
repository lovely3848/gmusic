<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gmusic</title>
<script src="resources/myLib/pagingSec1_3.js"></script>
<script>
$(function() {//ready
	$(".albumimageButton3").click(function() {
		if(${loginVO.grade == 'c' || loginVO == null}){
			location.href='payPage';
		}else {
			var buttonSnumVal = $(this).attr('value');
	
			url = buttonSnumVal+"?amp;autoplay=1";
			window.open(url, "videoView","toolbar=no,location=no,status=no,scrollbars=no,resizable=no,width=600,height=400");
		}
	});
});//ready
</script>
</head>
<body>
	<div id="section1_3">
		<div>
			<a href="musiclist">
				<span class="subheading">&nbsp;최신 뮤직비디오 &gt;</span>
			</a>
		</div>
		<form class="musiclistForm" name="musiclistForm">
			<input type="hidden" id="snumVal" name="snumVal" value="${snumValSession}">
		</form>
		<div class="gallerylist">
			<ul>
				<c:forEach var="row" items="${Banana}" varStatus="vs">
					<li><a href="javascript:;" class="albumimageButton3" value="${row.musicurl}">
							<div class="screen">
								<div class="top">${row.sname}</div>
								<div class="bottom">${row.singername}</div>
								<img src="${row.image}">
							</div>
							<div>
								<h3>이미지 위에 오브젝트가 나타나는 효과</h3>
							</div>
						</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 페이징 -->
	<div align="center">
		<!-- ver 01 : pageMaker.makeQuery(?) -->
		<!-- ver 02 : pageMaker.searchQuery(?) -->
		<!-- 1) First << , Prev < : enabeld 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="javascript:;" class="pagingAjax3" value1="musiclist${pageMaker.makeQuery(1)}&pagingCode=section1_3">&#8666;</a>&nbsp; <!-- First -->
			<!-- "qna?currPage=1" -->
			<a href="javascript:;" class="pagingAjax3" value1="musiclist${pageMaker.makeQuery(pageMaker.sPageNo-1)}&pagingCode=section1_3">&#8636;</a>
			<!-- Prev -->
		</c:if>

		<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="javascript:;" class="pagingAjax3" value1="musiclist${pageMaker.makeQuery(i)}&pagingCode=section1_3">${i}</a>&nbsp;
		</c:if>

			<!-- 삼항식과 비교 
		<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
		-->
		</c:forEach>

		<!-- 3) Next > , Last >> : enabled 여부 -->
		<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="javascript:;" class="pagingAjax3" value1="musiclist${pageMaker.makeQuery(pageMaker.ePageNo+1)}&pagingCode=section1_3">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
			<a href="javascript:;" class="pagingAjax3" value1="musiclist${pageMaker.makeQuery(pageMaker.lastPageNo)}&genre=${musicGenre}&pagingCode=section1_3">&#8667;</a>&nbsp;&nbsp; <!-- Last -->

		</c:if>
	</div>
</body>
</html>