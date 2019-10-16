package kr.co.basicspring.test03;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller //URL에서 요청한 명령어를 처리하는 클래스
			//<-스프링컨테이너(서버)에 의해서 자동으로 객체 생성된다.
public class LoginCont {
	public LoginCont() {
		System.out.println("------------------LoginCont()객체생성됨");
	}//LoginCont
	
	//결과 확인
	//http://localhost:8090/basicspring/login.do
	
	@RequestMapping(value = "login.do",method=RequestMethod.GET )
	public String loginForm() {
		// /WEB-INF/views/(prefix부분) + login/loginForm + .jsp(suffix부분)
		return "login/loginForm";
	}//loginForm
	
	//사용자가 요청한 정보를 가져와서 처리하는 다양한 방법
	/*
	//1)
	@RequestMapping(value = "login.do",method=RequestMethod.POST )
	public ModelAndView loginProc(HttpServletRequest req) {
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
	}//loginProc
	*/
	
	/*
	//2)
	@RequestMapping(value = "login.do",method=RequestMethod.POST )
	public ModelAndView loginProc(@RequestParam("id") String id,
								  @RequestParam("pw") String pw) {
		
	}//loginProc
	*/
	/*
	//3)
	@RequestMapping(value = "login.do",method=RequestMethod.POST )
	public ModelAndView loginProc(String id, String pw) {
	}//loginProc
	*/
	
	/*
	//4) 매개변수로 DTO객체가 오면 반드시 getter,setter함수가 있어야 한다.
	@RequestMapping(value = "login.do",method=RequestMethod.POST )
	public ModelAndView loginProc(LoginVO vo) {
	}//loginProc
	*/
	
	@RequestMapping(value = "login.do",method=RequestMethod.POST )
	public ModelAndView loginProc(LoginVO vo, HttpServletRequest req, HttpSession session) {
		String id=vo.getId();
		String pw=vo.getPw();
		//System.out.println(id);
		//System.out.println(pw);
		
		ModelAndView mav=new ModelAndView();
		if(id.equals("soldesk") && pw.equals("1234")) {
			//로그인 성공
			mav.setViewName("login/loginResult");
			session.setAttribute("s_id", id);
			session.setAttribute("s_pw", pw);
			req.setAttribute("msg", "로그인 성공!");
		}else {
			//로그인 실패
			mav.setViewName("login/msgView");
			mav.addObject("msg", "<p>아이디와 비밀번호가 일치하지 않습니다.</p>");
			mav.addObject("link","<a href='javascript:history.back()'>[다시 시도]</a>");
		}//if
			

		return mav;
		
	}//loginProc
	
	
	
	
	
	
	
}//
