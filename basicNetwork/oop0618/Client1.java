import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;

/*
 * 명령프롬프트에서 테스트하기.
 *  * 시작 -> cmd
 * -> d:
 * -> cd java0514
 * -> cd workspace
 * -> cd basicNetwork
 * -> javac Client1.java
 * -> java Client1 요청서버IP
 *    > 메인함수가 받음. String[] args 받음
 * 2019 port번호로 접속해야함.(그렇게 설정했으니까)
 */



public class Client1 {

	public static void main(String[] args) {
		/*
		 * 클라이언트 구축
		 * 서버에 보냄
		 */
		Socket socket=null;
		try{
			
			//>java Client1 172.16.83.100 > 선생님 IP
			socket=new Socket(args[0],2019);
			//접속하면 Server의 ip가 보임.
			System.out.println("[접속]서버IP: "+socket.getInetAddress().getHostAddress());
			
			
			BufferedReader reader=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			String line=reader.readLine();
			String[] movie=line.split("/");
			System.out.println("----------------------------------");
			for(int idx=0;idx<movie.length;idx++){
				System.out.println(movie[idx]);
			}//for
			System.out.println("----------------------------------");
			
		}catch(Exception e){
			System.out.println("ClientError"+e);
		}finally{
			
			try{
				socket.close();//자원반납
			}catch(Exception e){
				System.out.println("ClientClose"+e);
			}//try
			
		}//try
		
		
		
		
	}//main

}//class
