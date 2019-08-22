<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_메소드.jsp</title>
</head>
<body>
	<h1>JSP 사용자 정의 함수</h1>
	최댓값 : <%=max(3,5) %>
	<hr>
	두 수 사이의 차이 : <%=diff(2,6) %>
	<hr>
	
	<%!
		//JSP함수 작성 영역(많이 사용안함) !를 붙이면 함수작성공간
		public int max(int a, int b){
			return Math.max(a,b);
		}//max
		public int diff(int a, int b){
			int c=a-b;
			return (c<0)?-c:c;
		}//diff	
	%>
	

</body>
</html>