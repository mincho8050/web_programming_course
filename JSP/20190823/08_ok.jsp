<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08_ok.jsp</title>
</head>
<body>
	
	<h1>*다양한 폼 컨트롤 요소 결과*</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	
	//trim() 공백제거
	String uid=request.getParameter("uid").trim();
	String upw=request.getParameter("upw").trim();
	String uname=request.getParameter("uname").trim();
	String content=request.getParameter("content").trim();
	
	out.print(uid+"<hr>");
	out.print(upw+"<hr>");
	out.print(uname+"<hr>");
	//<textarea>값은 엔터를 <br>로 치환해서 출력해야함!(그렇지않으면 그냥 먹히지 않음)
	content=content.replace("\n", "<br>");
	out.print(content+"<hr>");
	
	//request객체에 존재하지 않는 정보를 가져오기
	//>null 값이 반환된다
	out.print(request.getParameter("kor"));
	out.print("<br>");
	
	//name이 동일한 경우
	//예를 들어 <input type="text" name="num">
	//getParameterValues() 은 리턴형이 String[] 1차 String 배열
	String[] num=request.getParameterValues("num");
	for(int i=0;i<num.length;i++){
		out.print(num[i]+"<br>");
	}//for
	out.print("<hr>");
			
	//라디오 버튼
	out.print("성별:"+request.getParameter("gender"));
	out.print("<hr>");
	
	//체크 박스
	//<input type="checkbox" name="agree" value="Y">
	//체크를 하면 Y , 체크하지 않으면 null값이 출력
	out.print("약관동의:"+request.getParameter("agree"));
	out.print("<hr>");
	//value값이 없는 체크 박스
	//체크하면 on / 체크하지 않으면 null
	out.print("sms:"+request.getParameter("sms"));
	out.print("<hr>");
	
	//목록 상자
	out.print("통신회사:"+request.getParameter("telecom"));
	out.print("<hr>");
	
	//hidden 속성
	out.print("페이지:"+request.getParameter("page"));
	out.print("<hr>");
	
	
	//파일첨부 속성
	//파일이 전송된 것이 아니라 파일명!이 전송된 것임
	//첨부된 파일을 가져오려면 다른 방식으로 request객체에 접근해야 한다!!!
	//request.getParameter("attach")는 실제 파일을 가지고 있는 것이 아니라 파일명이 출력된 것이다.
	out.print("첨부 파일:"+request.getParameter("attach"));
	out.print("<hr>");
	
	
	
	%>

</body>
</html>