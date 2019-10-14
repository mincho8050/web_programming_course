<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="net.member.*" %>
<jsp:useBean id="dto" class="net.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.member.MemberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdateProc.jsp</title>

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
		<%
		request.setCharacterEncoding("UTF-8");
		
		int custno=Integer.parseInt(request.getParameter("custno"));
		String custname=request.getParameter("custname");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String joindate=request.getParameter("joindate");
		String grade=request.getParameter("grade");
		String city=request.getParameter("city");
		
		dto.setCustno(custno);
		dto.setCustname(custname);
		dto.setPhone(phone);
		dto.setAddress(address);
		dto.setJoindate(joindate);
/* 		//년월일 구분기호 - 사용
		//이거 안써도 나오긴함
		String year=joindate.substring(0,4);
		String month=joindate.substring(4,6);
		String date=joindate.substring(6,8);
		joindate=year+"-"+month+"-"+date; */
		
		dto.setGrade(grade);
		dto.setCity(city);
		
		int cnt=dao.update(dto);
		if(cnt==0){
			out.print("회원수정 실패!");
		}else{
		%>
		<script>
			alert("회원수정이 완료되었습니다");
			location.href="memberList.jsp";
		</script>
		<%
		}
		%>
		
		<!-- 본문 끝 -->
		</section>
	<footer>
	HRDKOREA Copyright&copy;2016 All rights reserved.
	Human Resource Development Service of Korea 
	</footer>
</body>
</html>