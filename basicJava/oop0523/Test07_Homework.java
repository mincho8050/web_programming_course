package oop0523;

import java.util.Arrays;

public class Test07_Homework {

	public static void main(String[] args) {
		
		// 과제1) 누적의 합을 구하시오.
		/*
		 * 출력결과
		 * 
		 * 1+....+10=55
		 * 1+....+20=210
		 * 1+....+30=
		 * 
		 * 1+....+90=
		 * 1+....+100=5050
		 * 
		 * 맨처음 10번, 20번, 30번.. 회전수가 10번씩 증가.
		 * 그리고 마지막값도 10씩 증가.
		 * 반복문 삼각형.
		 */
		
		
		
		//int sum=0; 밖에 쓰면 전체 누적의 수가 나오고
		
		for(int a=1;a<=10;a++){ //선생님의 조건은
			                    // int a=10;a<=100;a=a+10 > 10부터 시작해 10씩 증가..!
			int sum=0;
			//여기에 위치하면 한번 b반복문이 끝날때 sum변수는 초기화.
			//sum을 처음 for문 위에 써버리면 초기화가 안되고 누적되어서 계속 더해진다.
			for(int b=1;b<=10*a;b++){ //선생님 조건
				                      //int b=1;b<=a;b++
				sum=sum+b;
				
			}
			
			System.out.println("1+....+"+a*10+"="+sum);
			
			
		}//for
		
		/*
		 * 출력값
		1+....+10=55
		1+....+20=210
		1+....+30=465
		1+....+40=820
		1+....+50=1275
		1+....+60=1830
		1+....+70=2485
		1+....+80=3240
		1+....+90=4095
		1+....+100=5050
		*/
		

		System.out.println("--------------------");
//----------------------------------------------------------------------------------------------------------------		
		
		// 과제2) 1~1000까지의 합 중 그 합이 10000이 넘을때 결과를 출력 후 실행 종료
		//1+2+3+4+5+6+...
		//break
		
		int sum2=0;
		
		for(int a2=1;a2<=1000;a2++){
			sum2=sum2+a2;
		   if(sum2>=10000){
			   //System.out.println(a2);
			   //언제 break가 되는지 a2 확인.
			   //출력값 : 141
			   break;
		   }
		   
		}
		/*
		 * 출력값
		 * 10011
		 */
		
		
		System.out.println(sum2);
		System.out.println("--------------------");
//----------------------------------------------------------------------------------------------------------------			
		
		// 과제3) 3의 배수의 누적 합이 100이 넘어가려면 3부터 어디까지 더해야 하는지 구하시오.
		/*
		 * 출력결과
		 * 3+6+9+12+...=
		 */
		//break
		
		int sum3=0;
		
		for(int a3=1;sum3<100;a3++){//조건을 안쓰면 무한루프. ex) ;;
			                        //혹은 변수a3로 조건을 만들지 않아도 됨.
			                        //sum3<100 는 합이 100보다 작을때까지 반복시킴.
			if(a3%3==0){
				sum3=sum3+a3;
			  System.out.print(a3);
			  if(sum3<100){//이조건을 안걸면 마지막까지 +가 나오기때문에
				           //100미만일때만 + 기호가 나올수 있도록 if문을 건다.
			  System.out.print("+");}
				if(sum3>=100){
					System.out.println('='+" "+sum3);
					
					//System.out.println(sum3);
					break;
				}
			}
		}
		/*
		 * 출력값
		 * 3+6+9+12+15+18+21+24= 108
		 */
		
		
		/*
		 * 선생님이 한 식
		 * 
		 *   int hap=0;
        int num=0;
        String result=""; > 정수는 0에서 많이 시작하지만, 문자열은 빈 문자열로 시작할 수 있음. 공백은 빈 문자열 아님. 
        while(true){
            num=num+3;
            hap=hap+num;
            result=result + num + "+"; > 문자열에서 더하기 연산자 쓰면 끝에 계속 붙음. 그걸 이용함.
            if(hap>100){
                break;
            }
        }//while end
        
        System.out.println(result + "...="+hap);
		 * 
		 */
		
		
		System.out.println("--------------------");
//----------------------------------------------------------------------------------------------------------------		
			
			
			// 과제4) 로또번호 1~45 사이 중에서 서로 겹치치 않게 6개 발생
			// 1차원 배열에다가 저장
			int[] lotto=new int[6];
		/*	lotto[0]=0;
			lotto[1]=0;
			lotto[2]=0;
			lotto[3]=0;
			lotto[4]=0;
			lotto[5]=0;
			
		 //System.out.println((int)(Math.random()*45+1));
			
		for(int idx4=0;;){//idx4++을 증가조검으로 걸면 무조건 증가만 해서, 
			              //증가컨트롤 위해 적지않고 필요할시 idx4++을 한다.
			              //첫번째 for문은 정말 큰 조건 
	       
			int n=(int)(Math.random()*45+1);
			boolean check = true;
			
			// 전체적으로 확인하는 부분
			for(int i=0;i<6;i++){//중복체크하는 for문
				                 //여기서 자세히 조건을 걸면 내가 조절할 수 있다.
				if(lotto[i]==n){
					check = false;
				}
			}
			
			if(check){ // 중복이 하나도 없다
				lotto[idx4++] = n;
				System.out.print(n+" ");
			}
			
			if(idx4==6){
				break;
			}
		
		}
		
	*/
			
			// 선생님이 하신 것.
			// 로또는 if(자신==){random() 다시발생}
			
			int size4=lotto.length;
			
			for(int a4=0;a4<size4;a4++){
				lotto[a4]=(int)(Math.random()*45)+1;
				for(int b4=0;b4<a4;b4++){
					if(lotto[a4]==lotto[b4]){
						a4--;
						break; //같으면 a4가 -1 된 상태로 두번째 for문을 빠져나옴.
						       //결론은 뒤로 한 번 후퇴했다가 다시 오라는 소리
						      //ex) 만약 a4=3일때 같다면, a4-- 즉 a4=2일때로 다시 돌려보낸다.
					}
				}
			}//for
			
			//Arrays 클래스를 이용하여 정렬
			Arrays.sort(lotto);
			
			for(int idx4=0;idx4<size4;idx4++){
				System.out.print("번호"+lotto[idx4]+" ");
			}//for
			
			/*
			 * 분석
			 * 
			 * 샘플로 나온 숫자  : 3 5 7 5
			 * 
			 * a=0
			 *      b=0  0<0
			 * a=1  b=0  0<1
			 *           if(lotto[1]==lotto[0])
			 *                5          3         >같지않음
			 * a=2
			 *      b=0  0<2
			 *           if(lotto[2]==lotto[0])  
			 *                 7         3      > 같지않음                  
			 *           if(lotto[2]==lotto[1])
			 *                 7        5       > 같지않음                     
			 * 
			 * a=3 
			 *     b=0  0<3
			 *          if(lotto[3]==lotto[0])
			 *                5          3      >같지않음
			 *          if(lotto[3]==lotto[1])
			 *                 5       5         > 같음
			 *                 a-1 > a=2로 다시 되돌려서 비교한다.
			 *                 이때 랜덤숫자도 다시 뽑히게 된다.
			 *                    
			 *                                              
			 * 
			 */
			
			
			
			
			
			
		System.out.println();
			
		System.out.println("--------------------");
//----------------------------------------------------------------------------------------------------------------			
		
		/*
		 * 과제5) 
		 * 대각선 방향의 각 요소의 합을 구하시오
		 * 대각선 방향의 합(4+9+7)
		 * 대각선 방향의 합(2+9+6)
		 * su[i][i]
		 */
		int[][] su={
				{4,3,2},
				{5,9,1},
				{6,8,7}
		};
		
		int sum5=0;
		
		for(int a5=0;a5<3;a5++){
			sum5+=su[a5][a5];
		}
			System.out.println("대각선 방향의 합1 : "+sum5);
	
			sum5=0;
		for(int b5=0;b5<3;b5++){
			sum5+=su[b5][2-b5];
			//       0    2  > 2
			//       1    1  > 9
			//       2    0  > 6
		}
			System.out.println("대각선 방향의 합2 : "+sum5);
			
			/*
			 * 출력값
			 * 대각선 방향의 합1 : 20
			 * 대각선 방향의 합2 : 17
			 */
			
			
		//위의 su배열에서 행과 열을 바꿔서 출력하시오.
		/*
		 * 전치행렬
		 * 출력값
		 * 
		 * 456
		 * 398
		 * 217
		 */
			
		for(int c5=0;c5<3;c5++){
			for(int d5=0;d5<3;d5++){
				System.out.print(su[d5][c5]);
			}
			System.out.println();//세게씩 나올때마다 끊기게.
		}
		/*
		 * 분석
		 * c5=0   d5=0  su[d5][c5]  su[0][0]  4
		 *        d5=1  su[d5][c5]  su[1][0]  5
		 *        d5=2  su[d5][c5]  su[2][0]  6
		 *  c5=1  d5=0  su[d5][c5]  su[0][1]  3
		 *        d5=1  su[d5][c5]  su[1][1]  9
		 *        d5=2  su[d5][c5]  su[2][1]  8     
		 */
			
		System.out.println("--------------------");
//----------------------------------------------------------------------------------------------------------------		
		
		
		/*
		 * 과제6)
		 * 행렬 각각의 합, 차를 구하시오
		 * 
		 */
		
		int[][] aa={
				{4,3},
				{5,9}
		};
		int[][] bb={
				{1,2},
				{6,7}
		};
		
		
		int[][] cc={{0,0},{0,0}}; //합
		//출력값
		//5   5
		//11  16
		
		int[][] dd={{0,0},{0,0}}; //차
		//출력값
		//3   1
		//-1  2		
		
		//선생님이 하신것.
		for(int i=0; i<2; i++) {
            for(int j=0; j<2; j++) {
                cc[i][j] = aa[i][j] + bb[i][j]; //합
                dd[i][j] = aa[i][j] - bb[i][j]; //차
            }
        }//for end
		
		/*
		 * 분석
		 * 
		 * i=0
		 *        j=0        cc[0][0]=aa[0][0]+bb[0][0]  >  4+1 > 5
		 *        j=1        cc[0][1]=aa[0][1]+bb[0][1]  >  3+2 > 5
		 * i=1 
		 *        j=0       cc[1][0]=aa[1][0]+bb[1][0]  >  5+6 > 11
		 *        j=1       cc[1][1]=aa[1][1]+bb[1][1]  >  9+7 > 16
		 *        
		 * int[][] cc {
		 *               {5,5},
		 *               {11,16},
		 *             } > 각 행렬의 합
		 *                 
		 * 차이도 이렇게 하면 나옴.            
		 *                           
		 */
        
        for(int i=0; i<2; i++) {
            for(int j=0; j<2; j++) {
                System.out.print(cc[i][j] + " ");
            }
            System.out.println();
        }//for end
          
        for(int i=0; i<2; i++) {
            for(int j=0; j<2; j++) {
                System.out.print(dd[i][j] + " ");
            }
            System.out.println();
        }//for end        
		
		
		
		
		
		System.out.println("--------------------");
		

		
//----------------------------------------------------------------------------------------------------------------	
		
		/*
		 * 과제7) 
		 * 10진수 값을 2진수값으로 변환 후 출력하시오.
		 * 
		 */
	    int num=5;// 출력값 101
		int[] binary=new int[8];
		int count7=0;
		
		while(true){  //무한LOOP
			binary[count7]=num%2;
			count7++;
			num=num/2;
			if(num==1){
				binary[count7]=num;
				break;
			}
			
		}//while
		
		for(int idx7=count7;idx7>=0;idx7--){
			System.out.print(binary[idx7]);
		}//for
		
		System.out.println();
		System.out.println("---------");
		
		
		//Integer 클래스를 활용한 수의 변환
		System.out.println(Integer.toBinaryString(10)); //2진수
		System.out.println(Integer.toOctalString(10)); //8진수
		System.out.println(Integer.toHexString(10));   //16진수

		
			
			
		
		
	}//main

}//class
