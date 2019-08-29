<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table{border-collapse: collapse;width: 30%;min-width:230px;max-width:320px;}
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
	input[type=submit],input[type=reset]{
		width: 100px;
		cursor: pointer;
		border: none;
		padding:5px 0 5px 0;
		}
	input[type=submit]:hover,input[type=reset]:hover{
		background-color: #d9f2e6;
		}
</style>
<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
	</p>
	
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);
	if(dto==null){
		out.print("해당글 없음!!");	
	}else{
	%>
	<form method="post" action="sungjukUpdateProc.jsp">
	 	<input type="hidden" name="sno" value="<%=sno%>">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
				<!-- value값은 가지고있는 값을 화면상에 표시 / 원래 저장된 값이 보이기 위해 -->
					<input type="text" name="uname" value="<%=dto.getUname() %>" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" value="<%=dto.getKor() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" value="<%=dto.getEng() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" value="<%=dto.getMat() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="addr">
						<option value="Seoul" <%if(dto.getAddr().equals("Seoul")){out.println("selected");} %>>서울</option>
						<option value="Jeju" <%if(dto.getAddr().equals("Jeju")){out.println("selected");} %>>제주</option>
						<option value="Busan" <%if(dto.getAddr().equals("Busan")){out.println("selected");} %>>부산</option>
						<option value="Suwon" <%if(dto.getAddr().equals("Suwon")){out.println("selected");} %>>수원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<%
	}//if
	
	%>
	


</body>
</html>