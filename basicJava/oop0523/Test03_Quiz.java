package oop0523;

public class Test03_Quiz {
	
	public static void abs(int a){
		if(a<0){
			System.out.println(a+"의 절대값:"+(-a));
		}else{
			System.out.println(a+"의 절대값"+a);
		}
	}//abs
	
	public static void leap(int y){
		if(y%4==0&&y%100!=0||y%400==0){
			System.out.println(y+"년은 "+"윤년");
		}else{
			System.out.println(y+"년은 "+"평년");
		}
	}//leap
	
	public static void fact(int f){
		long count=1; //값이 클 수도 있으니 int형 보다는 long형으로 하자.
		for(int a=1;a<=f;a++){
			count=count*a;
		}
		System.out.println(f+"!:"+count);
	}//fact
	
	
	public static void grahp(int a,char b){
		
		for(int c=1;c<=a;c++){
			System.out.print(b);
		}
		System.out.println();
	}//grahp
	
	public static void hap(int a,int b){
		
		int start=a,end=b; //이걸 어차피 처음부터 매개변수에 start,end값으로 줘도 된다. >선생님 방식.오호..
		int hap=0;
		if(start>end){ //만약 시작값이 마지막값보다 크다면
			int tmp=start; //가상의 변수에 시작값을 잠시 두고
			start=end; //시작값을 마지막값에 둔다.
			end=tmp; //그리고 가상의 변수의 값을 마지막값에 넣는다.
			        //이렇게 되면 시작값과 마지막값이 바뀌면서 시작값<마지막값. 이렇게 된다.
		}
		for(int c=start;c<=end;c++){//시작값<마지막값(원래부터 이렇던가 아니면 위의 식에서 바뀌었든가)
			hap=hap+c;
		}
		System.out.println(a+"와"+b+"의 두 수 사이의 합은 "+hap);
	}//hap
	

//--------------------------------------------------------------------------------------	
	
	public static void main(String[] args) {
		// 메소드 연습
		
		// 문1) 절대값을 출력하시오.
		abs(-3);

//--------------------------------------------------------------------------------		
		
		// 문2) 윤년, 평년을 구분해서 출력하시오.
		leap(2019);
		
//--------------------------------------------------------------------------------		
		
		// 문3) 팩토리얼값을 출력하시오.
		//곱하기 누적
		fact(4);
		
//--------------------------------------------------------------------------------		
		
		// 문4) 전달한 수만큼 문자를 출력하시오.
		grahp(10,'#');
		
//--------------------------------------------------------------------------------		
		
		// 문5) 두 수 사이의 누적의 합을 구하시오.
		hap(2,5);
		
		
		
		
	}//main

}//class
