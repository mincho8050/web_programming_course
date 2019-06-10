package oop0610;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Vector;


class Mountain{
	String name;
	int height;
	public Mountain(){};
	public Mountain(String name,int height){
		this.name=name;
		this.height=height;
	};
	
}//mountain

public class Test03_Generic {

	public static void main(String[] args) {
		/*
		 * Generic 제네릭
		 * > 데이터를 수집하는 경우 자료형을 제한할 수 있다. 
		 * <E> Element : <참조자료형>
		 * <T>
		 * <?>
		 * 
		 */

		int[] su=new int[3];
		
		Vector<String> vec=new Vector<String>(); //참조자료형(클래스)만 모으겠다는 표시.
		vec.add("손흥민");
//		vec.add(3); 에러
		vec.add(new String("박지성"));
//		vec.add(new Integer(5)); 에러
		vec.add("김연아");
		vec.add("이강인");
		
	
		for(int idx=0;idx<vec.size();idx++){
			String str=vec.get(idx);
			System.out.println(str);
		}
		
		/*출력값
		 * 	손흥민
			박지성
			김연아
			이강인
		 */
		
		
		System.out.println("-----------------------------");
//------------------------------------------------------------------------------------
		
		
		ArrayList<Integer> list=new ArrayList<Integer>();
		list.add(3);
		list.add(new Integer(5));
//		list.add(""); 문자열 에러
//		list.add(' '); char형 에러
//		list.add(new Double(2.4)); 에러
		
		

	
//------------------------------------------------------------------------------------
		
		HashSet<String> set=new HashSet<String>();
		set.add("개나리");
		set.add("진달래");
		set.add("라일락");
		
//-------------------------------------------------------------------------------------
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("무궁화", 3);	//아직까지 한글은 key값이 아니라 value값에 쓰자.
		map.put("", new Integer(5));
//		map.put("", "홍길동"); 에러
		
		
		
//-------------------------------------------------------------------------------------		
		
		Mountain one=new Mountain("한라산", 1950);
		Mountain two=new Mountain("관악산", 1500);
		Mountain three=new Mountain("북한산", 1000);
		
		ArrayList<Mountain> list02=new ArrayList<Mountain>();
		list02.add(one);
		list02.add(two);
		list02.add(three);
//		list02.add("솔데스크"); 에러
		
		for(int idx=0;idx<list02.size();idx++){
			Mountain dto=list02.get(idx);
			System.out.println(dto.name+" "+dto.height);
		}//for
	
		/*출력값
		 *  한라산 1950
			관악산 1500
			북한산 1000
		 */
		
		
		
		
		
		
	}//main

}//class
