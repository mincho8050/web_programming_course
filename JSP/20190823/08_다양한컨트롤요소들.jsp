<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08_다양한 컨트롤 요소들.jsp</title>
</head>
<body>

	<h1>다양한 컨트롤 요소들</h1>
	<form action="08_ok.jsp">
		아이디 :<input type="text" name="uid">
		<hr>
		비번	:<input type="password" name="upw">
		<hr>
		이름 :<input type="text" name="uname">
		<hr>
		내용 :<textarea rows="5" cols="20" name="content"></textarea>
		<hr>
		숫자1 : <input type="text" name="num"> <br>
		숫자2 : <input type="text" name="num"> <br>
		숫자3 : <input type="text" name="num"> <br>
		
		<!-- 
		라디오버튼
		동시에 선택하지 않으려면 name을 같이 한다.
		 -->
		<hr>
		성별 : <input type="radio" name="gender" value="M">남
		  	  <input type="radio" name="gender" value="F">여
		  	  
		<!-- 체크 박스 -->
		<hr>
		약관동의
		<input type="checkbox" name="agree" value="Y">
		<!-- value값이 없는 체크 박스 -->
		<hr>
		SMS : <input type="checkbox" name="sms">
		
		<!-- 목록 상자 -->
		<hr>
		통신 회사 : <select name="telecom">
					<option value="sk">SK
					<option value="lg">LG U+
					<option value="ktf">KTF
				  </select>
		
		<!-- hidden 속성 -->
		<!-- 폼요소지만 본문에 출력되지 않되는 속성  -->
		<input type="hidden" name="page" value="7">
		
		
		<!-- 파일첨부에 관한 속성 -->
		<!-- 주의사항: 폼태그에 enctype을 추가해야함 -->
		<!-- <form enctype="multipart/form-data"> 이렇게 -->
		<hr>
		<input type="file" name="attach">
		
		<input type="submit" value="전송">
	</form>

</body>
</html>