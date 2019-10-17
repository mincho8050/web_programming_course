package kr.co.form1.test01;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxTestCont {
	
	public AjaxTestCont() {
		System.out.println("------AjaxTestCont()객체 생성");
	}//
	
	@RequestMapping("/member/test.do")
	public void ajaxTest(HttpServletRequest req, HttpServletResponse resp) {
		try {
			//사용자 요청 명령어 가져오기
			//System.out.println(req.getRequestURI());
			//> /form1/member/test.do
			//System.out.println(req.getRequestURL());
			//> http://localhost:8090/form1/member/test.do
			
			resp.setContentType("text/plain; charset=UTF-8"); //jsp파일에 있는 contentType복붙.
															  //단순한 문자열이기때문에 html -> plain으로 수정
			PrintWriter out=resp.getWriter();
			out.print("서버에서 응답해준 메시지 : ");
			out.print("무궁화 꽃이 피었습니다.");
			out.flush();
			out.close();
			
		}catch(Exception e) {
			System.out.println("응답실패:"+e);
		}//try
	}//ajaxTest
	
	
	@RequestMapping("/member/idCheck.do")
	public void idCheck(HttpServletRequest req, HttpServletResponse resp) {
		try {
			
			String uid=req.getParameter("uid").trim();
			String message=""; //응답메시지
			if(uid.length()<5 || uid.length()>=11) {
				message="<span style='color:red;font-weight:bold'>아이디는 5~10글자 이내 입력해주세요!</span>";
			}else {
				MemberDAO dao=new MemberDAO();
				int cnt=dao.duplecateID(uid); //아이디중복확인
				if(cnt==0) {
					message="<span style='color:blue;font-weight:bold'>사용 가능한 아이디입니다.</span>";
				}else {
					message="<span style='color:green;font-weight:bold'>중복된 아이디입니다.</span>";
				}//if
				
			}//if
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(message);
			out.flush();
			out.close();
			
		}catch (Exception e) {
			System.out.println("응답실패:"+e);
		}//try
	}//idCheck.do
	
	
	
	@RequestMapping("/member/idCheck2.do")
	public void idCheck2(HttpServletRequest req, HttpServletResponse resp) {
		try {
			
			String uid=req.getParameter("uid").trim();
			MemberDAO dao= new MemberDAO();
			int cnt=dao.duplecateID(uid);//아이디 중복 확인
			
			//1)text로 응답-----------------------------------
			/*
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(cnt);
			out.flush();
			out.close();
			*/
			
			//2)json으로 응답-----------------------------------
			//pom.xml에 의존성 추가(라이브러리 추가)
			JSONObject obj=new JSONObject();
			obj.put("count", cnt);
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(obj.toString());
			out.flush();
			out.close();
			
		}catch (Exception e) {
			System.out.println("응답실패:"+e);
		}//try
	}//idCheck2.do
	
	
}//
