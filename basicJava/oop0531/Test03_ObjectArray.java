package oop0531;

class Sungjuk{
	private String name;
	private int kor,eng,mat;
	private int aver;
	
	public Sungjuk () {}

	public Sungjuk(String name, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	public void disp(){
		aver=(kor+eng+mat)/3;
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}
	
	
}//sungjuk

public class Test03_ObjectArray {

	public static void main(String[] args) {
		/*
		 * 객체 배열
		 */

		Integer[] inte={
				new Integer(3),
				new Integer(5),
				new Integer(7)
		};
		
		for(int idx=0;idx<inte.length;idx++){
			System.out.println(inte[idx].toString());
		}//for
		
		
		System.out.println("------------------------");
//------------------------------------------------------------------------		
		
		
		Sungjuk a=new Sungjuk("손흥민", 10, 40, 70);
		Sungjuk b=new Sungjuk("박지성", 20, 50, 80);
		Sungjuk c=new Sungjuk("차범근", 30, 60, 90);
		
		a.disp();
		b.disp();
		c.disp();
		
		/*
		 * 출력값
		 *  손흥민
			10
			40
			70
			40
			박지성
			20
			50
			80
			50
			차범근
			30
			60
			90
			60
		 */
		
		System.out.println("------------------------");
//------------------------------------------------------------------------
		
		
		// a변수와 b참조변수를 서로 교환하시오.
		
		Sungjuk tmp=a; //a와 b의 자료형인 Sungjuk으로 맞춰준다. 클래스만 맞춰주자.
		a=b;
		b=tmp;
		
		a.disp();
		b.disp();
		
		System.out.println("------------------------");
		/*출력값
		 *  박지성
			20
			50
			80
			50
			손흥민
			10
			40
			70
			40
		 */
//------------------------------------------------------------------------
		//객체 배열 선언
		//Sungjuk[] sj=new Sungjuk[3];
		
		Sungjuk[] sj={
				new Sungjuk("손흥민", 10, 40, 70),
				new Sungjuk("박지성", 20, 50, 80),
				new Sungjuk("김연아", 30, 60, 90)
		};
		
		System.out.println(sj.length); // 3
		
		//sj[0]값과 sj[2]값을 서로 교환하시오.
		Sungjuk tmp2=sj[0];
		sj[0]=sj[2];
		sj[2]=tmp2;
		
		for(int idx=0;idx<sj.length;idx++){
			sj[idx].disp();
		}
		
		/*
		 * 출력값
		 *  김연아
			30
			60
			90
			60
			박지성
			20
			50
			80
			50
			손흥민
			10
			40
			70
			40
		 */
		
		
		
		
		
		
	}//main

}//class
