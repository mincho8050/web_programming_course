import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

import org.xml.sax.InputSource;



class ChatClientRead extends Thread{
	private Socket socket;
	private String line;
	
	public ChatClientRead() {}
	public ChatClientRead(Socket socket) {
		this.socket = socket;
	}
	
	@Override
	public void run() {
		
		try{
			
			BufferedReader reader=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			while(true){
				line=reader.readLine();	//네트워크로부터 전송 받음
				if(line==null) break;
				System.out.println("\n"+line);
				System.out.println("[내이름]");
			}//while
			
			
		}catch(Exception e){
			System.out.println("연결이 되어 있지 않습니다"+e);
		}finally{
			try{
				socket.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		
	}//run()
	

}//class

class ChatClientSend extends Thread{
	private Socket socket;
	private BufferedWriter writer;
	private BufferedReader in;
	private String str;
	
	public ChatClientSend() {}
	public ChatClientSend(Socket socket) {
		this.socket = socket;
	}
	
	@Override
	public void run() {
		try{
			writer=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			in=new BufferedReader(new InputStreamReader(System.in));	//키보드 입력
			
			while(true){
				System.out.println("[본인이름]");
				str=in.readLine();
				if(str.equals("exit"))break;
				writer.write(" [본인이름] "+str);
				writer.newLine();
				writer.flush();
			}//while
			
		}catch(Exception e){
			System.out.println("데이터 전송 실패"+e);
		}finally{
			try{
				socket.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}	
		
	}//run()
	
	
	
}//class

public class ChatClientThread {
	
	private Socket socket=null;
	
	public void clientStart(String ip,int port){
		System.out.println("클라이언트 프로그램 작동...");
		
		try{
			
			socket=new Socket(ip,port);
			
			//socket으로 부터 데이터를 읽어오는 쓰레드
			//ChatClientRead 클래스 : Client2.java 참조
			ChatClientRead read=new ChatClientRead(socket);
			read.start();//run() 호출
			
			//키보드에서 입력받아 socket으로 데이터를 보내는 쓰레드
			//ChatClientSend 클래스 : Client1.java 참조
			ChatClientSend send=new ChatClientSend(socket);
			send.start();
			
		}catch(Exception e){
			System.out.println("서버와 연결 실패: "+e);
		}finally{
			try{
				if(socket==null)socket.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		
		
	}//clientStart()

	public static void main(String[] args) {
		/*
		 * 클라이언트 구축
		 */
		
		ChatClientThread cc=new ChatClientThread();
		cc.clientStart(args[0], 6901);
		
		
		
	}//main

}//class
