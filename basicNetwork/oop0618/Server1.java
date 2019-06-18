import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

/*
 * dos창에서 실행할 거라 패키지에 만들지 않았음.
 * 
 * 실행순서(명령프롬프트에서 테스트)
 * 시작 -> cmd
 * -> d:
 * -> cd java0514
 * -> cd workspace
 * -> cd basicNetwork
 * -> cd src
 * -> javac Server1.java
 * -> java Server1
 */


public class Server1 {
	
	public static void main(String[] args) {
		
		//1) 서버가 클라이언트측에 메세지 전송
		//Server1.java와 Client1.java 
		
		//서버 구축
		/*
		 * 클라이언트보다 먼저 실행되어 클라이언트의 접속 요청을 기다리며, 
		 * 클라이언트가 접속하면 양방향 통신을 할 수 있는 Socket 객체를 생성한다.
		 * 소스작성은 이클립스에 하고 run은 메모장으로한다.
		 * 메모장 경로는 기존 경로와 다르게 주자.
		 */
		ServerSocket server=null;
		try{
			//내가 만든 Server1에 접근한다는 것.
			//port > 전용문 0~65535(2byte)
			//Server1 클래스만 사용하는 포트번호 설정 2019
			// > 클라이언트가 접속할때 2019를 통해 접속해야한다.
			server=new ServerSocket(2019);
			
			while(true){//언제들어올지 모르니까 무한루트 , 무조건대기
				//서버를 run하면 띄우는 메세지
				System.out.println("\n클라이언트 접속 대기중...");
				//다른 Socket과 데이터를 송수신 합니다.
				Socket socket=server.accept();
				System.out.println("[접속]접속IP: "+socket.getInetAddress().getHostAddress());//요청한 사람의 ip가 나오는것.
				
				//요청한 사용자 pc에 메세지 출력하기.
				BufferedWriter writer=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				writer.write("[본인이름]/1.토이스토리/2.알라딘/3.기생충");
				writer.newLine();	//줄바꿈
				writer.flush();		//client에 전송
				
				socket.close();//접속자 연결 종료
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
