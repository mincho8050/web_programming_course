package oop0610;

//maker측에서 제공하는 라이브러리
import java.util.*; 

//외부에서 제공하는 라이브러리(.jar)

public class Test01_List {

	public static void main(String[] args) {
		/*
		 * Java Collection Framework
		 * > 자료를 모아서 저장할 수 있는 클래스들
		 * > E : Element , 요소
		 * 
		 * List : 순서(index)가 있다. 0부터~~
		 * 		  List , Vector , ArrayList , Collections
		 * Set	: 순서가 없다.
		 * 		  Set , HashSet
		 * Map	: 순서가 없다.
		 * 		  Map , HashMap , HashTable
		 */
		
//-------------------------------------------------------------------------------
		
		//List 계열
//		List list=new Vector();		//다형성
									//자식이 부모집에 들어감.
//		List item=new ArrayList();	//다형성
		
		Vector vec=new Vector();
		vec.add(new Object()); 		//가장 기본형
		vec.add(new Integer(3));
		vec.add(new Double(1.2));
		vec.add(new String("HAPPY"));	//계속 vec에 자료가 쌓여가고 있음. 
										//자료를 한번에 넘길 때 좋음
		vec.add(5);						//autoboxing > jdk버전 영향을 받음
										//기본형을 클래스가 받으면 object형으로 변함.
										//Integer a=5; 이렇게 해도 참조형으로 변함
										//원래는 Integer a=new Integer(5); 이렇게 해야함
		vec.add(6.7);								
		vec.add("Apple");
		
	
		//요소의 갯수
		System.out.println(vec.size());		//출력값 : 7
											//element , 요소의 갯수를 출력 > 7
	/*	
		//3번째 요소 가져오기(0부터 시작)
		Object obj=vec.get(3);		//원형
		System.out.println(obj);	//출력값 : "HAPPY"
		
		String str=(String) obj;	//다형성
									//부모도 자식에 들어갈 수 있지만 제약조건이 있음.
		System.out.println(str);	//"HAPPY"
		
		
		//5번째 요소 가져오기
		Double doub=(Double) vec.get(5);	//가져오면서 동시에 형변환
		System.out.println(doub);			//출력값 : 6.7
		
		
		
		*/
//----------------------------------------------------------------------------------------
		
/*		
		//전체요소 출력
		for(int idx=0;idx<vec.size();idx++){
			System.out.println(vec.get(idx));
		}
		/*
		 * 출력값
		 *  java.lang.Object@15db9742
			3
			1.2
			HAPPY
			5
			6.7
			Apple
		 */
		
/*
		
		//0번째 요소 제거
		vec.remove(0);
		for(int idx=0;idx<vec.size();idx++){
			System.out.println(vec.get(idx));
		}
		/*
		 * 출력값
		 * 	3
			1.2
			HAPPY
			5
			6.7
			Apple
		 */
		
		
	/*	//모든 요소 전부 삭제.
		vec.removeAllElements();
		System.out.println(vec.size());		//출력값 : 0
		
		
		if(vec.isEmpty()){ //비어있는지 묻는것. boolean형
			System.out.println("요소없다");
		}else{
			System.out.println("요소있다.");
		}//if
		//출력값 : 요소없다		
		
		
*/
		
//------------------------------------------------------------------------		
		System.out.println("-----------------------");
		
		// 문) remove()를 이용해서 요소 전부 삭제
		// 아래에서 위로 삭제하는 방향으로 해야함
		for(int idx=vec.size()-1;idx>=0;idx--){
			//요소 길이는 7지만 맨 마지막은 6이기 때문에 -1 해준다.
			vec.remove(idx);
		}
		System.out.println(vec.size());
		
		
		
//------------------------------------------------------------------------		
		System.out.println("-----------------------");	
		
		

		//다형성
		List list=new ArrayList();
		list.add(3);
		list.add(1.2);
		list.add("SOLDESK");
		list.add(new Integer(5));

		for(int idx=0;idx<list.size();idx++){
			System.out.println(list.get(idx));
		}
		/*
		 * 출력값
		 * 	3
			1.2
			SOLDESK
			5
		 */
		


	}//main

}//class
