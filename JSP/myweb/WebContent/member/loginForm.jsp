<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<div class="container">
	<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest"))
	{	//로그인을 하지 않은 경우
		//쿠키값 가져오기 (로그인을 안했을 경우에 보여져야 하니까)-----------------
		Cookie[] cookies=request.getCookies();
		String c_id="";
		if(cookies!=null){//쿠키가 존재하는지?
			for(int idx=0;idx<cookies.length;idx++){
				Cookie cookie=cookies[idx];
				//쿠키변수가 c_id 인지?
				if(cookie.getName().equals("c_id")==true){
					c_id=cookie.getValue();
				}//if
			}//for
		}else{
			
		}//if
		//--------------------------------------------------------------
	%>
	<h3>로그인</h3>
	<form name="loginfrm"
		  method="post"
		  action="loginProc.jsp"
		  onsubmit="return loginCheck(this)">
	<table class="table">
	<tr>
		<td>
			<input type="text" name="id" value="<%=c_id %>" placeholder="아이디를 입력하세요" required>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="passwd" placeholder="비밀번호를 입력하세요" required>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="checkbox" name="c_id" value="SAVE" <%if(!(c_id.isEmpty())){out.print("checked");} %>>아이디 저장
		&nbsp;&nbsp;
		<a href="agreement.jsp">회원가입</a>
		&nbsp;&nbsp;
		아이디/비밀번호 찾기
		</td>
	</tr>
	<tr>
		<td>
			<!-- <input type="image"> 기본속성은 submit -->
			<input type="image" src="../images/login.png">
		</td>	
	</tr>
	</table>
	</form>
	<%
	}else{
		//로그인 성공했을 때 보여주는 화면
		out.println("<strong style='color:#ff6666; cursor:default'>"+s_id+"</strong>님");
		out.println("<a href='logout.jsp' style='font-size:14px'>로그아웃</a>");
		out.println("<br><br>");
		out.println("<a href='memberUpdate.jsp' style='font-size:14px'>회원정보수정</a>&nbsp;&nbsp;");
		out.println("&nbsp;&nbsp;<a href='memberDelUpdate.jsp' style='font-size:14px'>회원탈퇴</a>");
	}//if
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>