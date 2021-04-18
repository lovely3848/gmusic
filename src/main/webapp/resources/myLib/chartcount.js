
$(function() {
	$.ajax({
		type: 'Get',
		url: 'chart?ajax=DAILYAJAX',
		success: function(resultPage) {
			$('#chartArea').html(resultPage);
		},
		error: function() {
			$('#chartArea').html("~~ 오류발생 ~~");
		}
	}); //ajax


	//** Ajax 일일차트
	$('#dailyChart').click(function() {
		$.ajax({
			type: 'Get',
			url: 'chart?ajax=DAILYAJAX',
			success: function(resultPage) {
				$('#chartArea').html(resultPage);
			},
			error: function() {
				$('#chartArea').html("~~ 오류발생 ~~");
			}
		}); //ajax
	}); //dailyChart

	//** Ajax 주간차트
	$('#weeklyChart').click(function() {
		$.ajax({
			type: 'Get',
			url: 'chart?ajax=WEEKLYAJAX',
			success: function(resultPage) {
				$('#chartArea').html(resultPage);
			},
			error: function() {
				$('#chartArea').html("~~ 오류발생 ~~");
			}
		}); //ajax
	}); //dlist

	//** 월간차트
	$('#monthlyChart').click(function() {
		$.ajax({
			type: 'Get',
			url: 'chart?ajax=MONTHLYAJAX',
			success: function(resultPage) {
				$('#chartArea').html(resultPage);
			},
			error: function() {
				$('#chartArea').html("~~ 오류발생 ~~");
			}
		}); //ajax
	}); //dlist

}); //dailylist 홈 시작시 바로 나타나도록 하는 ajax
