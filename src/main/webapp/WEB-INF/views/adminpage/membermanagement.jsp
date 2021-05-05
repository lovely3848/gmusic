<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/membermanagement.js"></script>
<style>
.button {
	border: 0;
	outline: 0;
	background-color: white;
}

#table {
	width: 75%;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-spacing: 0px;
	margin: 0 auto;
}

#table td {
	border-bottom: 1px solid;
	border-collapse: collapse;
	border-color: #EEEEEF;
	padding: 5px;
}

.category {
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size: 14px;
}
</style>
<script>
	/* $(document).ready(function(){.......}); */
	$(function() {
		// SearchType에 '---'인 keyword클리어
		$('#searchType').change(function() {
			if ($(this).val() == 'n') {
				$('#keyword').val('');
			}
		});
		$('#searchBtn').on(
				"click",
				function() {
					self.location = "membermanagement"
							+ "${pageMaker.makeQuery(1)}" + "&searchType="
							+ $('#searchType').val() + "&keyword="
							+ $('#keyword').val();
					// => ?currPage=7&rowPerPage=10&searchType=tc&keyword=java
				}); //click
	});//ready
</script>
</head>
<body>
	<div id="searchdiv">
		<div id="logo">
			<h1>GMUSIC</h1>
			<form action="membermanagement" id="search" name="search" class="search">
				<select name="searchType" id="searchType" style="display: none">
					<option value="all" selected>All</option>
				</select>
				<input type="text" name="keyword" id="keyword" maxlength="35" size="50" style="vertical-align: middle;" value="${UserKeyword}">
				<button type="button" id="searchBtn" style="vertical-align: middle;">Search</button>
			</form>
		</div>
	</div>
	<br>
	<table id="table">
		<tr class="category" align="center" height="2" bgcolor="ghostwhite">
			<td>ID</td>
			<td>EMail</td>
			<td>회원등급</td>
			<td>핸드폰번호</td>
			<td>Point</td>
			<td>자동결제</td>
			<td>등급변경</td>
			<td>포인트변경</td>
			<td>회원탈퇴</td>
		</tr>
		<c:forEach var="row" items="${Banana}">
			<tr align="center">
				<td>${row.id}</td>
				<td>${row.email}</td>
				<td>${row.grade}</td>
				<td>${row.phone}</td>
				<td>${row.point}</td>
				<c:choose>
					<c:when test="${row.autopay == 1}">
						<td>
							<img src="resources/image/check.png" width="30px" height="30px">
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<img src="resources/image/delete.png" width="20px" height="20px">
						</td>
					</c:otherwise>
				</c:choose>
				<td>
					<button class="membergradechange button" value="${row.id}">change</button>
				</td>
				<td>
					<button class="memberpointchange button" value="${row.id}">change</button>
				</td>
				<td>
					<button class="memberdelete button" value="${row.id}">
						<img src="resources/image/delete.png" width="20px" height="20px">
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<!-- ver 01 : pageMaker.makeQuery(?) -->
		<!-- ver 02 : pageMaker.searchQuery(?) -->
		<!-- 1) First << , Prev < : enabeld 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="membermanagement${pageMaker.searchQuery(1)}">&#8666;</a>&nbsp; <!-- First -->
			<!-- "membermanagement?currPage=1" -->
			<a href="membermanagement${pageMaker.searchQuery(pageMaker.sPageNo-1)}">&#8636;</a>
			<!-- Prev -->
		</c:if>

		<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="membermanagement${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>

			<!-- 삼항식과 비교 
		<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
		-->
		</c:forEach>

		<!-- 3) Next > , Last >> : enabled 여부 -->
		<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="membermanagement${pageMaker.searchQuery(pageMaker.ePageNo+1)}">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
			<a href="membermanagement${pageMaker.searchQuery(pageMaker.lastPageNo)}">&#8667;</a>&nbsp;&nbsp; <!-- Last -->

		</c:if>
	</div>
</body>
</html>