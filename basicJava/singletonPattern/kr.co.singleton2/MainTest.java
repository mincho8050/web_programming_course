package kr.co.singleton2;

public class MainTest {

	public static void main(String[] args) {
		/*
		 * 싱글톤 클래스 연습
		 */
		
		//싱글톤 클래스는 new연산자로 객체생성 불가능.
		//LeeSoonShin lss=new LeeSoonShin(); > 에러
		//그래서 getter 함수를 만든것.
		//static은 공유,continue
		LeeSoonShin lss=LeeSoonShin.getLss();
		lss.info();
		/*
		 * 	이순산
			50
			조선
		 */
		System.out.println(lss); //kr.co.singleton2.LeeSoonShin@15db9742
		
		
		Test test=new Test();
		test.disp();//kr.co.singleton2.LeeSoonShin@15db9742 
					//주소가 같음. 객체를 새로 만들어도 같은값.
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
