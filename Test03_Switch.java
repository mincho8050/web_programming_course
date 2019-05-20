package oop0517;

public class Test03_Switch {

	public static void main(String[] args) {
		// switch~case문
		// break문
		// > 제시하는 값과 동일한 값을 찾아서 수행
		// > 실수형, 논리형등은 사용할 수 없다.
	
/*		switch(20){//제시한 값과 동일한 값을 찾는것. 목록에서,경우의 수에서 찾음.
		case 10:System.out.println("SEOUL");break;
		//case앞에 있는 숫자가 경우의 수.
		//경우의 수를 나눌때는 순차적이지 않아도 된다.
		//그러나 보기편하게 정리해서 하자.
		case 20:System.out.println("JEJU");break;
		case 30:System.out.println("BUSAN");break;
		}//목록에 있는 값을 입력하면 아무것도 출력되지 않는다.
		
		
//------------------------------------------------------------------------
		
		//경우수에 없는 값은 default값이 수행된다.
		switch(10000){
		case 40:System.out.println("SEOUL");break;
		case 50:System.out.println("JEJU");break;
		case 60:System.out.println("BUSAN");break;
		default:System.out.println("etc..");
		}
		

		
		switch(80){
		case 70:System.out.println("SEOUL");break;
		case 80:System.out.println("JEJU");
		//80을 입력하면 80은 break가 없으면 그 자리에서 흘러가기 때문에
		//출력값이 JEJU와 BUSAN 둘 나옴. 
		//때에 따라 적당히 사용하장.
		case 90:System.out.println("BUSAN");break;
		}
		
	*/	
//----------------------------------------------------------------------
		
		// 문) 평균 점수에 따라서 A, B, C, D, F학점을 출력하기.
		
		int kor=95,eng=90,mat=80;
		int aver=(kor+eng+mat)/3;
		
//내가 한건 모르겠옹.
		//선생님이 하신것.
		//int 는 정수기 때문에 10으로 나누면 정수로 나온다.
		//그래서 한당.. 우와,,몰랐구요,,
		switch(aver/10){//이렇게10으로 나누면 정수형으로 몫을 구한다
		case 10://System.out.println("A");break; 적어도 되지만 안적어도 괜찮음.
		case 9:System.out.println("A");break;
		case 8:System.out.println("B");break;
		case 7:System.out.println("C");break;
		case 6:System.out.println("D");break;
		default:System.out.println("F");
		}
		
		
		
		
		
		
		
		
		

	}//

}//
