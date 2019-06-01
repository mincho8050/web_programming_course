package oop0531;

import java.util.Calendar;

public class Jumin {
	
	private String jumin; //주민번호
	public Jumin(){}
	public Jumin(String jumin){
		this.jumin=jumin;
	}
	//멤버변수에 외부에서 온 String jumin이라는 값을 받아 대입했기때문에.
	//멤버함수들이 접근할 수 있다.
	//그렇기 때문에 매개변수에 굳이 String jumin이라고 값을 넣지 않아도 된다.
	
	public void setJumin(String jumin){
		this.jumin=jumin;
	}//멤버변수를 바꿀고 싶을때
	
	public boolean validate(){
		//주민번호가 유효한지 검증하는 곳.
		//유효하면 true리턴
//		boolean flag=false;
		
		// 과제 1)
		//여기에 주민번호가 유효하면
		//flag변수값을 true로 대입하시오.\
		/*
		 * String은 char로 이루어진 배열이다.
		 * > "abc"=={'a','b','c'}
		 * > 그래서 하나하나 char형으로 접근할 수 있다. 
		 */
		
	
		
	    int[] num=new int[13];//아무것도 안가리키고 공간만 만들어주는거.
	    
	    for(int i=0;i<this.jumin.length();i++){
	    	num[i]=this.jumin.charAt(i)-'0';
	    	//num[i]배열에 jumin이라는 String을 char로 뽑아서 하나하나 넣는다.
	    	//num배열은 int기 때문에 결국 int로 변환된다.
	    	//char형에서 int를 뽑고 싶으면  그 차이를 가져와라.
	    	// > '0'이 기준이기 때문에 '0'을 빼라.
	    	
	    	
//	    	System.out.print(num[i]); // 테스트
	    	
	    
	    }//

	    
		int hap=0;
		
		for(int a=0;a<num.length-1;a++){
			
			if(a==num.length-1){
				break;
			}//안정성을 위해서 만든 식. 없어도 되긴 함.  이중확인. 마지막확인. 
			
			if(a>=8){
				hap+=num[a]*(a-6);
				continue; //continue를 만나면 for문 다시돌기
				          //break는 for문자체를 탈출. 그러니까 hap이 덜 더해짐.
			}
			hap+=num[a]*(a+2);
			//hap=num[a]*(a+2); 이 if문 위에 있으면
			// 무조건 한번 계산한다음에 if문으로 들어가기때문에
			//if문 아래에 위치하고 if문안에는 조건에 맞으면 한번만 계산되도록
			//break;를 걸어준다.
	
		}//for
//		System.out.println(hap);
		int check=(11-(hap%11))%10;
//		System.out.println(check);
		int last=num[this.jumin.length()-1];
//		System.out.println(last);
	
		if(check==last){
				return true;
		}
		
		return false;
	
	
		
	
		
		
		
	} //validate()
	
	public int getYear(){
		int year=0;
	//	year=Integer.parseInt("19"+jumin.substring(0, 2));

    	int code=this.jumin.charAt(6)-'0';  //성별코드
		
//		System.out.println(code);
		
		if(code==1||code==2){
			year=Integer.parseInt("19"+this.jumin.substring(0, 2));
		}else if(code==3||code==4){
			year=Integer.parseInt("20"+this.jumin.substring(0, 2));
		}
		
//		System.out.println(year);
		
		return year;
	}//getYear

	public String getDate(){
		
//		String date=this.jumin.substring(2, 4)+"월 "+this.jumin.substring(4, 6)+"일";
		if(this.jumin.substring(2,3).equals("0")&&
				this.jumin.substring(4,5).equals("0")){//월과 일이 1자리일때 
			return this.jumin.substring(3,4)+"월 "+this.jumin.substring(5,6)+"일";
		}else if(this.jumin.substring(2,3).equals("0")){//월만 1자리일때
			return this.jumin.substring(3,4)+"월 "+this.jumin.substring(4,6)+"일";
		}else if(this.jumin.substring(4,5).equals("0")){//일만 1자리일때
			return this.jumin.substring(2,4)+"월 "+this.jumin.substring(5,6)+"일";
		}else{//나머지
			return this.jumin.substring(2, 4)+"월 "+this.jumin.substring(4, 6)+"일";
		}
		
		
		
//		return date;
	}//getBirth
	
/*	public void showSex(){
		boolean flag=true;
		
		if(this.jumin.substring(6,7).equals("1")||
				this.jumin.substring(6,7).equals("3")){
			//남성인지 구분
			flag=false;
		}
		if(flag){
			System.out.println("성별:여성");
		}else{
			System.out.println("성별:남성");
		}
		
		
	}//showSex
	리턴값없이 만드는 showSex함수
	*/
	
	public String getSex(){
	
		if(this.jumin.substring(6,7).equals("1")||
				this.jumin.substring(6,7).equals("3")){
			return "남성";
		}else{
			return "여성";
		}
		
		
	}//getSex
	
	public int getAge(){
		int age=0;
		Calendar now=Calendar.getInstance();
		age=now.get(1)-getYear();
//		System.out.println("나이:"+String.valueOf(age)+"살");
		//String을 int로 형변환 : String.valueOf()
		
		return age;
	}//getAge
	
	public String getAni(){
	
		String[] t={"원숭이","닭","개","돼지","쥐","소","범","토끼","용","뱀","말","양"};
		
//		System.out.println(getYear()%12);
//		System.out.println(animal);
		
		 return t[getYear()%12];
	}//getAni
	
	public void disp(){
		// 2)
		// 생년월일, 성별, 나이, 띠 출력하기.
		// 띠:태어난년도%12 > 나머지가 0 이면 원숭이.
		// > 원숭이,닭,개,돼지,쥐,소,범,토끼,용,뱀,말,양
		//Jumin id=new Jumin("9307102018817");
		
		
		
		if(validate()){

			System.out.println("주민번호 맞다.");
			System.out.println("생년월일 : "+String.valueOf(getYear())+"년 "+getDate());
			System.out.println("나이 : "+String.valueOf(getAge())+"살");
			System.out.println("띠 : "+getAni());
			System.out.println("성별 : "+getSex());
//			showSex();
		}else{
			System.out.println("주민번호 틀리다.");
		}
		
		
		
//		System.out.println("19"+jumin.substring(0, 2));

		//System.out.println(year);
		
	} //disp()
	

	
	
	
	
	
	
}//class

