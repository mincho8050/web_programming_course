package oop0529;

class Exam{
	private String name;
	private int kor,eng,mat;
	private int aver;

	
	/*
	 * 기본생성자 자동추가
	 * > 이클립스 상단 메뉴 Source
	 *   > Generate Constructors from Superclass...  
	 */
	public Exam() {} //기본생성자 자동추가한거. 안에 내용은 편집해도 된다.

	
	/*
	 * 매개변수가 있는 생성자함수 자동추가
	 * > 이클립스 상단 메뉴 Source
	 *   > Generate Constructors using fields...
	 */	
	public Exam(String name) { //매개변수 선택해서 자동추가 하면 됨. 이번엔 매개변수 name만 불러옴.
		this.name = name;
	}

	public Exam(int kor, int eng, int mat) { //매개변수 kor,eng,mat만 추가해서 불러옴.
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

    public Exam(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	
	


}//exam



public class Test04_Constructor {

	public static void main(String[] args) {
		/*
		 * 생성자함수 자동 추가
		 */

		
		
		
		
	}//main

}//class
