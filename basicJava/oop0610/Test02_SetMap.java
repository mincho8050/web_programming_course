package oop0610;

import java.util.*;

public class Test02_SetMap {

	public static void main(String[] args) {

		//Set 계열
		//>순서없음
/*		Set set=new HashSet();
		set.add(3);
		set.add(1.2);
		set.add("HAPPY");
		set.add(new Integer(5));
		System.out.println(set.size()); 	// 요소의 사이즈 > 4
		
		/*
		 * cursor가 가리키는 요소를 가져올 수 있음
		 * (C언어에선 pointer)
		 * 가리켰는데 있으면 true , 없으면 false
		 * next는 그 다음으로 넘기는거. 
		 * previous는 이전으로.
		 * 
		 */
		
		//Interface Iterator
		// > cursor를 이용해서 요소를 접근하는 경우
/*		Iterator iter=set.iterator();
		while(iter.hasNext()){//.hasNext() cursor유무 판단
			//cursor가 가리키는 요소 가져오기
			Object obj=iter.next();
			System.out.println(obj);
		}
		/*
		 * 출력값
		 *  1.2
			3
			HAPPY
			5
			값이 없으면 빠져나옴
			순서 없음.
		 */
		
		
		

		
//----------------------------------------------------------------------------
		
		
		/*
		 * Map 계열 : 순서가 없다
		 * > Key   : 이름. 중복 불가능
		 * > Value : 값 . 중복 가능
		 * 
		 * 값을 이름을 붙여 모아놓을 수 있음. 
		 * 이름은 중복안됨. 값은 중복가능.
		 */
/*		Map map=new HashMap();
		map.put("one", "손흥민"); //key , value
		map.put("two", 3);
		map.put("three", new Double(5.6));
//		map.put("one", "박지성");		//이건 허용 안된것.
									//key는 중복혀용 안된다.
		map.put("four", "손흥민"); //허용 . value는 중복가능
		
		
		System.out.println(map.size()); 	// 4
		System.out.println(map.get("one"));	//손흥민
		System.out.println(map.get("three"));	//5.6
		
*/
		


//----------------------------------------------------------------------
		
		
		// 문) key 값으로 "read.do" 호출하면
		// 	   value 값으로 "net.bbs.Read" 출력하시오
		// = 문자 기준으로 문자열을 분리해서 
		// 앞의 문자열은 key, 뒤에 문자열은 value로 map에 저장
		
		HashSet command=new HashSet();
		command.add("list.do=net.bbs.List");
		command.add("read.do=net.bbs.Read");
		command.add("write.do=net.bbs.Write");
		//set에 저장되어있음
		//map으로 옮겨야함. 단 나눠서!
		
		HashMap map=new HashMap();
		
		
		Iterator iter=command.iterator();
		while(iter.hasNext()){
			String str=(String)iter.next();
			//cursor가 가리키는 요소를 String값에 저장하기.
			int pos=str.indexOf("=");
			//"="의 index값 추출
			String key=str.substring(0,pos);
			String value=str.substring(pos+1);
			//spilt나 StringTokenizer 사용가능.
			//다만 내용이 좀 바뀔뿐
			map.put(key, value);
		}//while
		
		
		System.out.println(map.get("read.do")); //net.bbs.Read
												//read.do 는 key 값
		System.out.println(map.get("list.do")); //net.bbs.List
		System.out.println(map.get("write.do")); //net.bbs.Write
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
