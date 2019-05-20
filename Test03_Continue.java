package oop0520;

public class Test03_Continue {

	public static void main(String[] args) {
		// break : 반복문을 빠져나옴
		// continue : 반복문을 계속 실행
		
		
		for(int a=1;a<10;a++){
			if(a==5){
				break;
			}
			System.out.print(a+" ");
		}//a가 5가 되면 멈춤.
		
		System.out.println();
		
		for(int a=1;a<10;a++){
			if(a==5){
				continue;
				
			}//a가 5가 되는 순간에 continue를 만나면 아래로 흘러가지 않고
			 //반복문으로 다시 올라가 실행됨.
			 //출력값은  1 2 3 4 6 7 8 9
			 //continue문장은 반복문과 함께 쓰임.
			System.out.print(a+" ");
		}//


//----------------------------------------------------------------------------
		System.out.println();
		
		// 문7) 다음식의 결과를 예측하시오
		/*
		 * 1   2    3    4       99
		 * - - - +  - -  -  ...  ㅡ
		 * 2   3    4    5       100
		 * 
		 * (1/2)-(2/3)+(3/4)-(4/5)+ ... (99/100)
		 * 
		 */
		//결과값이 이상하게나옴.
		boolean flag=false;
		int hap=0;
		
		for(int b=1;b<=100;b++){
			if(flag){
				hap=(hap)-(b/(b+1));
				flag=false;
			}else{
				hap=(hap)+(b/b+1);
				flag=true;
			}
		}
		/*
		 * b=1     if(flase)
		 *         hap=(0)+(1/2)  > 1/2
		 *         flag=true
		 * 
		 * b=2     if(true)
		 *         hap=(1/2)-(2/3)
		 *         flag=false
		 */
		
		
		System.out.println(hap);
		
		
		
		

	}//main end

}//class end

