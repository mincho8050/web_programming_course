package kr.co.form1.test01;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
}//
