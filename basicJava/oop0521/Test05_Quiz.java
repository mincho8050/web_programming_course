package oop0521;

public class Test05_Quiz {

	public static void main(String[] args) {
		// 1차원 문자형 배열
		
		char[] ch={'S','o','l','d','e','s','k'};
		int size=ch.length;
		
		for(int idx=0;idx<size;idx++){
			System.out.print(ch[idx]);
		}
		
		System.out.println();
		
		
//---------------------------------------------------------------------------------------------------
		
		// 문1) 대문자, 소문자의 갯수를 각각 구하시오.
		// > 대문자1개, 소문자6개
		
		int countA=0; //대문자 갯수
		int counta=0; //소문자 갯수
		
		for(int idx=0;idx<size;idx++){
			if(ch[idx]>='A'&&ch[idx]<='Z'){
				countA=countA+1;
			}else{
				counta=counta+1;
			}
		}
		System.out.println("대문자의 갯수:"+countA+"개"+" 소문자의 갯수:"+counta+"개");
		
		
		
		
		
		
//--------------------------------------------------------------------------------------------------
		
		
		// 문2)모음의 갯수를 구하시오.
		// >aeiou 갯수
		
		int countv=0;
		
		for(int idx=0;idx<size;idx++){
			if(ch[idx]=='a'||ch[idx]=='e'||ch[idx]=='i'||ch[idx]=='o'||ch[idx]=='u'||
			   ch[idx]=='A'||ch[idx]=='E'||ch[idx]=='I'||ch[idx]=='O'||ch[idx]=='U'){
				countv=countv+1;
			}
			
		}
		
		System.out.println("모음의 갯수:"+countv+"개");
		
		//선생님이 하신 것. switch 이용
		/*
		 * int mo=0;
			
			switch(ch[idx]){
			case 'a':
			case 'e':
			case 'i':
			case 'o':
			case 'u':mo++;
			}
	 
		 */
		

		
		
//--------------------------------------------------------------------------------------------------
		
		
		
		// 문3) 대문자와 소문자를 서로 바꿔서 출력하시오.
		// > sOLDESK 
		
		for(int idx=0;idx<size;idx++){
			if(ch[idx]>='A'&&ch[idx]<='Z'){
				ch[idx]=(char)(ch[idx]+32);
			}else{
				ch[idx]=(char)(ch[idx]-32);
			}
			System.out.print(ch[idx]);
		}
		
		
		
		
		

	}//main

}//class
