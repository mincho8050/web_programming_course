import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;



class ChatServerRead extends Thread{	//데이터 읽어오기
										//Server2.java 참조
	private Socket socket;
	private String line;
	public ChatServerRead() {}
	public ChatServerRead(Socket socket) {
		this.socket = socket;
	}
	
	@Override
		public void run() {
			
		try{
			
			BufferedReader reader=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			while(true){
				line=reader.readLine();
				if(line==null){break;}//
				System.out.println("\n"+line);
				System.out.print("[서버]");
			}//while
			
		}catch(Exception e){
			System.out.println("데이터 전송 실패 !!"+e);
		}finally{
			try{
				socket.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		
		
		}//run()
	
}//class

class ChatServerSend extends Thread{	//데이터 보내기
										//Server1.java 참조
	private Socket socket;
	private BufferedWriter writer;
	private BufferedReader in;
	private String str="";
	
	public ChatServerSend() {}
	public ChatServerSend(Socket socket) {
		this.socket = socket;
	}
	
	@Override
		public void run() {
			
			try{
				writer=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				//키보드에서 입력
				in=new BufferedReader(new InputStreamReader(System.in));
				
				while(true){
					System.out.print("[서버]");
					str=in.readLine();	//키보드로부터 입력 대기
					if(str.equals("exit"))break;
					
					writer.write(" [서버] "+str);
					writer.newLine();//줄바꿈기호가 있어야 BufferedReader의 readLine()이 인식함
					writer.flush();  //client로 전송
				}//while
				
				
			}catch(Exception e){
				System.out.println("데이터 전송 실패 !!"+e);
			}finally{
				try{
					socket.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}

		}//run()
	

}//class


public class ChatServerThread {
	
	private ServerSocket server=null;
	private Socket socket=null;
	
	public void serverStart(){
		System.out.println("접속자를 기다리는 중...");
		try{
			
			server=new ServerSocket(6901);
			socket=server.accept();
			
			//socket으로 부터 데이터를 읽어오는 쓰레드
			//ChatServerRead 클래스 : Server2.java 참조
			ChatServerRead read=new ChatServerRead(socket);
			read.start(); //run() 호출
			
			//키보드에서 입력받아 socket으로 데이터를 보내는 쓰레드
			//ChatServerSend 클래스 : Server1.java 참조
			ChatServerSend send=new ChatServerSend(socket);
			send.start();
			
			
		}catch(Exception e){
			System.out.println("연결이 되어 있지 않습니다."+e);
		}finally{
			try{
				server.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
	}//serverStart()

	public static void main(String[] args) {
		/*
		 * 1:1 채팅 프로그램 구축
		 * 서버구축
		 */

		ChatServerThread cs=new ChatServerThread();
		cs.serverStart();
		
		
		
		
		
	}//main

}//class
