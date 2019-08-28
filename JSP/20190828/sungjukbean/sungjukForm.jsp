<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table{border-collapse: collapse;}
	th{width:100px;height: 30px;}
	td{width: 200px;}
	a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: none;}
</style>
<title>sungjukForm.jsp</title>

</head>
<body>

	<h1>*성적 입력 폼*</h1>
	
	<p><a href="sungjukList.jsp">[성적목록]</a></p>
	
	<form method="post" action="sungjukIns.jsp">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="uname" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="addr">
						<option value="Seoul">서울</option>
						<option value="Jeju">제주</option>
						<option value="Busan">부산</option>
						<option value="Suwon">수원</option>
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

</body>
</html>