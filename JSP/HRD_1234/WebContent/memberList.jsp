<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dto" class="net.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>

<style>
	header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>

</head>
<body>
	<header>쇼핑몰 회원관리 ver 1.0</header>	
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
		<section>
		<!-- 본문 시작 -->
		
		<h2>회원목록조회수정</h2>
		
		<%
		ArrayList<MemberDTO> list=dao.list();
		if(list==null){
			out.print("자료없음");
		}else{
		%>
		
		<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<tr>
		<%
		for(int idx=0; idx<list.size(); idx++){
			dto=list.get(idx);
		%>
			<tr>
				<td><a href="memberUpdate.jsp?custno=<%=dto.getCustno()%>"><%=dto.getCustno()%></a></td>
				<td><%=dto.getCustname()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getAddress()%></td>
				<td><%=dto.getJoindate()%></td>
				<td>
				<%
				String grade=dto.getGrade();
				if(grade.equals("A")){
					out.print("VIP");
				}if(grade.equals("B")){
					out.print("일반");
				}if(grade.equals("C")){
					out.print("직원");
				}
				%>
				</td>
				<td><%=dto.getCity()%></td>
			</tr>
			<%		
		}//for end    
   		out.print("</table>");
	}//if end
	%>
		
		
		<!-- 본문 끝 -->
		</section>
	<footer>
	HRDKOREA Copyright&copy;2016 All rights reserved.
	Human Resource Development Service of Korea 
	</footer>
</body>
</html>