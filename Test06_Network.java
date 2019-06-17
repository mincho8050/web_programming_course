package oop0617;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;



public class Test06_Network {

	public static void main(String[] args) {
		/*
		 * 웹페이지문서 저장하기
		 */
		
		try{
			
			String address="http://www.soldesk.com";
			URL url=new URL(address);
			InputStream in=url.openStream();
			FileOutputStream out=new FileOutputStream("d:/java0514/workspace/basicNetwork/soldesk.html");
			
			while(true){
				int data=in.read();
				if(data==-1){
					break;
				}//if
				out.write(data);
			}//while
			
			in.close();
			out.close();
			
			
			
			
			
			
			
			
		}catch(Exception e){
			System.out.println("error"+e);
		}//try

		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
