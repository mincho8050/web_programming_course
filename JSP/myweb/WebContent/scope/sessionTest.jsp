<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>sessionTest.jsp</title>
</head>
<body>

	<h3>세선 session</h3>
	
	<%
	/* 
	session 내부객체
	- HttpSession session
	- 요청한 사용자에게 개별적으로 접근
	- 선언된 세션변수는 전역적 성격으로 유지된다
	- 일정 시간 이벤트가 발생되지 않으면 자동 삭제
	*/
	out.print("현재 세션 유지 시간");
	out.print(session.getMaxInactiveInterval()); //1800
	out.print("초(30분) <hr>"); //1800
	
	//------------------------------------------------------------
	
	//세션 유지 시간 변경
	
    //1)
    /* session.setMaxInactiveInterval(60*10);
    out.print("변경된 세선 유지 시간");
    out.print(session.getMaxInactiveInterval());
    out.print("초(10분) <hr>"); */
    
    //2) 배치관리자 web.xml (프로젝트의 WEB-INF 폴더 안)
    //	 세션시간설정, 환경설정등 지정
    //   web.xml이 수정 되면 반드시 서버를 재시작 해야한다.
    /* 
    <!-- 세션 유지 시간 설정(10분) -->
	  <session-config>
	  	<session-timeout>600</session-timeout>
	  </session-config>
    */
    
    //------------------------------------------------------------
    
    //세션변수
    //->myweb프로젝트의 모든 페이지에서 공유되는 전역변수
    //->별도의 자료형이 없다
    
    //세션변수 선언
    //session.setAttribute("변수명",값)
    session.setAttribute("s_id", "soldesk");
    session.setAttribute("s_pw", "12341234");
    
    //세션변수 값 가져오기
    Object obj=session.getAttribute("s_id");
    String s_id=(String)obj;
    String s_pw=(String)session.getAttribute("s_pw");
    out.print("세선변수 s_id : "+s_id+"<hr>"); //soldesk
    out.print("세선변수 s_pw : "+s_pw+"<hr>"); //12341234
    
    //세션 변수를 강제로 삭제(ex.로그아웃) -> null값
    session.removeAttribute("s_id");
    session.removeAttribute("s_pw");
    out.print("세션변수 삭제후 <hr>");
    out.print("세선변수 s_id : "+session.getAttribute("s_id")+"<hr>"); //null
    out.print("세선변수 s_pw : "+session.getAttribute("s_pw")+"<hr>"); //null
    
    //세션영역에 있는 모든값 전부 강제 삭제
    //session.invalidate();
    
    //세션객체에서 발급해 주는 아이디
    out.print("세션 임시 아이디 : ");
    out.print(session.getId()+"<hr>");
    

    //------------------------------------------------------------
    
    /* 
    application 내부객체
    - ServletContext application
    - 서버에 대한 정보를 관리하는 객체
    - 사용자 모두가 공유하는 전역적 성격의 객체
    */
    // /bbs폴더의 실제 물리적인 경로
    // 실제경로 D:\java0514\workspace\myweb\WebContent\\bbs
   	out.print(application.getRealPath("/bbs")); //강추
   	out.print("<br>");
   	
   	out.print(request.getRealPath("/bbs"));
   	out.print("<br>");
    
  	//application 내장변수
    application.setAttribute("uname", "손흥민");
    out.print(application.getAttribute("uname"));
    
  	//-----------------------------------------------  
  	
    //response 내부 객체
    //-> 요청한 사용자에게 응답할때
    
    //페이지 이동
    //response.sendRedirect("파일명")
    
    //요청한 사용자에게 응답 메세지 전송
    //PrintWriter write=response.getWriter();
    
    
   

	%>

</body>
</html>