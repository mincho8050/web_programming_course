package oop0530;

public class Test05_String {

	public static void main(String[] args) {
		/*
		 * 나머지는 java.lang
		 * String
		 * StringBuffer
		 * StringBuilder
		 * StringTokenizer : java.util 패키지 
		 * 
		 */

		String name=new String("soldesk");
	    String str="Gone With The Wind";
		
	    //글자갯수 18
	    System.out.println(str.length()); //출력값 18(공백도 갯수포함)
	    
	    //0번째 글자  출력값:'G'  0부터 시작
	    //어떤글자가 들어오든 0번째는 고정(index는 0부터 시작하니까)
	    //char형임!! 'G'
	    System.out.println(str.charAt(0));  //int형을 char형으로 변환
	    
	    //마지막 글자 출력값:'d' 마지막은 17이니까.
	    //마지막 글자는 가변적.
	    //마지막 글자는 글자갯수-1 
	    //System.out.println(str.charAt(17)); > 이렇게 해도 틀린게 아니지만 글자갯수는 달라질 수 있으니가.
	    //char형
	    System.out.println(str.charAt(str.length()-1)); // > .length-1을 이용해서 마지막글자 구하는 방법.
	    
	    //"G"라는 문자열의 순서값(index) 구하기. 0번째
	    System.out.println(str.indexOf("G")); //출력값 0
	    
	    //"e"라는 문자열의 순서값 구하기.
	    //여기서 "e"는 중복되는 문자열(3,12)
	    //중복되는 문자열이면 처음 문자열의 인덱스로 값이 나옴. > 3
	    //만약 또 중복문자가 있는지 알고싶으면 프로그래밍을 이용해 알아야함. 자바는 여기까지.
	    System.out.println(str.indexOf("e")); //출력값 3
	    
	    //없는 문자열이면 -1 반환.
	    System.out.println(str.indexOf("k")); //출력값 -1
	    
	    //전부 소문자로 변환
	    //출력값 gone with the wind
	    System.out.println(str.toLowerCase());
	    
	    //전부 대문자로 변환
	    //출력값 GONE WITH THE WIND
	    System.out.println(str.toUpperCase());
	    
	    //'n' > 'N'으로 치환
	    //출력값 GoNe With The WiNd
	    //사용자가 엔터치면 화면상에 드러나는 글자는 아님. 
	    //ex) '엔터' > '<br>'로 바꿀때 사용하기도 함.
	    System.out.println(str.replace('n','N'));
	    
	    if(str.length()==0){ //str.length()==0 이란 뜻은 빈문자열이라는 의미.
	    	System.out.println("빈문자열이다.");
	    }else{
	    	System.out.println("빈문자열이 아니다.");
	    }//if
	    
	    
	    //위의 조건문을 isEmpty()함수로 바꾸시오.
	    //isEmpty()함수는 리턴값이 boolean형이다.
	    if(str.isEmpty()){ //.length가 0일때 true , 아니면 false 
	    	System.out.println("빈문자열이다.");
	    }else{
	    	System.out.println("빈문자열이 아니다.");
	    }
	   
	    System.out.println("------------------------------");
//---------------------------------------------------------------------------------------------------------------
	    
	    //Gone With The Wind
	    //.startsWith()함수는 앞에서부터 문자열 비교해서 boolean형으로 나타냄
	    System.out.println(str.startsWith("Gone")); //true
	    
	    //.endsWith()함수는 뒤에서부터 문자열 비교해서 boolean형으로 나타냄
	    System.out.println(str.endsWith("wind")); //false
	    
	    //문자열 내용비교 
	    //"sky"가 "hi"인지 문자열 내용비교 > boolean형
	    System.out.println("sky".equals("hi")); //false
	    
	    
	    //문자열 일부분만 추출(아주 중요!) ★★★ 
	    //Gone With The Wind
	    // >리턴형은 String
	    //6번째~마지막까지 글자 추출
	    //출력값 ith The Wind
	    System.out.println(str.substring(6));
	    //6번째~12-1(11번째)까지 글자 추출
	    // >내가 잘라오고 싶은 index에 +1만 해주면 된다.
	    // 출력값 ith Th
	    System.out.println(str.substring(6,12)); 
	    
	    
	    //첫번째글자 추출
	    // > 출력값 "G" String으로 나옴  > .charAt()으로 하면 출력값은 char형으로 나옴! ''
	    System.out.println(str.substring(0,1));
	    //마지막 글자 추출
	    //String "d" !!
	    //str.substring(str.length()-1,str.length()) > 이렇게 써도된다 17,18 근데 굳이 마지막이니까 str.length() 안써도된다.
	    System.out.println(str.substring(str.length()-1));
	    
	    System.out.println("------------------------------");
//----------------------------------------------------------------------------------------------------------------------------------------	    
	    
	    //문자열 분리하기.
	    //문자열 분리하려면 규칙성이 있어야함. > 제일 많이 쓰는게 공백과 ,(콤마)
	    //엑셀의 csv문서는 ,로 구분한다.
	    //Gone With The Wind
	    //.split()의 리턴형은 String[] 스트링 1차원배열이다.
	    String[] word=str.split("n"); //n을기준으로 문자열 분리
	    for(int idx=0;idx<word.length;idx++){
	    	System.out.print(word[idx]);
	    } 
	    //n을 기준으로 나누면 출력값 > Goe With The Wid
	    //공백으로 나누면 GoneWithTheWind
	    //W로 나누면 Gone ith The ind
	    
	    System.out.println();
	    
	    //문자열 좌우 끝에 존재하는 공백을 제거할 떄.
	    //#기호는 그냥 공백이 없어졌음을 보여주는 거. 
	    //출력값 #s k y#
	    System.out.print("#"+" s k y ".trim()+"#");
	    
	    
	    System.out.println();
	    System.out.println("------------------------------");
//-----------------------------------------------------------------------------------------------------------------------------------------	    
	    
	    /*
	     * 문1)
	     * 이메일 주소에 @문자가 있으면 @글자 기준으로 문자열을 분리해서 출력하고
	     * @문자가 없다면 "이메일주소 틀림" 메세지를 출력하시오.
	     * 출력결과 : webmaster
	     *          soldesk.com
	     */
	    String email="hh8050@naver.com";
	    
	    int num1=email.indexOf("@");
	    String[] eword=email.split("@");
	
	   //System.out.println(email.indexOf("@")); //> 9번째
	    //만약 email.indexOf("@")가 없으면 -1이 나옴. 그래서 그걸 이용하자.

	
	 if(num1==-1){
		 System.out.println("이메일주소 틀림");
	 }else{
		 for(int idx1=0;idx1<eword.length;idx1++){
			 System.out.println(eword[idx1]);
		 }
	 }//if
	    	
	   

	    
	    
	    
	    
	    
	    
		
	    System.out.println("------------------------------");
//-------------------------------------------------------------------------------------------------------------
	    	
	    	/*
	    	 * 문2)
	    	 * 주민번호를 이용해서 아래와 같이 출력하시오 > 1512304123456
	    	 * 생년월일 : 2015년 12월 30일
	    	 * 성별 : 여자
	    	 * 나이 : 4
	    	 * 주민번호 각 숫자의 전체 합 : 1+5+1+2+3+0+4+1+2+3+4+5+6=37
	    	 * System.out.println(Integer.parseInt(year)); //String 형을 int형으로 변환
  	         * System.out.println(Integer.toString(4)+4);//int 형을 String형으로 변환
	    	 */
	  
	    	
	    	String jumin="1512304123456";
	    	
	    	String year=jumin.substring(0, 2);
	    	String month=jumin.substring(2,4);
	    	String date=jumin.substring(4,6);
	    	String sex=jumin.substring(6,7);
	    	
	    	//아예 처음부터 int year=Integer.parseInt(jumin.substring(0,2)); // 이렇게 해도 됨. > 선생님이 하신 것.
	    	
	    	
	    	//System.out.println("생년월일 : "+"20"+year+"년 "+month+"월 "+date+"일");
	    	
	    	if(sex.equals("1")||sex.equals("2")){
	    		System.out.println("생년월일 : "+1900+Integer.parseInt(year)+"년 "+month+"월 "+date+"일");
	    		System.out.println("나이 : "+((2019-1900)-Integer.parseInt(year)));
	    	}else{
	    		System.out.println("생년월일 : "+20+Integer.parseInt(year)+"년 "+month+"월 "+date+"일");
	    		System.out.println("나이 : "+((2019-2000)-Integer.parseInt(year)));
	    	}
	    	
	    	if(sex.equals("2")||sex.equals("4")){
	    		System.out.println("성별 : 여자");
	    	}else{
	    		System.out.println("성별 : 남자");
	    	}
	    	
	    
	    	
	    	String[] Ijumin=jumin.split("");
	    	int sum2=0;
	    	
	    	for(int idx2=0;idx2<Ijumin.length;idx2++){
	    		
	    		sum2=sum2+Integer.parseInt(Ijumin[idx2]);
	    	}
	   
	        System.out.println("주민번호 각 숫자의 전체 합 : "+sum2);
	    	
	    	
	    	
	    	System.out.println();
	    	System.out.println("------------------");
//--------------------------------------------------------------------------------------------------------------------------
	    	
	    	/*
	    	 * 문3)
	    	 * 파일이 이미지 파일(.gif .jpg .png)인지 확인하시오
	    	 * 출력결과
	    	 * 파일명 : sky.png
	    	 * 맞으면 "파일이 전송되었습니다."
	    	 * 아니면 "파일을 다시 선택해주세요."
	    	 * 
	    	 * .lastIndexOf() 뒤에서 부터 찾아옴.
	    	 * .indexOf() 는 앞에서 부터 찾아옴
	    	 */
	    	
	    	String filename="d:java0514/workspace/sky.png";
	    	
	    
	    	//System.out.println(filename.lastIndexOf("/")); //마지막 "/"의 index값
	    	System.out.println("파일명 : "+filename.substring(filename.lastIndexOf("/")+1));
	    	
	    	//System.out.println(filename.substring(filename.length()-3)); //png
	    	
	    	String check=filename.substring(filename.length()-3);
	    	
	    	if(check.equals("png")||check.equals("jpg")||check.equals("gif")){
	    		System.out.println("파일이 전송되었습니다.");
	    	}else{
	    		System.out.println("파일을 다시 선택해주세요.");
	    	}
	    	
	    	
	    	System.out.println();
	    	System.out.println("------------------");
//-----------------------------------------------------------------------------	    	
	    
	    	/*
	    	 * 과제 4) 
	    	 * 파일명, 확장명을 분리해서 출력하시오. 
	    	 * 파일명 : 2019.05.30.sky
	    	 * 확장명 : png
	    	 */
	    	
	    	String filename4="d:/java0514/workspace/2019.05.30.sky.png";
	    	
		
	}//main

}//class
