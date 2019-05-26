package oop0517;

public class Test05_Homework {

	public static void main(String[] args) {
		// 과제
		
		/*
		 * 운행거리에 따라 택시 요금을 게산하는 프로그램
		 * 2000m까지는 기본요금 900원이고
		 * 2000m초과 운행시 200m단위마다
		 * 기본요금에 100원씩 가산하여 요금을 계산한다.
		 */
		//운행거리 : 3200m
		
	  int dic=3200;
	  int m=900;
	  int over=200;
	  
	  if(dic<=2000){
		  System.out.println(m+"원");
	  }else if(dic>2000){
		  System.out.println((dic-2000)/over*100+m+"원");
	  }
		
	
	  //선생님이 하신것
	 
	  int distance=3000;
	  int fee=0;
	  int overFee=0;
	  
	  if(distance<=2000){
		  fee=900; //기본요금
	  }else{
		  int exceed=distance-2000;  //초과거리
		  overFee=(exceed/200)*100;  //초과거리당 계산되는 추가요금.
		  fee=900+overFee; // 900=900+초과요금
	  }
	  System.out.println("총운행거리 : "+distance);
	  System.out.println("기본요금 : 900");
	  System.out.println("추가요금 : "+overFee);
	  System.out.println("전체요금 : "+fee);
	  
	  
	  
	  
	  

	}//

}//
