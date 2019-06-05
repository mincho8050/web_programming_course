package oop0605;

import oop0605.WebProgram.Language;
import oop0605.WebProgram.Smart;

class WebProgram {
    String title="Java Program";
    
    class Language{ //inner class
        String basic="JAVA, HTML, CSS, JavaScript";
        void display(){
            System.out.println("기초수업:" + basic);
        }
    }//class end

    class Smart{    //inner class
        String basic="Objective-C, Java OOP, C#";
        void display(){
            System.out.println("기초수업:" + basic);
        }
    }//class end
    
    void print(){
        Language lang=new Language();
        lang.display();
        
        Smart sm=new Smart();
        sm.display();
    }    
    
}//class end


// 안드로이드 기반 자바
class R{
	static class id{
		static String btn="버튼";
	}
}//r class





public class Test07_Inner {

    public static void main(String[] args) {
        // 내부 클래스 inner class
    	//	> 클래스내부에서 선언된 클래스
        
    	WebProgram web=new WebProgram();
    	web.print();
    	
    	
    	System.out.println("---------------------------");
  //---------------------------------------------------------------------------------  	
    	
//    	Language lang=new Language();
//    	Smart sm=new Smart();
//    		> 둘다 에러남. 
//    		> 내부 클래스는 직접 접근할 수 없다.
    	
    	
    	//내부 클래스는 외부에서 단계적으로 접근할 수 있다.
    	Language lang=new WebProgram().new Language();
    	Smart sm=new WebProgram().new Smart();
    	
    	lang.display();
    	sm.display();
    	
    	
    	System.out.println("---------------------------");
  //---------------------------------------------------------------------------------  	
    	
    	
    	System.out.println(R.id.btn);
    	

    }//main() end
}//class end
