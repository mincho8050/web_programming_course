package oop0521;

public class Test01_While {

	public static void main(String[] args) {
		// 1) while 반복문
		// while(조건){조건이 true이면 수행}
		// while(true){} > 무한LOOP
		// for(;;){} > for문에서도 이렇게 작성하면 무한LOOP이다. 
		
		int a=1;
		while(a<=3){
			System.out.println("JAVA");
			a++; 
		}
		/*
		 * while(1<=3)  JAVA a=1+1
		 * while(2<=3)  JAVA a=2+1
		 * while(3<=3)  JAVA a=3+1
		 * while(4<=3)  맞지 않아 실행이 되지 않음.
		 * 
		 */
		
	/*	int b=1;
		      //여기가 true면 무한루프
		while(b<=10){
			System.out.println("SEOUL");
			b++;
		}
		*/
		int b=1;
	 
	    while(true){ //무한LOOP
		System.out.println("SEOUL");
		if(b==3){
			break;  //반복문 탈출
		}
		b++;
	}//
	    
	    
	    /*
	     * while(true)  seoul  if(1==3)  b=1+1
	     * while(true)  seoul  if(2==3)  b=2+1
	     * while(true)  seoul  if(3==3)  break; > 반복문 탈출
	     * 
	     */
	    
	    
	    
//-------------------------------------------------------------------------------------------	    
	    
	    
	    // 2) do~while 문
	    // do{
	    //      조건이 true이면 수행
	    //   }while(조건);
	    //조건이 나오면 boolean 타입
	    
	    int c=1;
	    do{
	    	System.out.println("JAVA");
	    	c++;
	    }while(c<=3);
	    
	   /*
	    * JAVA  c=1+1  while(2<=3)
	    * JAVA  c=2+1  while(3<=3)
	    * JAVA  c=3+1  while(4<=3) > 맞지 않으니까 멈춤.
	    * 
	    */
	    
	    int d=5;
	    do{
	    	System.out.println("SEOUL");
	    	d=d+1;
	    }while(d<=3);
	    
	    System.out.println(d);
	    
	    /*
	     * seoul  d=5+1  while(6<=3) > 맞지 않으니까 멈춤.
	     * 
	     * do~while은 조건이랑 상관없이 무조건 한번은 수행된다!
	     * > 조건의 참,거짓과는 상관없다.
	     * > 조건을 나중에 물어보기 때문이다.
	     */
	    
	    
	
//----------------------------------------------------------------------------------------
	    
	    
	    /*
	     * 문제)
	     * x값이 10으로부터 x를 여러 번 뺀 후
	     * 결과가 음수가 되면 x를 몇번 뺐는가를 구하시오.
	     */
	    //음수가 되면 break사용
	    int x=3;
	    int count=0;
	    /*
	     * 분석
	     * 10-3=7
	     * 7-3=4
	     * 4-3=1
	     * 1-3=-2
	     * 
	     * 음수가 나오려면 4번을 빼야함. 이것을 구해야함.
	     */
	  
	    int min=10;
	    
	   while(min-x>=0){
		   
		   min=min-x;
		   count=count+1;
		   if(min-x<=0){
			   count=count+1;
		   }
		
	   }//
	   
	   System.out.println(count);
	   
	   //선생님이 한 것.
	/* 
	   int su=10;
	   
	    while(true){
	    	count++;
	    	su=su-x;
	    	if(su<0){
	    		break;
	    	}
	    }
	    
	    System.out.println(count);*/
	    
	    
//----------------------------------------------------------------------------------------	    
	    
	    
	    /*
	     * 문제2)
	     * 어느 달팽이는 낮에는 3cm올라가고
	     * 밤에는 2.5cm 내려온다고 할 때
	     * 달팽이가 13cm의 나무 꼭대기에 올라가려면 
	     * 며칠이 걸리는지 구하시오.
	     */
	  //13cm의 나무 올라가면 break사용
	  //하루에 0.5cm씩 올라감.
	  //누적하는 변수설정.
	    
	    //내가한거. 
	   //쓰레기값나옴.
	 /*   double distance=3.0-2.5;
	    int dcount=0;
	    
	    
	    while(true){
	    	dcount++;
	    	distance=distance*dcount;
	    	if(distance>=(double)13.0){
	    		break;
	    	}
	    }
	    
	    System.out.println(dcount);
	   */
	   
	   //선생님이 한것.
	   
	   int day=0;      //며칠
	   double snail=0.0; //달팽이
	   
	   while(true){
		   day++;
		   snail=snail+3.0;
		   if(snail>=13.0){ 
			   break;
		   }else{//그게 아니라면 2.5 밤에 내려오는 길이를 빼준다.
			   snail=snail-2.5;
		   }
	   }
	   System.out.println(day+"일");
	   
	    
	    
		

	}//main

}//class
