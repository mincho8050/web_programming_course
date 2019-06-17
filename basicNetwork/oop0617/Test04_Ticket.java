package oop0617;

class Data{
	
	private int movieTicket=0;	//좌석번호
	public Data(){}
	
	//synchronized(동기화) 함수에 붙이는거.
	// > 여러 쓰레드에서 공유데이터를 접근하여 사용하고 있을 때, 한개의 쓰레드에서 공유데이터를 사용하는 중에
	// > 쓰레드의 교체가 일어나서 공유데이터가 온전하게 관리되지 못하는 문제가 발생되는데.
	// > OS가 개입해서 문제가 발생하지 않도록 조정하는 기법
	//서버는 주는 것. 받는것은 클라이언트
	public synchronized String ticket(){
		//좌석번호 생성
		String str="";	//결과값
		if(movieTicket<10){
			movieTicket=movieTicket+1;
			str="영화 좌석번호"+movieTicket;
		}//if
		return str;
	}//ticket()
	public synchronized int getMovieTicket(){
		//좌석번호 리턴
		return this.movieTicket;
	}//getMovieTicket()

	
	
	
	
}//class

public class Test04_Ticket extends Thread{
	
	String where; //현장구매, 모바일, 인터넷
	Data data;
	public Test04_Ticket(){}
	public Test04_Ticket(String where, Data data) {
		this.where = where;
		this.data = data;
	}

	@Override
	public void run() {
		while(true){
			if(data.getMovieTicket()>=10){
				//티켓이 10장만 있음
				break;
			}//if
			System.out.println(where+"-"+data.ticket());
		}//while
	}//run()


	public static void main(String[] args) {
		/*
		 * 티켓 예매 프로그램
		 * > 예매종류 : 현장구매 , 모바일, 인터넷
		 */
		
		
		Data data=new Data();
		
		Test04_Ticket ticket1=new Test04_Ticket("현장구매",data);
		ticket1.start();
		Test04_Ticket ticket2=new Test04_Ticket("모바일",data);
		ticket2.start();
		Test04_Ticket ticket3=new Test04_Ticket("인터넷",data);
		ticket3.start();
		
		/*
		 * 출력값
		 * 	모바일-영화 좌석번호2
			인터넷-영화 좌석번호3
			현장구매-영화 좌석번호1
			인터넷-영화 좌석번호5
			모바일-영화 좌석번호4
			인터넷-영화 좌석번호7
			현장구매-영화 좌석번호6
			인터넷-영화 좌석번호9
			모바일-영화 좌석번호8
			현장구매-영화 좌석번호10
		 */
		

		
	}//main

}//class
