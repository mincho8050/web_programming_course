import java.io.File;


public class DeleteFile {

	public static void main(String[] args) {
		/*
		 * 	3. 파일 삭제
			java DeleteFile	sungjuk3.txt
				 >클래스명	>args[0]
		 */

		
		
		try{
			
			File file=new File(args[0]);
			if(file.exists()){
				if(file.delete()){
					System.out.println("파일이 삭제되었습니다.");
				}else{
					System.out.println("파일이 삭제되지 않았습니다.");
				}//if
			}else{
				System.out.println("해당파일이 존재하지 않습니다.");
			}//if
			
			
		}catch(Exception e){
			System.out.println("파일삭제 실패"+e);
		}//try
		
		
		
		
		
		
	}//main

}//class
