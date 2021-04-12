$(function(){   
// ** MousePointer
   $('.textLink').hover(function(){
      $(this).css({
         fontWeight: "bold",
         color: "DeepSkyBlue",
         cursor: "pointer"}) // css
   }, function(){
      $(this).css({
         fontWeight: "",
         color: "gray",
         cursor: "default"}) // css
   }); //hover

//** 실험 pmlist
$('#pmlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'pmlist',
         success:function(resultPage){
            $('#dlistArea1').html(resultPage);
            },
         error:function(){
            $('#dlistArea1').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist


//** Ajax 일일차트
$('#dlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'dlist',
         success:function(resultPage){
            $('#dlistArea1').html(resultPage);
            },
         error:function(){
            $('#dlistArea1').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist

//** Ajax 주간차트
$('#wlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'wlist',
         success:function(resultPage){
            $('#wlistArea2').html(resultPage);
            },
         error:function(){
            $('#wlistArea2').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist

//** 월간차트
$('#monlist').click(function(){
	 $.ajax({
         type:'Get',
         url:'monlist',
         success:function(resultPage){
            $('#resultArea1').html(resultPage);
            },
         error:function(){
            $('#monlistArea3').html("~~ 오류발생 ~~");
         }   
      }); //ajax
}); //dlist


}); //ready