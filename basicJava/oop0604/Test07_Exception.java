package oop0604;

class Test{
	
	// 1)try!catch를 이용한 예외처리
//	public void view(){
//		
//		try{
//			int a=3/0;
//		}catch(Exception e){}		
//	}//view
//	
//	public void disp(){
//		try{
//			int a=Integer.parseInt("soldesk");
//		}catch(Exception e){}
//	}//disp
	
	
	// 2)throws를 이용한 예외처리
	public void view() throws Exception{	//view라는 메소드에서 exception이 발생하면 던지라는 것.
											//그냥 퉁쳐서 Exception으로 적어도 됨.
		int a=3/0;
	}
	public void disp() throws NumberFormatException{//exception구체적으로 적은거
		int a=Integer.parseInt("soldesk");
	}
	
	
	
}//test class

public class Test07_Exception {

	public static void main(String[] args) {
		/*
		 * throws 문
		 * > 메소드 호출 시 예외처리를 한꺼번에 모아서 처리
		 */

		try{
			Test test=new Test();
			test.view();
			test.disp();
		}catch(Exception e){
			System.out.println(e);
		}//try
		
//		출력값
//		java.lang.ArithmeticException: / by zero
		
		
		
		
	}//main

}//class
