package oop0531;

import java.util.StringTokenizer;



public class Test02_String {

	public static void main(String[] args) {
		/*
		 * String
		 * StringBuffer
		 * StringBuilder
		 * StringTokenizer : 문자열 분리 (얘만 java.util패키지에 있음.)
		 * (나머지는 java.lang 패키지)
		 * 
		 * 문자열 가공하는 경우 속도 (String이 제일 느림.)
		 * String < StringBuffer < StringBuilder
		 */
		
		String str="";
		str=str+"one";
		System.out.println(str); //one
		str=str+"two";
		System.out.println(str); //onetwo
		str=str+"three";
		System.out.println(str); //onetwothree
		
		str=""; //모든 문자열 제거
		System.out.println(str.length());  //0
		
		
		System.out.println("------------------------------");
//----------------------------------------------------------------------------		
		
		
		StringBuilder sb=new StringBuilder();
		
		sb.append("one");
		System.out.println(sb.toString()); //one
		sb.append("two");
		System.out.println(sb.toString()); //onetwo
		sb.append("three");
		System.out.println(sb.toString()); //onetwothree
		
		//모든 문자열 제거
		sb.delete(0, sb.length()); //내가 지우고 싶은 글자수 처음,마지막 적으면됨.
		System.out.println(sb.length()); //0
		
		
		
		
		System.out.println("------------------------------");
//----------------------------------------------------------------------------	
		
		//엑셀의 csv문서는 ,로 구분한다. 
		
		String str2="kim,lee,park";
		String[] word=str2.split(",");
		for(int idx=0;idx<word.length;idx++){
			System.out.println(word[idx]);
		}
		
		/*	
		 * 출력값
		 *  kim
			lee
			park
		*/
		
		System.out.println("------------------------------");
//----------------------------------------------------------------------------	
		
		/*
		 * StringTokenizer st = new StringTokenizer("this is a test");
		  		                                    //구분기호를 안 정해놓으면 기본이 공백임.
     			while (st.hasMoreTokens()) {
         			System.out.println(st.nextToken());
     			}
		 */
		
		String str3="Seoul,Jeju,Busan";
		StringTokenizer word2=new StringTokenizer(str3, ",");
		                                               //,기호로 분리하기.

		
		while (word2.hasMoreElements()) {//토큰기호가 있는지?
			  //토큰기호로 분리된 문자열 가져오기.
			  //토큰기호로 분리된 문자열이 있을때까지 분리한다.
			System.out.println(word2.nextToken());
			
		}//while
	
		/*출력값
		 *  Seoul
			Jeju
			Busan
		 */
	
		
		System.out.println("------------------------------");
//----------------------------------------------------------------------------
		
		
		
		String str4="this is a test";
		StringTokenizer word3=new StringTokenizer(str4);
		                                          //구분기호없으면 기본으로
		                                          // 공백을 기준으로 나뉨

		while (word3.hasMoreElements()) {
			System.out.println(word3.nextToken());
		}
		
		/*출력값
		 *  this
			is
			a
			test
		 */
		
		
		

	}//main

}//class
