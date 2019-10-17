<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_idCheck.jsp</title>
</head>
<body>
	<h3>회원가입</h3>
	<!-- 아이디를 한 글자씩 입력하면 아이디 사용가능,중복, 글자수 확인이 옆에 실시간으로 뜬다 -->
	
	<form name="memfrm" id="memfrm">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="uid" id="uid"></td>
			<td><div id="demo" style="display:none"></div></td>
		</tr>
	</table>
	</form>
	
	<script src="../js/jquery.js"></script>
	<script>
		//한 글자씩 입력때마다 이벤트 발생
		$("#uid").keyup(function(){
			//alert();
			//post방식으로 요청
			$.post("idCheck.do", //요청명령어
					"uid="+$("#uid").val(),//서버 요청 전달값
				    responseProc  //콜백함수
				   );//post
		});//keyup
		
		function responseProc(result){
			//alert(result);
			$("#demo").empty();
			$("#demo").html(result);
			$("#demo").show();
		}//responseProc
		
	</script>
	
	
	
</body>
</html>