<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_ajaxTest.jsp</title>
</head>
<body>
	<!-- 
	AJAX(Asynchronous JavaScript XML)
	 - 페이지 전체를 reload하지 않고 일부분만 reload할 수 있다.
	 - jQuery 오픈소스 중 ajax()함수를 이용한다.
	 - 응답 받아온 메시지를 처리하는 함수를 callback함수라 한다.
	 -->
	 
	 <!-- 
	 [서버에서 응답받는 방식]
	 1)
	 
	 idCheck.jsp	-> 서버에서 응답받는 
	 
	  -->
 
	<button>서버에서 응답받기</button>
	<div id="panel"></div>
	
	<script src="../js/jquery.js"></script>
	<script>
		$("button").click(function(){
			//alert();
			//1)
			/*
			$.ajax({
				url:"test.do",//요청명령어 > /form1/member/test.do 임.
				method:"get", //get | post
				dataType:"text",//문자열
				error:function(xhr, status, error){//callback함수
					alert("에러!! "+error);
				},//error 
				success:function(result, status, xhr){//callback함수
					//alert(result);
					//$("#panel").append(result); //댓글형태로추가
					$("#panel").empty(); //지우는거
					$("#panel").text(result); //오버라이트
					
				}//success
			});//ajax
			*/
			
			//2)
			/*
			//Ajax객체의 기본값 지정
			$.ajaxSetup({dataType:"text"});
			//get방식으로 요청
			//$.get("요청명령어",callback함수)
			$.get("test.do",function(result){
				$("#panel").append(result);
			});//get
			*/
			
			//3)callback함수 호출
			//> 주의! callback함수 뒤에 ()를 붙이지 않는다.
			$.get("test.do",responseProc);//get
			
		})//click
		
		//3번 callback함수
		function responseProc(result){
			$("#panel").append(result);
		}//responseProc
		
	</script>


	
</body>
</html>