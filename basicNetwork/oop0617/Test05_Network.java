package oop0617;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;

public class Test05_Network {

	public static void main(String[] args) {
		/*
		 * 네트워크 관련 클래스
		 * HTTP Protocol과 관련된 클래스
		 * java.net 패키지
		 */

		try{
			
			InetAddress ip=InetAddress.getByName("www.soldesk.com");
			System.out.println(ip.getHostName()); //www.soldesk.com
			System.out.println(ip.getHostAddress()); //211.40.118.45 , ip확인
			
			
			//HTML 문서 내용 가져오기
			String address="http://www.soldesk.com";
			URL url=new URL(address);
			BufferedReader br=new BufferedReader(new InputStreamReader(url.openStream()));
			
			//엔터를 기준으로 한줄씩 불러오기
			while(true){
				String line=br.readLine();
				if(line==null){
					break;
				}//if
				System.out.println(line);
			}//while
			
			
		}catch(Exception e){
			System.out.println("error"+e);
		}//try
		
		
		
		
	}//main

}//class
