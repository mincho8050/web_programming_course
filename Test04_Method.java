package oop0523;

public class Test04_Method {
	
	public static int test1(int a,int b){ //return값이 있으니 void를 빼고 sum의 자료형이 int를 사용.
		int sum=a+b;
		return sum; //나를 부른 곳으로 돌아갈때 sum값을 가져간다는 의미.
		            //return은 없거나 1개만 가능.
	}//test1

	public static boolean leap(int y){
		if(y%4==0&&y%100!=0||y%400==0){
			return true; //조건이 맞으면 true값을 돌려보내고
		}else{
			return false;//조건이 안맞으면 false값을 돌려보낸다는 의미.
		}
	}//leap
	
	public static char upper(char c){
		if(c>='a'&&c<='z'){
			return (char)(c-32);//소문자일 경우 return값을 대문자로 변경해서 돌려보낸다.
		}else{
			return c; //위의 조건이 아니라면 그냥 c를 돌려보낸다.
		}
		
	}//upper
	
	public static String append(String a,String b){
		return a+b;
	}//append
	
	public static int max(int a,int b,int c){
		
		int d=(a<b)?b:a; //삼항연산자
		d=(c<d)?d:c;     //(조건)?참:거짓;
		
		return d;
		
	}//max
	
	
	public static void main(String[] args) {
		// 리턴값이 있는 경우
		// 함수 정의 >  리턴형 함수명(){}
		// void > 리턴값이 없다.
		// 값을 가져가서 계산 후 다시 돌려준다.
		
		int result=test1(3,5); //test1(3,5);은 sum인 8을 가지고 있음. 
		                       //test1(3,5); 값을 result 변수에 저장.
		
		System.out.println(result);  //8
		
		result=test1(4,4);
		System.out.println(result);
		
	    System.out.println(test1(7,5));//이렇게 호출해도 틀린 문법이 아님.

//-----------------------------------------------------------------------------------------------------------	    
	    
		if(leap(2019)){//함수를 if안에서 호출.
			           //return의 값을 boolean형으로 해야함.
			System.out.println("윤년");
		}else{
			System.out.println("평년");
		}
		
		
//-----------------------------------------------------------------------------------------------------------	   
	
		//대문자로만 출력하시오.
		char ch=upper('r'); //자료형을 함수랑 동일하게 해야함.
		System.out.println(ch);
		
		
		
//-----------------------------------------------------------------------------------------------------------	  
		
		String str=append("손흥민","토트넘");
		System.out.println(str);
		
		
		
//-----------------------------------------------------------------------------------------------------------
		
		// 문) 세개의 정수 중에서 최댓값을 출력하시오.
		int m=max(3,7,9);
		System.out.println(m);
		
		
		
		

	}//main

}//class
