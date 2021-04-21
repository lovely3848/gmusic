<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤직플레이리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>
/* 중앙정렬코드 */
.layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
}

.layer .content {
	display: inline-block;
}

/* 스크롤바 숨김 */
html {
	overflow: hidden;
}

/* 배경색 */
body {
	/* 	background-color: #f1f3f4; */
	background-color: ghostwhite;
}

/* 플레이 리스트 테이블 css */
#playlistTable {
	margin-top: 15px;
	width: 300px;
}

/* 곡명 css */
#sname {
	font-size: 17px;
	font-weight: 600;
	/* 텍스트 넘치면 ... 표시 */
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 300px;
}

/* 가수명 css */
#singername {
	font-size: 12px;
	/* 텍스트 넘치면 ... 표시 */
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 300px;
}

/* 가사 textarea css */
#lyrics {
	resize: none;
	width: 293px;
	height: 294px;
}

/* 플레이리스트, 가사, 오디오 클릭후 포커스 없애기 */
#playlist:focus, #lyrics:focus, #audioplay:focus {
	outline: none;
}

/* 버튼 라인1 css */
.buttonLine1 {
	width: 50px;
	height: 20px;
	vertical-align: middle;
	font-size: 12px;
	padding: 0;
	border: 0.5px solid #767676;
	background-color: white;
	border-radius: 1px;
}

/* 버튼 라인2 css */
.buttonLine2 {
	width: 40px;
	height: 20px;
	vertical-align: middle;
	font-size: 12px;
	padding: 0;
	border: 0.5px solid #767676;
	background-color: white;
	border-radius: 1px;
}

/* 버튼 클릭후 포커스 없애기 */
.buttonLine1:focus, .buttonLine2:focus {
	outline: none;
}
</style>
<script>
	// spacebar 입력시 정지 동작
	// 상하 방향키 입력시 볼륨 조절
	// https://webisfree.com/2015-02-04/[jquery]-자바스크립트-키보드-클릭-이벤트-방법-예제-소스
	// https://velog.io/@1703979/JS-30-11
	$(document).keydown(function(event) {
		var audio = document.getElementById("audioplay");
		// 버튼 클릭시 마지막에 누른 버튼이 같이 수행됨 => 해결방법???
		//	if (event.keyCode == 32) {
		//		playpause();
		//	}

		if (event.keyCode == 38 && audio.volume <= 0.95) {
			audio.volume = audio.volume + 0.05;
			console.log(audio.volume);
		} else if (event.keyCode == 38 && audio.volume > 0.95) {
			audio.volume = 1;
			console.log(audio.volume);
		}

		if (event.keyCode == 40 && audio.volume >= 0.05) {
			audio.volume = audio.volume - 0.05;
			console.log(audio.volume);
		} else if (event.keyCode == 40 && audio.volume < 0.05) {
			audio.volume = 0;
			console.log(audio.volume);
		}

	}); //keydown
