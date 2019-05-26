package oop0517;

public class Test04_Quiz {

	public static void main(String[] args) {
		// if, switch 연습문제
		
		
		// 문1) 임의의 수가 양수, 음수, 제로인지 출력하시오
		int a=-3;
		if(a>0){
			System.out.println("양수");
		}else if(a<0){
			System.out.println("음수");
		}else if(a==0){
			System.out.println("제로");
		}//선생님방법
		//나는 else로 그냥 마무리했는데, 선생님은 else if사용
		
		// 문2) 코드값에 따라 성별을 출력하시오
		//홀수 남자, 짝수 여자
		int code=4;
		
		if(code%2==0){
			System.out.println("여성");
		}else{
			System.out.println("남성");
		}//이건 내가한거. 선생님은 조건에 code가 1또는3, 2또는4 이렇게 조건을 두기도 함. 홀짝도 사용.
		
		//선생님이 하신 switch를 사용한 문제풀이.
		switch(code%2){
		case 0:System.out.println("여자");break;
		case 1:System.out.println("남자");break;
		}
		
		
		// 문3) 연산기호에 따라 결과값을 출력하시오
		//출력결과 : 5+7=12 / 만약 op변수가'-'라면 5-7=-2
		//op변수가 *라면 5*7=35 , /라면 5/7=0 등등
		int c=5,d=7;
		char op='/';
		
	    switch(op){
	    case '+':System.out.println(c+"+"+d+'='+(c+d));break;
	    case '-':System.out.println(c+"-"+d+'='+(c-d));break;
	    case '*':System.out.println(c+"*"+d+'='+(c*d));break;
	    case '/':System.out.println(c+"/"+d+'='+((double)c/(double)d));break;
	    case '%':System.out.println(c+"%"+d+'='+(c%d));break;
	    }//내가한거
	    //나는 소수점이 안나오넹..! 
	    //소수점 나오게 변경해보기
	    //결과부분에 그냥 c/d로 했는데
	    //(double)(c/d)로 하면 결과값이 0.0으로 나옴 그래서
	    //(double)c/(double)d 이렇게 해줘야 결과값이 정상적으로 실수형으로 나옴.
	    
	    //선생님이 한 방법
	    int res1=0; //정수인 결과값
	    double res2=0.0; //실수인 결과값
	    
	    switch(op){//switch에는 char형도 들어올 수 있다이마리야
	    case '+':res1=c+d;break;
	    case '-':res1=c-d;break;
	    case '*':res1=c*d;break;
	    case '/':res2=(double)c/d;break;
	    case '%':res1=c%d;break;
	    }
		if(op=='/'){
			System.out.println(c+""+op+""+d+"="+res2);
		}else{
			System.out.println(c+""+op+""+d+"="+res1);
		}
	    
		
		
		
		// 문4) 문제2의 코드를 참조해서 나이를 계산하시오
		int myYear=10;//내가 태어난 연도, 주민번호 앞자리 2자리.
		// > 나이 : 2019-태어난년도 > 연도값 불러오는 클래스있음. > 나중에배움.

		if(code==1||code==2){
			System.out.println((2019-1900)-myYear+"살");
		}else if(code==3||code==4){
			System.out.println((2019-2000)-myYear+"살");
		}//내가한거
		
		//선생님이 한거 , switch 사용.
		switch(code){
		case 1:
		case 2:myYear=1900+myYear;break;
		case 3:
		case 4:myYear=2000+myYear;break;
		}//1과 3에 내용을 넣어주어도 되지만 1,2가같고 3,4가 같으니까 내용 안적고 해도 된당
		System.out.println(myYear);
		//여기서의 myYear은 switch에서 사용한게 누적되어 나옴 결과값 2010임.
		
		int myAge=2019-myYear;
		System.out.println("나이: "+myAge+"살");
		
	
		
		
				
		
	}//

}//
