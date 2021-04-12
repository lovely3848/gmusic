$(function(){ //ready로 감싸야 id식별 가능
   $('#login_button').click(function(){ //버튼 클릭시 로그인 에이젝스 화면
      $.ajax({ 
            type:'Get',
            url:'loginp',
            success:function(resultPage){
               $('#login').html('');
               $('#login').html(resultPage);
               },
            error:function(){
               $('#login').html("~~ 오류발생 ~~");
            }
         });//ajax
   });
   
});//ready