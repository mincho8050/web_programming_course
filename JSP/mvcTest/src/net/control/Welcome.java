package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Welcome extends HttpServlet {

	//클래스의 부모가 class		: extends
	//클래스의 부모가 interface	: implements
	
	//결과확인
	//서버 다시 재시작
	//-> http://localhost:8090.mvcTest/wel.do
	
	//Welcome서블릿은 web.xml(배치관리자)에 등록해야 한다.
	
	@Override	//<-물려받은 메소드 재정의(리폼)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//<form method=get>방식으로 요청하면 호출
		//req : 내부객체 request와 동일 / resp : 내부객체 response와 동일
		try{
			
			//단순 문자열로 응답(AJAX)
			//resp.setContentType("text/plain; charset=UTF-8");
			
			//HTML문서 구조로 응답
			resp.setContentType("text/html; charset=UTF-8");
			
			//요청한 사용자에게 응답하기 위한 객체
			PrintWriter out=resp.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>환영합니다</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<strong>대한민국</strong>");
			out.println("<hr>");
			out.println("<span style='color: red'>오필승코리아</span>");
			out.println("<hr>");
			out.println("<table border='1'>");
			out.println("<tr>");
			out.println("<th>이름</th>");
			out.println("<td>무궁화</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</body>");
			out.println("</html>");
			out.close(); //자원반납!
			
		}catch(Exception e){
			System.out.println("요청실패:"+e);
		}//try
		
	}//doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//<form method=post> 방식으로 요청했을때 호출
	}//doPost
	
	
	
}//
