package oop0523;

public class Test06_Math {

	public static void main(String[] args) {
		// Math 클래스 : 수학관련 클래스
		// > 클래스명.함수
		
        //절대값.
	    System.out.println(Math.abs(-3));
		
		System.out.println(Math.ceil(1.3));  //올림 2.0
		System.out.println(Math.floor(2.7)); //버림 2.0
		System.out.println(Math.round(3.8)); //반올림  4
		
		
		//큰 값
		System.out.println(Math.max(3, 9));
		//작은값
		System.out.println(Math.min(7, 9));
		
		//return값이 있으면 중복해서 사용가능
		System.out.println(Math.max(7, Math.max(5, 6)));
		

//----------------------------------------------------------------------------------------------------------------
		
		// Math클래스에서 제일 많이 사용되는 함수.
		// > random 무작위
		// 난수 : random 값
		// 자바에서 랜덤값 발생범위는 0.0<=r<1.0 , double형으로 나옴.
		
		System.out.println(Math.random()); //컴파일을 할때마다 랜덤으로 double형 값이 나옴.
		
		System.out.println(Math.random()*2);
		
		System.out.println((int)(Math.random()*2));//0 또는 1 
		                                           //2는 안나옴 왜냐면 발생범위가 1.0 미만이기 때문이다.
		System.out.println((int)(Math.random()*3));//0,1,2
		System.out.println((int)(Math.random()*4));//0,1,2,3
		//System.out.println((int)(Math.random()*n)); 을 하면 나오는 수는 n-1까지 나옴.
		//나머지 연산자도 n으로 나누면 n-1까지만 나온다.
		
		
//---------------------------------------------------------------------------------------------------------------
		
		// 문) 주사위 수의 범위 : 1~6
	    System.out.println("주사위 "+(int)(Math.random()*6+1)); //0~5니까 +1해서 1~6으로 맞춘다.
		
		
//--------------------------------------------------------------------------------------------------------------------
	    
	    // 문) 로또번호 범위 : 1~45
	    System.out.println((int)(Math.random()*45+1)); //1~45
	    
		
//--------------------------------------------------------------------------------------------------------------------	
	    
	    // 문) 로또번호 6개 발생
	    System.out.println((int)(Math.random()*45+1));
	    System.out.println((int)(Math.random()*45+1));
	    System.out.println((int)(Math.random()*45+1));
	    System.out.println((int)(Math.random()*45+1));
	    System.out.println((int)(Math.random()*45+1));
	    System.out.println((int)(Math.random()*45+1));
		
		
		
		
		
		
		
	}//main

}//class
