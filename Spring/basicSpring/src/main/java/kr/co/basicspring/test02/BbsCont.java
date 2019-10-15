package kr.co.basicspring.test02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
//myweb프로젝트(MVC)에서는 filter를 만들었음
import org.springframework.web.filter.CharacterEncodingFilter; //한글변환




@Controller
public class BbsCont {
	public  BbsCont() {
		System.out.println("-------------BbsCont()객체 생성됨");
	}//
	
	//결과확인
	//http://localhost:8090/basicspring/bbs/create.do
	
	//1)
	/*
	@RequestMapping(value = "bbs/create.do",method = RequestMethod.GET)
	public ModelAndView bbsForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("bbs/bbsForm");
		return mav;
	}//bbsForm
	*/
	//2) 단순히 파일을 불러올때는 이렇게 해도 됨
	@RequestMapping(value = "bbs/create.do",method = RequestMethod.GET)
	public String bbsForm() {
		return "bbs/bbsForm";
	}
	
//------------------------------------------------------------------------------------------
	//동일한 요청 명령어를 GET | POST 방식으로 분리해서 호출 가능하다.
	//가)
	/*
	@RequestMapping(value = "bbs/create.do" , method = RequestMethod.POST)
	public ModelAndView bbsIns(HttpServletRequest req) {
		
		String wname=req.getParameter("wname").trim();
		String subject=req.getParameter("subject").trim();
		String content=req.getParameter("content").trim();
		String passwd=req.getParameter("passwd").trim();
	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("bbs/bbsResult");
		
		mav.addObject("wname",wname);
		mav.addObject("subject",subject);
		mav.addObject("content",content);
		mav.addObject("passwd",passwd);	
		
		return mav;
	}//bbsForm
	*/
	
	//나) 매개변수(parameter)가 DTO객체인 경우
	//조건은 bbsForm.jsp에서의 name과 BbsDTO의 이름과 getter/setter함수가 있어야 한다.
	//->해당 클래스에 반드시 폼 컨트롤 요소이름으로 되어 있는 멤버변수와 
	//->각 getter/setter함수가 있어야 한다.
	@RequestMapping(value = "bbs/create.do" , method = RequestMethod.POST)
	public ModelAndView bbsIns(BbsDTO dto) {
		//dto를 매개변수로 잡으면 파일전송도 가능
		System.out.println("wname : "+dto.getWname());
		System.out.println("subject : "+dto.getSubject());
		System.out.println("content : "+dto.getContent());
		System.out.println("passwd : "+dto.getPasswd());
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("bbs/bbsResult2");
		
		//request영역에 dto객체 올리기
		mav.addObject("dto", dto);
		
		return mav;
	}//bbsIns
	
	
	
	
}//
