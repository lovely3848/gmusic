
$(function(){
	 $.ajax({
         type:'Get',
         url:'dailyChart',
         success:function(resultPage){
            $('#chartArea').html(resultPage);
            },
         error:function(){
            $('#chartArea').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dailylist 홈 시작시 바로 나타나도록 하는 ajax


//** Ajax 일일차트
$('#dailyChart').click(function(){
	 $.ajax({
         type:'Get',
         url:'dailyChart',
         success:function(resultPage){
            $('#chartArea').html(resultPage);
            },
         error:function(){
            $('#chartArea').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dailyChart

//** Ajax 주간차트
$('#wlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'wlist',
         success:function(resultPage){
            $('#chartArea').html(resultPage);
            },
         error:function(){
            $('#chartArea').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist

//** 월간차트
$('#monlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'monlist',
         success:function(resultPage){
            $('#chartArea').html(resultPage);
            },
         error:function(){
            $('#chartArea').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist

