package oop0611;

import java.io.File;



public class Test02_File {

	public static void main(String[] args) {
		/*
		 * File 클래스
		 * 파일 관련 정보를 알 수 있다.
		 */
		try{
			//예외 발생이 예상되는 코드 작성
			
			//경로명+파일명 
			//경로명에서의 역슬래쉬는 \\ 두번사용해야 문자로 인식함.
//			String pathname="D:\\java0514\\setup\\jdk-8u211-windows-x64.exe";
			//역슬래쉬는 두번이니까 슬래쉬를 사용해도 자바에서는 허용
			String pathname="D:/java0514/setup/jdk-8u211-windows-x64.exe";
			File file=new File(pathname);
			

			
			
			if(file.exists()){//.exists() 파일이 존재하는지 유무 > boolean타입.
				System.out.println("파일 가져오기 성공");
				long filesize=file.length(); //return형이 long!
				
				//파일크기. byte로 나오기때문에 필요한 단위는 가공.
				System.out.println("파일크기:"+filesize+"Byte"); //자바는 여기까지만
				System.out.println("파일크기:"+(filesize/1024)+"KB");
				/*출력값
				 * 	파일크기:225748832Byte
					파일크기:220457KB
				 */
				
				//파일명.확장명
				//출력값 jdk-8u211-windows-x64.exe
				String filename=file.getName();
				System.out.println("파일명.확장명:"+filename);
				
				//경로명+파일명
				//출력값 : D:\java0514\setup\jdk-8u211-windows-x64.exe
				System.out.println(file.getPath());
				//출력값 : D:\java0514\setup
				System.out.println(file.getParent());
				
				/*
				 * 문) 파일명과 확장명을 분리 출력하시오.
				 *	> .을 기준으로 나누다보면 파일명에 .이 있을 수 있다.
				 *  > 맨마지막 .을 기준으로 나눌 수 있게 한다.
				 *  만약 파일명 분리 후 파일명이 같으면
				 *  파일명(1) , 파일명(2) , 파일명(3) 이런식으로 파일명 변경하도록 하는 프로그래밍.
				 */			
				int lastdot=filename.lastIndexOf("."); //마지막 .을 찾는것.
				String name=filename.substring(0,lastdot);
				String ext=filename.substring(lastdot+1);
				System.out.println("파일명:"+name);
				System.out.println("확장자:"+ext);
				/*
				 * 출력값
				 * 	파일명:jdk-8u211-windows-x64
					확장자:exe
				 */
				
				//파일삭제
//				file.delete(); > boolean형.
				
			}else{
				System.out.println("파일 없어요!!");
			}//if
			
			
		}catch(Exception e){
			//예외가 발생되면 실행할 코드 작성
			System.out.println("파일클래스 실패"+e);
		}//try end
		System.out.println("end");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