</script>
<!-- <script>
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
</script> -->
<script>
	// select box jquery 활용법
	// https://jaweb.tistory.com/entry/Jquery-Select-Box-활용-노하우 참고

	// <body> onload 이벤트
	// select box 인덱스의 첫번째가 선택되고 플레이시킴(첫 인덱스 플레이 기능)
	function autoplay() {
		$("#playlist option:first").prop("selected", true); // 노래 리스트의 첫곡을 선택 (select의 상태를 true로 활성화)
		nowplay(); // 현재곡 재생함수

	} //autoplay

	// 이전곡 재생
	// 현재 select box 인덱스값을 변수로 받고 
	// 인덱스 -1 로 선택 위치 위로 이동 후 플레이시킴 
	function previous() {

		var index = $("#playlist option").index($("#playlist option:selected")); // 옵션중에서 리스트 옵션이 select된 항목의 index를 변수에 저장.

		index = index - 1; // 이전곡 = 현재곡의 인덱스 - 1
		$("#playlist option:eq(" + index + ")").prop("selected", true); // 선택. 리스트의 옵션에서 eq안의 인덱스에 해당하는 옵션의 select 상태를 true로 만들어준다.
		nowplay(); // 현재 선택곡 재생      // eq(index) 는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자입니다.
		// 마치 배열의 인덱스로 값(value)를 찾는 것과 같은 효과를 냅니다.
	} //previous

	// 현재곡 재생
	// <select>의 ondblclick 이벤트로 실행됨
	// 선택된 select box 값의 밸류를 각 항목에 전달시킴
	function nowplay() { // 현재 선택곡 재생. 각 div들에 현재 재생할 값들을 넣어서 표현해줌

		document.title = $("#playlist option:selected").attr('value') + " - "
				+ $("#playlist option:selected").attr('value2'); // 현재 곡에 따라 타이틀 변경
		$("#sname").html($("#playlist option:selected").attr('value'));
		$("#singername").html($("#playlist option:selected").attr('value2'));
		$("#albumimage").attr("src",
				$("#playlist option:selected").attr('value3'));
		$("#audioplay").attr("src",
				$("#playlist option:selected").attr('value4'));

		if ($('.hiddenLyrics').val() != "") {
			$("#lyrics").html($('.hiddenLyrics').val());
		} else {
			$("#lyrics").html("가사가 없습니다");
		}

		$("#albumimageORlyrics").html(
				$("#playlist option:selected").attr('value5'));
		var snumber = $("#playlist option:selected").attr('value6');
		// 볼륨조절
		// https://webisfree.com/2017-09-07/html5-audio-태그-사용-예제보기 참고
		document.getElementById("audioplay").volume = 0.5;

		$.ajax({
			type : 'post',
			url : 'musicCount',
			data : {
				snum : snumber
			},
			success : function() {
				console.log("성공");
			},
			error : function() {
				console.log("실패");
			}
		});//count를 위한 값 넘기기 

	} //nowplay

	// 현재 오디오의 재성 및 정지 기능
	// 정지면 정지 시키고 재생 버튼으로 바꿈
	// 재생이면 재생 시키고 정지 버튼으로 바꿈
	// https://unikys.tistory.com/278
	function playpause() {

		var audio = document.getElementById("audioplay");
		if (!audio.paused) { // body 시작시 디폴트값은 "정지"이다. 정지버튼에 정지라고 써있는가?를 묻는다.
			audio.pause(); // 사실이라면 노래(오디오)를 정지시킨다.
			$("#playpause").html("►"); // 이후에 다시 눌렀을때 정지가 아닌 재생이 되게 하고 싶으므로 다시 눌렀을 때 아래의 else조건으로 갈 수 있게 "재생"으로 바꿔줌
		} else { // 뜻: 퍼즈 버튼에 정지라고 써져있지않다.
			audio.play(); // 오디오를 play() 재생한다.
			$("#playpause").html("❚❚"); // 퍼즈버튼의 글씨를 "정지"로 만들어준다.
		}

	} //playpause

	// 다음곡 재생
	// 현재 select box 인덱스값을 변수로 받고 
	// 인덱스 +1 로 선택 위치 아래로 이동 후 플레이시킴 
	// 마지막 인덱스라면 처음 인덱스로 돌아가야함
	// 첫 인덱스 플레이 => autoplay(); 함수와 같음
	function next() {

		var index = $("#playlist option").index($("#playlist option:selected")); // 리스트 옵션에서 현재 선택된 노래의 인덱스를 저장.
		var lastindex = $("#playlist option:last").prop("selected"); // true or false  // 마지막 노래가 선택되었는지를 변수에 저장. 참고: (prop("selected")는 boolean타입이다.)

		if (lastindex) { // 마지막 노래에서 다음곡을 누른 사실이 true이면
			autoplay(); // 리스트의 첫 곡을 실행한다.
		} else { // 나머지 경우라면  
			index = index + 1; // 현재 선택된 노래의 인덱스의 다음인덱스. 미래인덱스= 현재인덱스+1
			$("#playlist option:eq(" + index + ")").prop("selected", true); // 미래인덱스 선택. 리스트의 옵션에서 eq안의 인덱스에 해당하는 옵션의 select 상태를 true로 만들어준다.
			nowplay(); // 선택된 곡 재생
		}

	} //next

	// 한곡 반복 재생
	// <audio>의 onended 이벤트(곡이 끝나면 발생하는 이밴트)
	// => 기본값 next(); 다음곡 재생
	// 반복 재생 시키려면
	// => onended의 값을 nowplay(); 현재곡 재생으로 바꿔줘야함
	function oneplay() { // 반복재생

		var oneplay = false; // 반복재생 버튼 클릭 했을때 onplay변수 false
		// 참고: 처음 페이지 시작 시 onended는 next()다.
		if ($("#audioplay").attr("onended") == "next()") { // 반복재생버튼을 기존에 누르지 않은 상태(노래가 끝나면 다음곡 자동 재생으로 설정된 상태)에서 
			oneplay = true; // 반복 재생 버튼을 눌렀다면 oneplay = true

		}

		if (oneplay) { // 반복재생을 하고자 한다면
			$("#audioplay").attr("onended", "nowplay()"); // 현재곡 재생이 끝나면 현재곡 다시 재생. (selected된 옵션이 변경되지 않고 재생 == 현재곡 다시 재생 )
			$('#oneplay').css({ // 상태 확인용 css
				backgroundColor : "#0b3f9a",
				color : "#fff"
			});
		} else { // 반복재생 중에 다시 버튼을 눌렀을 경우를 염두에 둔 코드.
			$("#audioplay").attr("onended", "next()"); // 오디오를 노래가 끝나면 다음곡 재생을 하는 코드로 다시 돌려준다.
			$('#oneplay').css({ // 상태 확인용 css
				backgroundColor : "white",
				color : "black"
			});
		}

	} //oneplay

	// 플레이 리스트 숨기고 가사 보여주는 기능
	// https://unabated.tistory.com/entry/displaynone-과-visibilityhidden-의-차이  참고
	function viewLyrics() { // 가사보기

		if ($("#viewLyrics").html() == "가사") {
			$('#playlist').css({
				display : "none"
			});
			$('#lyrics').css({
				display : ""
			});
			$("#viewLyrics").html("LIST");

		} else {
			$('#playlist').css({
				display : ""
			});
			$('#lyrics').css({
				display : "none"
			});
			$("#viewLyrics").html("가사");

		}

	} //viewLyrics

	// selectbox 위아래 이동하게 구현하기
	// https://zzznara2.tistory.com/457 그대로 가져옴
	// 테스트
	// https://jsfiddle.net/zzznara/L0jkq7fb/4/?utm_source=website&utm_medium=embed&utm_campaign=L0jkq7fb 참고
	var selectbox = {

		/* 삭제 버튼 */// 참고: 옵션 인덱스는 0부터 시작.
		remove : function(obj) { // playlist.   obj는 playlist(선택한 노래 목록)이다.
			for (var k = obj.options.length - 1; k >= 0; k--) { // playlist의 마지막인덱스 부터 0번쨰 인덱스 까지. 역순인 이유는 중간에 노래가 삭제되면 마지막 인덱스 k에 해당하는 옵션이 없어지므로 조건절의 오류가 나기 떄문이다.
				if (obj.options[k].selected) { // playlist의 k번째 옵션이 selected(==true)라면
					obj.options[k] = null; // 선택되어있는 곡을 playlist에서 지운다.
				}
			}
		},

		/* 위로 버튼 */
		moveUp : function(obj) { // playlist
			for (var k = 1; k < obj.options.length; k++) { // 0번째(첫번쨰 곡)의 윗 곡는 없다. 1번째부터 마지막 옵션까지.
				if (obj.options[k].selected) { // 반복하는 중 k번째 노래가 현재 선택되어있는 노래고,
					this.swapObj(obj, k, k - 1); // 밑의 코드를 실행. playlist(목록)의 현재곡과 이전곡의 옵션(순서)을 바꾼다.
				}
			}
		},

		/* 아래로 버튼 */
		moveDown : function(obj) { // 마지막곡의 다음곡은 없다. 마지막곡의 이전곡부터 첫번쨰 곡까지.
			for (var k = obj.options.length - 2; k >= 0; k--) { // 마지막 인덱스(마지막 노래)의 이전곡부터 첫번쨰 곡까지 역순. (정렬 알고리즘의 원래와 비슷함. 스위치된 k+1번째 값이 확인되지 않고 건너뛰는 경우를 막기위함.)
				if (obj.options[k].selected) { // 반복하는 중 k번째 노래가 현재 선택되어있는 노래고,
					this.swapObj(obj, k, k + 1); // 밑의 코드를 실행. playlist(목록)의 현재곡과 다음곡의 옵션(순서)을 바꾼다.
				}
			}
		},

		/* 위치를 서로 바꾸는 함수 */
		swapObj : function(obj, i, j) { // funtion(playlist, k, k+1) or funtion(playlist, k, k-1)
			var iObj = obj.options[i]; // 위에서 (인덱스)k번째 옵션
			var jObj = obj.options[j]; // k번째 옵션의 다음 또는 이전 옵션

			obj.options[i] = new Option();
			obj.options[j] = new Option(); // 셀렉트 박스에 값을 배정해줄 때
			// 자바스크립트에서의 new Option() 함수.
			// 정의된 파라미터.
			// >> new Option(text, value, defaultSelected, selected)
			obj.options[i] = jObj;
			obj.options[j] = iObj; // 스위치 시켜줌
		}
	}
