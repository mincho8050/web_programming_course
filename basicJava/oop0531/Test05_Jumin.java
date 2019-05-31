package oop0531;





public class Test05_Jumin {

	public static void main(String[] args) {
		/*
		 * 문제)
		 * 주민번호 유효성 검사 후 
		 * 생년월일, 성별, 나이, 띠 출력하기.
		 * 
		 * 띠는 12개 연도를 12로 나눠서 0이면 원숭이.
		 * 원숭이,닭,개,돼지,쥐,소,범,토끼,용,뱀,말,양
		 * 
		 * 
		 */

	String num="9307102018817";
	String[] num2=num.split("");

	
	
	
	int hap=0;	
	for(int a=0;a<num2.length;a++){
		hap=Integer.parseInt(num2[a])*a+2;
		if(a>=9){
			hap=Integer.parseInt(num2[a])*a-7;
			
		}
		hap++;

	}//for
	

	 
   System.out.println(hap);
	int check=(hap%11)-2;
	int last=Integer.parseInt(num.substring(num.length()-1));
		
		
		System.out.println(check);
		System.out.println(last);
		
		
		
		
	}//main

}//class
