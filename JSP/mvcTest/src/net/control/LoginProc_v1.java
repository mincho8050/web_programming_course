package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProc_v1 extends HttpServlet {
	//결과확인
	//http://localhost:8090/mvcTest/login.do
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//method=post 방식 요청
		//<form method=post action=loginproc.do>
		try{
			//1)한글 인코딩
			resp.setCharacterEncoding("UTF-8");
			
			//2)사용자가 요청한 정보를 변수에 옮겨담기
			String uid=req.getParameter("uid").trim();
			String upw=req.getParameter("upw").trim();
			
			//3)요청한 사용자에게 응답
			PrintWriter out=resp.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>로그인 결과</title>");
			out.println("</head>");
			out.println("<body>");
			out.println(" 아이디 :<strong> "+uid+"</strong>");
			out.println(" 비밀번호 :<strong> "+upw+"</strong>");
			out.println("</body>");
			out.println("</html>");
			out.close(); //자원반납!
			
		}catch(Exception e){
			System.out.println("요청실패:"+e);
		}
		
	}//doPost
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//method=get 방식
		try{
			//1)한글 인코딩
			resp.setCharacterEncoding("UTF-8");
			
			//2)사용자가 요청한 정보를 변수에 옮겨담기
			String uid=req.getParameter("uid").trim();
			String upw=req.getParameter("upw").trim();
			
			//3)요청한 사용자에게 응답
			PrintWriter out=resp.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>로그인 결과</title>");
			out.println("</head>");
			out.println("<body>");
			out.println(" 아이디 :<strong> "+uid+"</strong>");
			out.println(" 비밀번호 :<strong> "+upw+"</strong>");
			out.println("</body>");
			out.println("</html>");
			out.close(); //자원반납!
			
		}catch(Exception e){
			System.out.println("요청실패:"+e);
		}
		
	}//doGet
	
}//LoginProc
