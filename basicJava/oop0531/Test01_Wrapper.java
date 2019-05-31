package oop0531;

public class Test01_Wrapper {

	public static void main(String[] args) {
		/*
		 * Wrapper 클래스(클래스 이름이 Wrapper가 아니라 통칭해서 부르기 때문.)
		 * > 기본 자료형을 참조형화 해놓은 클래스들
		 * > java.lang 패키지에 선언되어 있음.
		 * 기본형 : boolean, byte, int, long, float, double, char
		 * 참조형 : Boolean, Byte, Integer, Long, Float, Double, Character
		 *  > 참조형이 된다는 것은 .이 된다는것 > 다양한 기능을 사용할 수 있음.
		 */
		
		boolean flag=true; //boolean 기본형 사용할 때
                           //기본형이기때문에 주소값이 아니라 실제값이라 flag. 하면 에러
		Boolean b1=new Boolean(true); //참조형
		Boolean b2=new Boolean("false"); //여기가 아무리 string형이어도 "true" 나 "false"
		                            //같은 boolean형 타입의 글자가 와야함. 
		
		System.out.println(b1.toString());//결과값 "true"으로 형변환
		System.out.println(b2);
		
//-------------------------------------------------------------------------------
		
		
		int a=3;
		Integer inte1=new Integer(5);  //정수형 
		Integer inte2=new Integer("7"); //String형
		System.out.println(inte1);
		System.out.println(inte2.doubleValue()); // 결과값 7.0 형변환
		
		System.out.println(Integer.toBinaryString(9)); //9라는 10진수를 2진수로 변환해 String값으로 하는것.
		                                               //결과값 "1001"
		System.out.println(Integer.toOctalString(9)); //8진수로 변환해서 String값 > "11"
		System.out.println(Integer.toHexString(9));  //16진수로 변환 String값 > "9"
		System.out.println(Integer.parseInt("4"));  //String값을 정수로 변환
		
		System.out.println(Integer.max(6, 8)); //최댓값
		System.out.println(Integer.min(6, 8)); //최솟값
	
		System.out.println("---------------------------");
//--------------------------------------------------------------------------------------
		
		long l=2L; //접미사 L은 생략가능
		Long l1=new Long(4);
		Long l2=new Long("6");
		System.out.println(l1);
		System.out.println(l2.longValue());
		
		System.out.println(Long.parseLong("8"));
		
		System.out.println("---------------------------");
		
//--------------------------------------------------------------------------------------		
		
		double d=1.2;
		Double d1=new Double(3.4);
		Double d2=new Double("5.6");
		
		// 문1) d1과 d2의 합을 구하시오
		int hap=d1.intValue()+d2.intValue();
		//hap변수가 int니까 형변환 시켜야함 .intValue() int로 형변환 시켜줌.
		System.out.println(hap);
	
		System.out.println("---------------------------");
		
//--------------------------------------------------------------------------------------
		
		char c='R';
		Character ch=new Character('T');
		System.out.println(c);
		System.out.println(ch);
		
		System.out.println(Character.isAlphabetic(6)); //int값을 주면 boolean으로 리턴값을 준다.
		                                               //출력값 false
		                                               //int값이 알파벳값인지 알려줌.
		                                               //is로 묻는것은 대부분이 리턴형이 boolean
		                                               //to로 시작하는것은 뒤에걸로 뭐 하겠다는 거.
		                                               // > ex)toString to뒤에 나와있는 자료형으로 돌려주겠다는 의미. 대부분!
		System.out.println(Character.isAlphabetic('가'));//출력값 true                                           
		System.out.println(Character.isAlphabetic('a')); //     true                                            
		System.out.println(Character.isAlphabetic('!')); //     false                                            
		
		//System.out.println(Character.isSpace(' ')); //isSpace에 보면 밑줄이 쳐저있는데
		                                              //절판되었다는 뜻. 
		                                              //써도 되지만 그래도 다른거 쓰는게 좋음.
		                                              //Deprecated : 절판되었다는 의미
		System.out.println(Character.isWhitespace(' ')); //isSpace 대신 쓰는거.
		
		
		
		System.out.println("---------------------------");
//--------------------------------------------------------------------------------------
		
		
		
		
		// 문2) 대소문자를 서로 바꿔서 출력하시오.
		String str="Gone With The Wind";
		
		for(int idx2=0;idx2<str.length();idx2++){
			char ch2=str.charAt(idx2); //int 형을 char로 변환한것을 char ch2변수에 저장.
			if(Character.isUpperCase(ch2)){//만약 대문자라면
				System.out.print(Character.toLowerCase(ch2)); //소문자로출력
			}else if(Character.isLowerCase(ch2)){//만약 소문자라면
				System.out.print(Character.toUpperCase(ch2));//대문자로출력
			}else{//대,소문자도 아니라면
				System.out.print(ch2); //그냥출력
			}//if
		}//for
		
		// 출력값 gONE wITH tHE wIND
		
		System.out.println();
		
		
		// 문3) 주민번호 각 숫자의 누적의 합을 구하시오.
		String jumin="8912304123654";
		
		int hap3=0;
		for(int idx3=0;idx3<jumin.length();idx3++){
			char ch3=jumin.charAt(idx3);//int 형을 char로 변환한것을 char ch3변수에 저장.
			//'8' > 8  char > int로 변환 .getNumericValue()
			hap3=hap3+Character.getNumericValue(ch3);
		}
		System.out.println(hap3);
		
		// 출력값 48
		
		
		
		
	}//main

}//class
