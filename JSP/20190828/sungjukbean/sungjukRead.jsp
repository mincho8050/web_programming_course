<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukRead.jsp</title>
<style>
	table{border-collapse: collapse;width: 55%;min-width:400px;max-width:550px; }
	th{width:100px;height: 30px;background-color: #d9f2e6;}
	td{width: 200px;text-align: center;height: 25px;}
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; text-decoration: none;}
	.btn{ 
      text-decoration: none;
      padding:10px 20px 10px 20px;
      margin-top:15px;
      display:inline-block;
      border-radius: 8px;
      border:1px solid white;
    }
	.btn:hover{
		color:black !important;
		background-color: #d9f2e6;
	}
	.btn2{
	  text-decoration: none;
      display:inline-block;
      padding:1px 5px 1px 5px;
      border-radius: 8px;
      border:1px solid white;
	}
	.btn2:hover{
		color:black !important;
		background-color: #d9f2e6;
	}
</style>
</head>
<body>
	<h1>* 성적 상세보기 *</h1>
	
	<p>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);  
	//리턴형은 SungjukDTO -> 위에서 id를 dto라고 해서 사용
	//함수명 read() , 매개변수 sno
	if(dto==null){
		out.print("해당글 없음!!");	
	}else{
	%>
	
	<table border="1">
	<tr>
		<th>이름</th> 
		<td><%=dto.getUname() %></td>
	</tr>
	<tr> 
		<th>국어</th> 
		<td><%=dto.getKor() %></td>
	</tr>
	<tr>
		<th>영어</th> 
		<td><%=dto.getEng() %></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><%=dto.getMat() %></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=dto.getAver() %></td>
	</tr>
	<tr>
		<th>주소</th>
	<% 
		/* 주소를 한글로 출력 */
		String addr=dto.getAddr().toString();
		if(addr.equals("Seoul")){
			addr="서울";
		}else if(addr.equals("Busan")){
			addr="부산";
		}else if(addr.equals("Jeju")){
			addr="제주";
		}else{
			addr="수원";
		}//if
	%>
		<td><%=addr %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getWdate().substring(0,10) %></td>
	</tr>
	</table>
	<!-- sno은 위에서 담은 변수! 페이지는 독립적이지만 변수로 연결된다 -->
	<a href="sungjukUpdate.jsp?sno=<%=sno%>" class="btn">수정</a>
	&nbsp;&nbsp;
	<a href="sungjukDel.jsp?sno=<%=sno%>" class="btn">삭제</a>	
	<%
	}//if
	
	%>
	

	

</body>
</html>