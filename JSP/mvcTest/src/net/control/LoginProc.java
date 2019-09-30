package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

public class LoginProc extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req, resp);
	}//doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req, resp);
	}//doPost
	
	
	//doGet, doPost에 공통적으로 들어갈 내용의 함수
	//내가 가지고 있는걸 process에 전달해주는것.
	//코딩은 여기에 한번에 하면 둘 다 적용된다.
	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		try{
			resp.setCharacterEncoding("UTF-8");
			String uid=req.getParameter("uid").trim();
			String upw=req.getParameter("upw").trim();
			
			
			//공유공간 : request, session, application
			//session 객체선언
			HttpSession session=req.getSession();
			//application객체선언
			ServletContext application=req.getServletContext();
			
			if(uid.equals("soldesk") && upw.equals("1234")){
				//로그인 성공
				req.setAttribute("r_uid", uid);
				req.setAttribute("r_upw", upw);
				
				session.setAttribute("s_uid", uid);
				session.setAttribute("s_upw", upw);
				
				application.setAttribute("a_uid", uid);
				application.setAttribute("a_upw", upw);
				
				req.setAttribute("msg", "로그인 성공!");
				req.setAttribute("img", "<img src='control/sound.png'");
				
			}else{
				//로그인 실패
				req.setAttribute("r_uid", "guest");
				req.setAttribute("r_upw", "guest");
				
				session.setAttribute("s_uid", "guest");
				session.setAttribute("s_upw", "guest");
				
				application.setAttribute("a_uid", "guest");
				application.setAttribute("a_upw", "guest");
				
				req.setAttribute("msg", "로그인 실패!");
				req.setAttribute("img", "<img src='control/fail.png'>");
				
			}//if
			
			//뷰페이지 이동
			String view="control/loginResult.jsp";
			RequestDispatcher rd=req.getRequestDispatcher(view);
			rd.forward(req, resp);
			
		}catch(Exception e){
			System.out.println("요청실패:"+e);
		}//tyr
		
	}//doPost
	
}//LoginProc
