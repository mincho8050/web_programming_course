package kr.co.mymelon;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("----------HomeController()객체생성됨");
	}//HomeController
	
	//mymelon프로젝트 첫페이지 호출 명령어 등록
	//http://localhost:8090/mymelon/home.do
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav=new ModelAndView();
		//jsp를 부를수도 있지만 명령어로 부를 수 있다.
		//redirect -> 등록된 명령어를 호출한다
		mav.setViewName("redirect:/media/list.do");
		return mav;
	}//home
	
}//
