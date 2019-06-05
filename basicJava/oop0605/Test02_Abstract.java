package oop0605;

abstract class Travel{ //추상메소드가 하나라도 있으면 추상클래스 > 	abstract 붙인다.
	 void view(){} //일반메소드 , 추상클래스에는 일반메소드를 섞어 쓸 수 있다.
	abstract String travelWhere();	//추상메소드 > 	abstract 붙인다
}//travel class

class TypeA extends Travel{ //부모클래스에 있던 추상메소드를 오버라이드를 해서 완성시켜야 오류가 나지 않는다.

	@Override
	String travelWhere() {
		return "여의도 불꽃축제";
	}

} //typea

class TypeB extends Travel{
	@Override
	String travelWhere() {
		return "지리산 둘레길";
	}
} //typeb

class TypeC extends Travel{
	@Override
	String travelWhere() {
		return "남산공원";
	}
} //typec





public class Test02_Abstract {

	public static void main(String[] args) {
	
//		  추상클래스의 다형성
//			> 다형성으로만 해야함


		// 추상클래스는 자신의 클래스 이름으로
		// 객체 생성 불가
//		Travel tour=new Travel(); 에러
		
		Travel tour1=new TypeA();
		System.out.println(tour1.travelWhere());
		
		Travel tour2=new TypeB();
		System.out.println(tour2.travelWhere());
		
		Travel tour3=new TypeC();
		System.out.println(tour3.travelWhere());
		
		
		/*
		 * 출력값
		 	여의도 불꽃축제
			지리산 둘레길
			남산공원
		 */
		
		
		
	}//main()

}//class
