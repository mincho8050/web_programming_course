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
		
	  int dic=4500;
	  int m=900;
	  int over=200;
	  
	  if(dic<=2000){
		  System.out.println(m+"원");
	  }else if(dic>2000){
		  System.out.println((dic-2000)/over*100+m+"원");
	  }
		
		

	}//

}//
