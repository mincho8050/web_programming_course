package net.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycle extends HttpServlet{
	
	/* web.xml에 LifeCycle서블릿 등록
	 * 
	 * 결과확인
	 * http://localhost:8090/mvcTest/life.do
	 * 
	 * 
	 * class GenericServlet{}
	 * class HttpServlet extends GenericServlet{}
	 * 
	 * HttpServlet 생명주기-------------------------
	 * 	init() 서블릿이 시작되면 한 번만 호출
	 * 		-> service() 사용자가 요청할 때마다 호출
	 * 		-> service()
	 * 		-> service()
	 * 		-> service()
	 * 				-> destroy() 서버가 중지되면 한 번만 호출
	 * --------------------------------------------
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// method=get방식 요청이 들어오면 doGet() 호출
		super.doGet(req, resp);
		System.out.println("doGet()호출...");
	}//doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// method=post방식 요청이 들어오면 doPost() 호출
		super.doPost(req, resp);
		System.out.println("doPost()호출...");
	}//doPost

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		// method=get방식 요청이 들어오면 doGet() 호출
		// method=post방식 요청이 들어오면 doPost()를
		// 구분해서 호출하는 역할
		super.service(arg0, arg1);
		System.out.println("service()호출...");
	}//service

	@Override
	public void destroy() {
		// 서버가 중지되면 1번만 자동 실행
		super.destroy();
		System.out.println("destroy()호출...");
	}//destroy

	@Override
	public void init() throws ServletException {
		// 서블릿이 최초로 호출될 때 한 번만 자동실행
		// 초기환경 구축할 때 사용
		super.init();
		System.out.println("init()호출...");
	}//init
	
	
	
	
	
}//LifeCycle
