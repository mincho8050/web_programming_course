<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 loginProc.jsp-->
<div class="container">
	<h3>로그인</h3>
	<%
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p style='font-size:14px'>아이디/비번 다시 한번 확인해주세요</p>");
		out.println("<p><a href='javascript:history.back()' style='font-size:14px' style='font-size:14px'>다시 시도</p>");
	}else{
		//로그인 성공
		/* out.println("<p>로그인 성공</p>");
		out.println(mlevel); */
		//다른 페이지에서 로그인상태를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//쿠키(아이디 저장)--------------------------------------------
		String c_id=Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie=null;
		if(c_id.equals("SAVE")){//아이디 저장 체크를 했다면 value값이 넘어오니까
			//쿠키변수 선언
			//new Cookie("쿠키변수",값)
			cookie=new Cookie("c_id",id);
			//쿠키의 생존기간, 1개월
			//60초(1분)*60번(->1시간)*24번(->하루)*30번(약 한달)
			cookie.setMaxAge(60*60*24*30);
		}else{//체크 안한 경우
			cookie=new Cookie("c_id",""); //체크를 안하면 빈값 들어가기
			cookie.setMaxAge(0);
		}//if
		//요청한 사용자 PC에 쿠키값을 저장
		response.addCookie(cookie);
		//----------------------------------------------------------
		
		//첫페이지로 이동
		String root=Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
	}//if
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>