package oop0530;

//import oop0529.School;  //import안하면 에러남.
import oop0529.*; // School 클래스가 package라면 *로 해서 모두 사용가능할 수 있도록 한다.

public class Test01_Access {

	public static void main(String[] args) {

//------------------------------------------------------------------------------------------------------------------------------------------		
		
		// 1) oop0529에 있는 School 클래스의 접근제어가 public이라 basicJava 프로젝트 안에서는 사용 가능.
        //	  School sch=new School(); 
		
		// 2) oop0529 패키지에 있는 School 클래스의 접근제어가 package인 경우 > 같은 폴더안에서만 사용 가능 / 접근불가능 , 에러
		//School sch=new School();
		
		
		
		
		
		
	}//main

}//class
