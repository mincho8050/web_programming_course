package kr.co.mymelon.media;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class MediaCont {
	public MediaCont() {
		System.out.println("------------MediaCont()객체생성됨...");
	}//MediaCont
	
	@RequestMapping(value = "/media/create.do", method = RequestMethod.GET)
	public String createForm() {
		return "media/createForm";
	}//createForm
	
	@RequestMapping(value = "/media/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(MediaDTO dto, HttpServletRequest req) {
		//1)pom.xml -> 의존성 주가
		//2)MediaDTO -> posterMF, filenameMF 필드 추가 후 getter, setter 함수 생성
		//3)servlet-context.xml에 스프링빈 등록
		//
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/msgView");
		return mav;
	}//createForm
	
}//
