import java.io.BufferedReader;
import java.io.FileReader;


public class Typing {

	public static void main(String[] args) {
		
		/*
		 * >cd java0514
		  	>cd workspace
		  	>cd basicJava 
		  	>cd src
		  	>dir
		  	>javac Typing.java
		 	>Typing sungjuk.txt
		 	>java Typing D:\java0514\testFile\sungjuk.txt
		 	
		 	java Typing sungjuk.txt
​					 	>args[0]
		 */

		try{
			
			String fileName=args[0]; 
			
			FileReader in=new FileReader(fileName);
			BufferedReader br=new BufferedReader(in);
			while(true){
				
				String line=br.readLine();
				if(line==null){ 
					break;
				}//if
				
				System.out.println(line); 
			
				
			}//while
			
			
			br.close();	
			in.close(); 
			
			
		}catch(Exception e){
			System.out.println("File Not Found"+e);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
