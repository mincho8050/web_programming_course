import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;


public class Server2 {

	public static void main(String[] args) {
		/*
		 * 2) 클라이언트가 서버측에 메세지 전송
		 * 		> Server2.java와 Client2.java
		 * 
		 * 서버구축
		 */

		
		
		ServerSocket server=null;
		try{
			
			server=new ServerSocket(2020);
			System.out.println("\n클라이언트 접속 대기중...");
			
			while(true){
				
				Socket socket=server.accept();
				System.out.println("[접속]접속IP: "+socket.getInetAddress().getHostAddress());//요청한 사람의 ip가 나오는것.
				
				BufferedReader reader=new BufferedReader(new InputStreamReader(socket.getInputStream()));
				String line=reader.readLine();
				String[] str=line.split("/");
				System.out.println("----------------------------------");
				for(int idx=0;idx<str.length;idx++){
					System.out.println(str[idx]);
				}//for
				System.out.println("----------------------------------");
				
				try{
					socket.close(); //접속자 연결 종료
				}catch(Exception e){}
				
				
			}//while
			
			
		}catch(Exception e){
			System.out.println("ServerError"+e);
		}finally{
			//finally문에도 try~catch문이 올 수 있다.
			try{
				server.close();//자원반납
			}catch(Exception e){
				System.out.println("ServerClose"+e);
			}//try
			
		}//try
		
		
		
		
		
		
		
		
		
	}//main

}//class
