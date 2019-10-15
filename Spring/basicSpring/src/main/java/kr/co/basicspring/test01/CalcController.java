package kr.co.basicspring.test01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/*
 * 스프링 프레임워크 특징
 * - 환경설정이 복잡하다
 * - 어노테이션 방식으로 구성할 수 있다.
 * */


@Controller //해당 클래스는 컨트롤러 기능이다.
			//스프링컨테이너(서버)에서 자동으로 객체 생성된다.
public class CalcController {
	
	public CalcController() {
		System.out.println("---------CalcController() 객체 생성됨");
	}
	
	//결과확인
	//http://localhost:8090/basicspring/add.do?no1=5&no2=8
	
	//@RequestMapping
	//->요청 명령어 등록
	//->요청 명령어 등록 후 실행의 주체는 메소드(함수)로 한다.
	
	
	//1) @RequestMapping(value="요청명령어",method=GET|POST)
	
	@RequestMapping(value = "/add.do" , method=RequestMethod.GET)
	public ModelAndView add(HttpServletRequest req) {
		//사용자가 요청한 값 가져오기
		int no1=Integer.parseInt(req.getParameter("no1"));
		int no2=Integer.parseInt(req.getParameter("no2"));
		System.out.println(no1);
		System.out.println(no2);
		int result=no1+no2;
		
		//view단으로 이동하기 위한 클래스
		//두 클래스 중 아무거나 사용 가능
		//->Model
		//->ModelAndView
		ModelAndView mav=new ModelAndView();
		//View페이지로 이동
		//servlet-context.xml -> prefix(접두사)	: /WEB-INF/views/
		//					  -> suffix(접미사) : .jsp
		//접두사와 접미사는 변경가능
		// /WEB-INF/views/(prefix)calcResult.jsp(suffix) -> 이런식으로 구성
		mav.setViewName("calcResult");
		
		//공유장소 req영역에 값 올리기 
		req.setAttribute("msg", "<h1>두수의 합</h1>");
		req.setAttribute("img","<img src='resources/images/add.png'>" );
		req.setAttribute("no1", no1);
		req.setAttribute("no2",no2 );
		req.setAttribute("result",result );
		
		return mav;
		
	}//add
	
	//결과확인
	//http://localhost:8090/basicspring/sub.do?no1=5&no2=8
	
	@RequestMapping(value = "/sub.do",method =RequestMethod.GET)
	public ModelAndView sub(HttpServletRequest req) {
		
		int no1=Integer.parseInt(req.getParameter("no1"));
		int no2=Integer.parseInt(req.getParameter("no2"));
		System.out.println(no1);
		System.out.println(no2);
		int result=no1-no2;
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");
		
		//공유공간 request영역에 값 올리기
		//req.setAttribute 대신 mav.addObject써도 됨
		mav.addObject("msg", "<h1>두수의 합</h1>");
		mav.addObject("img","<img src='resources/images/sub.png'>" );
		mav.addObject("no1", no1);
		mav.addObject("no2",no2 );
		mav.addObject("result",result );
		
		return mav;
		
	}//sub
	
	//결과확인
	//http://localhost:8090/basicspring/mul.do?no1=5&no2=8
	
	@RequestMapping(value = "/mul.do",method =RequestMethod.GET)
	public ModelAndView mul(HttpServletRequest req) {
		
		int no1=Integer.parseInt(req.getParameter("no1"));
		int no2=Integer.parseInt(req.getParameter("no2"));
		System.out.println(no1);
		System.out.println(no2);
		int result=no1*no2;
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");
		
		//공유공간 request영역에 값 올리기
		//req.setAttribute 대신 mav.addObject써도 됨
		mav.addObject("msg", "<h1>두수의 합</h1>");
		mav.addObject("img","<img src='resources/images/mul.png'>" );
		mav.addObject("no1", no1);
		mav.addObject("no2",no2 );
		mav.addObject("result",result );
		
		return mav;
		
	}//mul
	
	//결과확인
	//http://localhost:8090/basicspring/div.do?no1=5&no2=8
		
	@RequestMapping(value = "/div.do",method =RequestMethod.GET)
	public ModelAndView div(HttpServletRequest req) {
			
		int no1=Integer.parseInt(req.getParameter("no1"));
		int no2=Integer.parseInt(req.getParameter("no2"));
		System.out.println(no1);
		System.out.println(no2);
		double result=(double)no1/(double)no2;
			
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");

		mav.addObject("msg", "<h1>두수의 합</h1>");
		mav.addObject("img","<img src='resources/images/div.png'>" );
		mav.addObject("no1", no1);
		mav.addObject("no2",no2 );
		mav.addObject("result",result );
			
		return mav;
			
	}//div
	
	
	//2)요청명령어를 처리하는 메소드 매개변수의 유연성
	//@RequestParam("요청명령어") 자료형 변수명
	//->사용자가 요청한 값을 직접 변수에 저장 가능하다.
	@RequestMapping("diff.do") //<-GET|POST 둘 다 허용
	public ModelAndView diff(@RequestParam("no1") int a, @RequestParam("no2") int b) {
		
		//두 수 사이의 차이
		int result=Math.abs(a-b);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");

		mav.addObject("msg", "<h1>두수의 차이</h1>");
		mav.addObject("no1", a);
		mav.addObject("no2",b );
		mav.addObject("result",result );
			
		return mav;
		
	}//diff
	
	
//--------------------------------------------------------------------------
	//3)사용자가 요청한 값을 매개변수로 직접 지정
	//->요청변수명과 매개변수명이 동일해야 한다.
	@RequestMapping("max.do")
	public ModelAndView max(int no1, int no2) {
		//두 수 중 큰수 
		int result=Math.max(no1, no2);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");

		mav.addObject("msg", "<h1>두 수 중 큰수</h1>");
		mav.addObject("no1", no1);
		mav.addObject("no2",no2 );
		mav.addObject("result",result );
		
		return mav;
	}//max
	
}//
