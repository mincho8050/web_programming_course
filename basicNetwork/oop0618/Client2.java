import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;


public class Client2 {

	public static void main(String[] args) {
		/*
		 * 클라이언트 구축
		 */

		
		Socket socket=null;
		try{
			socket=new Socket(args[0],2020);
			System.out.println("[접속]접속IP: "+socket.getInetAddress().getHostAddress());//요청한 사람의 ip가 나오는것.
			BufferedWriter writer=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			writer.write("[색상]/1.빨간색/2.검정색/3.노란색");
			writer.newLine();	
			writer.flush();		
	
		
			
		}catch(Exception e){
			System.out.println("ClientError"+e);
		}finally{
			//finally문에도 try~catch문이 올 수 있다.
			try{
				socket.close();//자원반납
			}catch(Exception e){
				System.out.println("ClientClose"+e);
			}//try
			
		}//try
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
