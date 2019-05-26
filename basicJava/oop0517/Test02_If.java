package oop0517;

public class Test02_If {

	public static void main(String[] args) {
		// 제어문
		// > 프로그램의 흐름을 제어
		// > 조건문 : if , switch~case
		// > 반복문 : for , while , do~while
		// > break , continue
		
		/*
		 * if(조건){조건이 true일때만 수행}
		 * 
		 * if(조건){조건이 true일 때 수행}
		 * else {조건이 false일 때 수행}
		 * 
		 * if(조건){조건이 true일 때 수행}
		 * else if(조건){조건이 true일 때 수행}
		 * else if(조건){조건이 true일 때 수행}
		 * else if(조건){조건이 true일 때 수행}
		 * else {조건이 false일 때 수행} 
		 * 
		 */
		
		
		
		String name="무궁화";
		int kor=100,eng=100,mat=30;
		
		//평균구하기
		int aver=(kor+eng+mat)/3;
		
		System.out.println("이름:"+name);
		System.out.println("국어:"+kor+"점");
		System.out.println("영어:"+eng+"점");
		System.out.println("수학:"+mat+"점");
		System.out.println("평균:"+aver+"점");
		
		//평균이 95점 이상이면 "장학생" 출력하시오.
		if(aver>=95){
			System.out.println("장학생");
		}//if end
		
		
		//국어점수가 70점 이상이면 "합격"
		//아니면 "불합격"
		if(kor>=70){
			System.out.println("합격");
		}else{
			System.out.println("불합격");
		}//if end
		
		
		//boolean형태로 나오는 것은 if로 사용할 수 있음.
		
		//수학점수가 90이상이면 "A학점" 80이상이면 "B학점" 
		//70점이상 "C학점" 60점이상"D학점" 나머지"F학점"
		
		if(mat>=90){
			System.out.println("수학:A학점");
		}else if(mat>=80){ //원래는 mat>=80&&mat<=89이 맞는 조건인데 숫자기 때문에
			               //생략해도 크게 문제가 되지 않음. 
			               //비교연산자에 한번 걸러지기 때문에 괜찮음.
			System.out.println("수학:B학점");
		}else if(mat>=70){
			System.out.println("수학:C학점");
		}else if(mat>=60){
			System.out.println("수학:D학점");
		}else{
			System.out.println("수학:F학점");
			}//
		
//------------------------------------------------------------------------------------------
		
		// 문) 평균이 70점 이상이면 "합격"
		//    (단, 국영수 과목 중에서 한 과목이라도 40점 미만이면 "재시험")
		// 나머지는 무조건 "불합격"
		
	/*	if(aver>=70&&kor>=40&&eng>=40&&mat>=40){
			System.out.println("합격");
		}else if(aver<70){
			System.out.println("불합격");
		}else if(aver>=70&&kor<40||eng<40||mat<40){
			System.out.println("재시험");
		}//내가 한것.
	*/
		
	
	
   //1)OR조건
	  if(aver>=70){//if문 안에 if문 적을 수 있음!
			if(kor<40||eng<40||mat<40){
				System.out.println("결과:재시험");
			}else{
				System.out.println("결과:합격");
			}
		}else{
			System.out.println("결과:불합격");
		}//선생님이 한것 첫번째 방식 OR조건

		
		//2)AND조건
		
		if(kor>=40&&eng>=40&&mat>=40){
			System.out.println("결과:합격");
			
		}else{
			System.out.println("결과:재시험");
		}//이거는 왜 평균을 안적으셨을까..? 내가 모르는게 있나방..
		
		
		
		
		
		
	}//

}//
