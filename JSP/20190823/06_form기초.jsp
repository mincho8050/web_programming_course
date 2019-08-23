<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_form기초.jsp</title>
</head>
<body>
	<h1>* 성적 입력 *</h1>
	<!-- 
		<form>
		사용자가 입력한 정보를 서버로 전송하기 위한 양식
		- name:폼 이름. 웹서버에서
		- id : 폼 아이디. 주로 JavaScript, jQuery에서 사용
		- method : 폼 전송방식. get / post 방식
			- 생략될 때는 기본방식이 get
		- action : 사용자가 요청한 정보를 서버가 받아서 처리할 결과페이지
		- enctype : 폼에서 파일을 첨부해서 서버로 전송하고자 할 때
			- enctype 속성은 method="post"인 경우에만 사용할 수 있다.
			- 속성 : "multipart/form-data" 추가
		-------------------------------------------------------------
		전송방식
		- 1) method="get" 방식 : 사용자가 요청한 정보가 URL 노출
			- test.jsp?서버로전송되는값들
			- test.jsp?변수1=값1&변수2=값2&변수3=값3 ..	
			- 용량 한계
			- 예) 검색어
		- 2) method="post" 방식 : 사용자가 요청한 정보가 URL에 노출되지 않고
								 패키지화 되어서 서버로 전송
			- 한글이 깨짐
			- 예) 비번, 주민번호, 계좌번호 등
	 -->
	<form name="sungkjukfrm"
		  id="sungkjukfrm"
		  method="post"
		  action="06_formok.jsp">
		이름 :<input type="text" name="uname" id="uname" size="10" maxlength="10">
		<hr>
		국어 :<input type="number" name="kor" id="kor" size="5" min="0" max="100">
		<hr>
		영어 :<input type="number" name="eng" id="eng" size="5" min="0" max="100">
		<hr>
		수학 :<input type="number" name="mat" id="mat" size="5" min="0" max="100">
		<hr>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>

</body>
</html>