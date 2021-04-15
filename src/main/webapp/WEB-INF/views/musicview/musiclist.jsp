<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신음악</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	var keydownCtrl = 0;
	var kedownShift = 0;

	document.onkeydown = keycheck;
	document.onkeyup = uncheckCtrlShift;

	function keycheck() {
		switch (event.keyCode) {
		case 123:
			event.keyCode = '';
			return false;
			break;
		case 17:
			event.keyCode = '';
			keydownCtrl = 1;
			return false;
			break;
		}
		if (keydownCtrl)
			return false;

	}

	function uncheckCtrlShift() {
		if (event.keyCode == 17)
			keydownCtrl = 0;
		if (event.keyCode == 16)
			keydownShift = 0;

	}

	function click() {
		if ((event.button == 2) || (event.button == 2)) {
			alert('마우스 오른쪽 / 컨트롤 / F12 금지입니다');
		}
	}
	document.onmousedown = click;
</script>
<script>
   $(function() { //ready

      // input checkbox
      // https://emessell.tistory.com/149 참고
      //1. 전체 선택, 전체 해제
      $("#check_all").click(function() {

         var checked = $(this).is(":checked");

         if (checked) {
            $(".normalCheck").prop('checked', true);
         } else {
            $(".normalCheck").prop('checked', false);
         }
      });

      // 2. 전체선택 후 하나만 해제했을 때, 전체선택도 해체
      // 3. 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
      $(".normalCheck").click(function() {

         var checked = $(this).is(":checked");

         if (!checked) {
            $("#check_all").prop('checked', false);
         } else {
            var is_checked = true;

            $(".normalCheck").each(function() {
               is_checked = is_checked && $(this).is(":checked");
            });

            $("#check_all").prop("checked", is_checked);

         }
      });
      
      
      // 곡명 버튼 눌렀을때 실행 
      // 플레이 리스트에 단일로 실행됨
      $("button[name=sname]").click(function() {

         var buttonSnumVal = $(this).val();

         url = "playlist";
         window.open(url, "myview",
                     "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
       
         document.musiclist.action =url;
         document.musiclist.method="post";
         document.musiclist.target="myview";
         
         $('input[name=snumVal]').attr('value',buttonSnumVal);
      
         document.musiclist.submit();
      });
      
   });//ready *
   

   
   // window.open post 방식으로 전달하기
   // https://darkhorizon.tistory.com/284 참고
   // 체크박스(checkbox)에 선택 된 값 출력하기
   // https://hianna.tistory.com/430 참고
   function getCheckboxValue()  {
      // 선택된 목록 가져오기
      const query = 'input[name="snum"]:checked';
      const selectedEls = document.querySelectorAll(query);
   
      // 선택된 목록에서 value 찾기
      let result = '';
      selectedEls.forEach((el) => {
      result += el.value + ',';
      });
      
      // div에 출력 하기
      document.getElementById('result').innerText
      = result;
      
      url = "playlist";
      window.open(url, "myview",
                  "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
    
      document.musiclist.action =url;
      document.musiclist.method="post";
      document.musiclist.target="myview";
      
      // 항목 추가 실험중 넣으면 항목 추가됨
      //var addsnumVal = $('input[name=snumVal]').val();
      //if (addsnumVal != null) {
      //   $('input[name=snumVal]').attr('value',addsnumVal+result);
      //}else{
         $('input[name=snumVal]').attr('value',result);
      //}
   
      document.musiclist.submit();
   
   }

</script>

</head>
<body>
	<form name="musiclist">
		<button type="button" onclick="getCheckboxValue()">플레이리스트</button>
		<div id='result'></div>
		<input type="hidden" id="snumVal" name="snumVal" value="">
		<table style="width: 1200px;" border="1">
			<tr align="center" height="2" bgcolor="pink">
				<td width="50">
					<input type="checkbox" id="check_all" name="check_all">
				</td>
				<td width="40">번 호</td>
				<td>Image</td>
				<td>곡 명</td>
				<td>가 수</td>
				<td>앨범명</td>
				<td>downloadfile</td>
			</tr>
			<c:forEach var="row" items="${Banana}" varStatus="vs">
				<tr>
					<td align="center">
						<input type="checkbox" class="normalCheck" id="snum${row.snum}" name="snum" value="${row.snum}">
					</td>
					<td align="center">${vs.count}</td>
					<td>
						<img src="${row.image}" width="70" height="70">
					</td>
					<td>
						<button type="button" name="sname" value="${row.snum}">${row.sname}</button>
					</td>
					<td>${row.singername}</td>
					<td>${row.stitle}</td>
					<td>
						<a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>