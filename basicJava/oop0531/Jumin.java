package oop0531;

public class Jumin {
	
	private String jumin; //주민번호
	public Jumin(){}
	public Jumin(String jumin){
		this.jumin=jumin;
	}
	
	public boolean validate(String Jumin){
		//주민번호가 유효한지 검증하는 곳.
		//유효하면 true리턴
		boolean flag=false;
		
		// 과제 1)
		//여기에 주민번호가 유효하면
		//flag변수값을 true로 대입하시오.
		
	
		
	    int[] num={Integer.parseInt(Jumin)};
		int hap=0;
		
		for(int a=0;a<num.length;a++){
			hap=num[a]*a+2;
			if(a>=9){
				hap=num[a]*a-7;
			}
		}//for
		
		int check=(hap%11)-2;
		int last=num[Jumin.length()-1];
		
		if(check!=last){
					flag=false;
		}else if(true){
			
		}
		
		return flag;
	
	
		
	
		
		
		
	} //validate()
	
	
	
	
	public void disp(){
		// 2)
		// 생년월일, 성별, 나이, 띠 출력하기.
		// 띠:태어난년도%12 > 나머지가 0 이면 원숭이.
		// > 원숭이,닭,개,돼지,쥐,소,범,토끼,용,뱀,말,양
		Jumin id=new Jumin("9307102018817");
		
		if(){
			System.out.println("주민번호 맞다.");
			//id.disp(); //작성해야함
		}else{
			System.out.println("주민번호 틀리다.");
		}
		
		
		
		
		
	} //disp()
	

	
	
	
	
	
	
}//class