</script>
</head>
<body onload="autoplay()">
	<div class="layer">
		<span class="content">
			<table id="playlistTable">
				<tr>
					<td>
						<div id="sname"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="singername"></div>
					</td>
				</tr>
				<tr>
					<td>
						<img src="" id="albumimage" width="200" height="200" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="previous" class="buttonLine1" onclick="previous()">|◁</button>
						<button type="button" id="playpause" class="buttonLine1" onclick="playpause()">❚❚</button>
						<button type="button" id="next" class="buttonLine1" onclick="next()">▷|</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="oneplay" class="buttonLine2" onClick="oneplay()">↻</button>
						<!-- 버튼 a태그 처럼 이용하기 -->
						<!-- https://dololak.tistory.com/765 참고 -->
						<c:if test="${snumValSession!=null}">
							<button type="button" id="shuffle" class="buttonLine2" onClick="location.href='playlist?snumVal=${snumValSession}&jcode=U'">⇆</button>
						</c:if>
						<button type="button" class="buttonLine2" onClick="selectbox.remove( playlist );">삭제</button>
						<button type="button" class="buttonLine2" onClick="selectbox.moveUp( playlist );">△</button>
						<button type="button" class="buttonLine2" onClick="selectbox.moveDown( playlist );">▽</button>
						<button type="button" id="viewLyrics" class="buttonLine2" onClick="viewLyrics()">가사</button>
					</td>
				</tr>
				<tr>
					<td>
						<audio src="" id="audioplay" controls="controls" autoplay="autoplay" controlsList="nodownload" onended="next()"></audio>
					</td>
				</tr>
				<tr>
					<td>
						<select id="playlist" name="playlist" size="15" style="width: 300px; height: 300px;" ondblclick="nowplay()">
							<c:forEach var="row" items="${Banana}">
								<option value="${row.sname}" value2="${row.singername}" value3="${row.image}" value4="${row.downloadfile}" value5="${row.lyrics}" value6="${row.snum}">${row.sname}</option>
							</c:forEach>
						</select>
							<c:forEach var="row" items="${Banana}">
							<textarea class="hiddenLyrics" style="display: none;">${row.lyrics}</textarea>
							</c:forEach>
						<%-- <div id="playlist" name="playlist" style="width: 300px; height: 300px;" ondblclick="nowplay()">
						<c:forEach var="row" items="${Banana}">
						<input type="checkbox" value="${row.sname}" value2="${row.singername}" value3="${row.image}" value4="${row.downloadfile}" value5="${row.lyrics}" value6="${row.snum}">
						</c:forEach>
						</div> --%>
						<textarea id="lyrics" readonly="readonly" style="display: none;"></textarea>
					</td>
				</tr>
			</table>
		</span>
	</div>
</body>
</html>