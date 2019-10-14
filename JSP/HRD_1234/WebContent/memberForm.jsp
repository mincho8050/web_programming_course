<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm.jsp</title>

<style>
	header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>

</head>

<script>
	
	function  memberCheck(f) {
		var custname=f.custname.value;
		custname=custname.trim();
		if(custname.length==0){
			alert("회원성명이 입력되지 않았습니다.");
			f.custname.focus();
			return false;
		}//if
		var phone=f.phone.value;
		phone=phone.trim();
		if(phone.length==0){
			alert("전화번호가 입력되지 않았습니다.");
			f.phone.focus();
			return false;
		}//if
		var address=f.address.value;
		address=address.trim();
		if(address.length==0){
			alert("주소가 입력되지 않았습니다.");
			f.address.focus();
			return false;
		}//if
		var joindate=f.joindate.value;
		joindate=joindate.trim();
		if(joindate.length==0){
			alert("가입일자가 입력되지 않았습니다.");
			f.joindate.focus();
			return false;
		}//if
		var grade=f.grade.value;
		grade=grade.trim();
		if(grade.length==0){
			alert("회원등급이 입력되지 않았습니다.");
			f.grade.focus();
			return false;
		}//if
		var city=f.city.value;
		city=city.trim();
		if(city.length==0){
			alert("도시코드가 입력되지 않았습니다.");
			f.city.focus();
			return false;
		}//if
		
		return true;
	}//memberCheck

</script>

<body>
	<header>쇼핑몰 회원관리 ver 1.0</header>	
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
		<section>
		<!-- 본문 시작 -->
		
		<h2>홈쇼핑 회원 등록</h2>
		<form method="post"
			  action="memberIns.jsp"
			  onsubmit="return memberCheck(this)">
		
		<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input type="text" name="custno"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록">
				<input type="submit" value="조회" onclick="location.href='memberList.jsp'">
			</td>
		</tr>
		</table>
		
		</form>
		
		
		<!-- 본문 끝 -->
		</section>
	<footer>
	HRDKOREA Copyright&copy;2016 All rights reserved.
	Human Resource Development Service of Korea 
	</footer>
</body>
</html>