package oop0604;

class Member{
	
	private String id;
	private String password;
	
	public void setId(String id){
		this.id=id; //setter함수
					//값을 줄때 set
	}
	public String getId(){ //getter함수
							//값을 가져올때 get
		return this.id;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword(){
		return this.password;
	}
	
}//member class


public class Test08_GetSet {

	public static void main(String[] args) {
		/*
		 * getter , setter 함수
		 * 
		 * 클래스를 설계할때 필드를 private로 했다고 해도 연결시킬 수 있다.
		 * set : 보내는거. 전달.
		 * get : 가져오는거. 받는거.
		 */

		Member mem=new Member();
		mem.setId("soldesk");		//값 전달해주기.
		mem.setPassword("1234");	//값 전달해주기. 
		
		System.out.println(mem.getId());		//값 가져오기
		System.out.println(mem.getPassword());	//값 가져오기
		
		
	}//main

}//class
