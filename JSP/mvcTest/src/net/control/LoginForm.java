package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginForm extends HttpServlet{
	//결과확인
	//http://localhost:8090/mvcTest/login.do
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//method=get방식 요청
		
		//페이지 이동
		//1)
		//http://localhost:8090/mvcTest/control/loginForm.jsp
		//resp.sendRedirect("control/loginForm.jsp");
		
		//2)
		//이걸많이사용
		//http://localhost:8090/mvcTest/login.do
		//>절대경로를 숨길 수 있다.
		String view="control/loginForm.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(view);
		rd.forward(req,  resp);		
		
	}//doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//method=post방식 요청
	}//doPost
	
}//LoginForm
