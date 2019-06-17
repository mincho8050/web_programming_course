package kr.co.singleton1;

public class SingletonMainTest {

	public static void main(String[] args) {
		/*
		 * 싱글톤 클래스 연습
		 * 
		 */
		
		//Singleton obj=new Singleton(); //	>에러 , 	생성자 함수를 private로 막아놓았기 때문에 
										//			new 연산자로 객체를 생성할 수 없다.
		
		
		//static 접근 > 클래스명.static변수나 함수로 접근한다.
		Singleton obj1=Singleton.getSingle();
		System.out.println(obj1);	//kr.co.singleton1.Singleton@15db9742
		
		Singleton obj2=Singleton.getSingle();
		System.out.println(obj2);	//kr.co.singleton1.Singleton@15db9742
		//아무리 obj1,2,3..해서 변수를 바꿔서 찍어봐도 값은 똑같음. 
		//같은 객체를 사용함. 
		
		if(obj1==obj2){
			System.out.println("같은 객체입니다");
		}else{
			System.out.println("다른 객체입니다.");
		}//if	> 결과값 > 같은 객체입니다

			
		
		

	}//main

}//class
