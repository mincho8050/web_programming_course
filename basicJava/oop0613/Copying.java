import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;


public class Copying {

    public static void main(String[] args) {
/* 
	2. 파일 복사

java Copying 	sungjuk.txt	sungjuk2.txt
>클래스명	        >args[0]	>args[1]
				>읽기모드		>쓰기모드
*/
        try{
            String inName =args[0];
            String outName=args[1];
            
            FileReader fr  =new FileReader(inName);
            FileWriter fw  =new FileWriter(outName,false);
            PrintWriter out=new PrintWriter(fw,true);
            int data=0;
            while(true){
                data=fr.read();
                if(data==-1) break;
                out.print((char)data);
            }//while
            
            fr.close(); out.close(); fw.close(); 
            System.out.println("1개의 파일이 복사되었습니다");
        
        }catch(Exception e){
            System.out.println("파일복사실패:" + e);
        }//try
        
    }//main
}//class 
