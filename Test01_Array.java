package oop0522;

public class Test01_Array {

	public static void main(String[] args) {
		// 1차원 배열 연습
		// 요소 element
		// 순서,색인 index
		
		int[] su={-3,7,0,8,-6};
		int size=su.length; //배열 요소의 갯수. > 5개
		System.out.println("su배열 요소의 갯수:"+size+"개");
		
		for(int idx=0;idx<size;idx++){
			System.out.print(su[idx]+" ");
		}
		
		System.out.println();
		
		
//------------------------------------------------------------------------------------------------------------
		
		// 문1) su배열 요소의 전체 합을 구하시오.
	    /*내가한것
		int even=0,odd=0;
		
		for(int idx=0;idx<size;idx++){
			if(su[idx]>=0){
				even=even+su[idx];
			}else{
				odd=odd+su[idx];
			}
		}//
		
		System.out.println("모든 수의 합:"+(even+odd));
		
		*/
		
		//선생님이 한것
		int sum=0;
		for(int idx=0;idx<size;idx++){
			sum=sum+su[idx];
		}
		System.out.println("합:"+sum);
		
//-------------------------------------------------------------------------------------------------------------
		
		
		// 문2) su배열 요소의 음수 갯수 구하기.
		
		int count=0;
		
		for(int idx=0;idx<size;idx++){
			if(su[idx]<0){
			count=count+1;	
			}
		}//
		
		System.out.println("음수 갯수:"+count+"개");
		
		
//-------------------------------------------------------------------------------------------------------------		

		// 문3) su[0]요소의 등수 구하기.
		// 점수가 높은 것을 1등
		// 등수 하나 밀려난 것은 +1
		

		
		
		/*		
		 *검색해서 작성한것.
		 *
		 // 순위(Rank) 알고리즘 : 지정한 범위내에서의 등수(순위)를 구하는 로직
		// -> 순위 배열을 1등으로 초기화 시켜놓은 후,
		// -> 반복하면서, 나보다 큰 점수가 나오면 나의 순위를 1증가 (카운트)
		
		int rank[]={1,1,1,1,1};
		
		for(int idx=0;idx<size;idx++){
			rank[idx]=1; //1등으로 초기화. 빼도 상관없음 이미 rank 배열이 있기 때문.
			
			for(int a=0;a<size;a++){//기준데이터와 나머지 데이터 비교
				if(su[idx]<su[a]){//기준데이터가 나머지데이터랑 비교했을때
					              //적으면 rank[idx]카운트
					rank[idx]++; //카운트
					
				}
				
			}
			
			
		}//
		
		System.out.println(su[0]+"의 등수는 "+rank[0]+"등");
		
	/*	for(int idx=0;idx<size;idx++){
			System.out.println(su[idx]+"점:"+rank[idx]+"등");
		}//모든 점수 등수구하기
	*/
		
		
		//선생님이 한 것.
		
		int r=1;
		
		/*
		 * if(su[0]<su[0])  > if(-3<-3) > 틀림 
		 * if(su[0]<su[1])  > if(-3<7) > 맞음 > r=1+1
		 * if(su[0]<su[2])  > if(-3<0) > 맞음 > r=2+1
		 * if(su[0]<su[3])  > if(-3<8) > 맞음 > r=3+1 > r=4
		 * if(su[0]<su[4])  > if(-3<-6) > 틀림 
		 * 이렇게 물어보는 것임.
		 */
		
		
		//su[0]의 등수만 구할 때
		
	  for(int idx=0;idx<size;idx++){
			if(su[0]<su[idx]){
			   r=r+1;	
			}
		}
		System.out.println(su[0]+"의 등수:"+r+"등");
	
		
		
	
		
//-------------------------------------------------------------------------------------------------------------
		
		// 문4) 최댓값, 최솟값을 각각 구하기.
		// 만약 모든 수가 음의 정수일 때도 고려하기.
		int max=su[0]; //최댓값 
		int min=su[0]; //최솟값
		//단순히 0집어넣지 않게 주의하자.
		
		for(int idx=0;idx<size;idx++){
			if(max<su[idx]){
				//max의 값보다 su[idx]이 크면 max=su[idx]
				max=su[idx];
			}
			if(min>su[idx]){
				//min의 값보다 su[idx]이 작으면 min=su[idx]
				min=su[idx];
			}
		}
		
		/*
		 * 분석
		 * 
		 * if max 부분
		 * idx=0
		 *       su[0]<su[0] > 둘다 -3
		 * idx=1
		 *       su[0]<su[1] > -3<7 > 맞음 
		 *       max=su[1]
		 * idx=2
		 *       su[1]<su[2] > 7<0 > 맞지않음
		 * idx=3
		 *       su[1]<su[3] > 7<-8 > 맞지않음
		 * idx=4
		 *       su[1]<su[4] > 7<6 > 맞지않음
		 * 최종적으로
		 * max=su[1] > 최대값
		 * 
		 * 
		 * if min
		 * idx=0
		 *         su[0]>su[0]  > 둘다-3 맞지않음
		 * idx=1  
		 *         su[0]>su[1]  >  -3>7 맞지않음
		 * idx=2
		 *         su[0]>su[2]  >  -3>0 맞지않음
		 * idx=3
		 *        su[0]>su[3]  > -3>-8 맞음
		 *        min=su[3]
		 * idx=4
		 *        su[3]>su[4]  > -8>6 맞지않음
		 * 최종적으로
		 * min=su[3] > 최소값                                                                   
		 * 
		 */
		
		
		System.out.println("최댓값:"+max);
		System.out.println("최솟값:"+min);

		
		
//----------------------------------------------------------------------------------------------------------
		
		
		// 문5) su배열 각 요소의 등수를 구하시오.
		
		/*
		 * 분석
		 * 
		 * if(su[0]<su[0])
		 * if(su[0]<su[1])
		 * if(su[0]<su[2])
		 * if(su[0]<su[3])
		 * if(su[0]<su[4])
		 * 
		 * if(su[1]<su[0])
		 * if(su[1]<su[1])
		 * if(su[1]<su[2])
		 * if(su[1]<su[3])
		 * if(su[1]<su[4])
		 * 
		 * if(su[2]<su[0])
		 * if(su[2]<su[1])
		 * if(su[2]<su[2])
		 * if(su[2]<su[3])
		 * if(su[2]<su[4])
		 * 
		 * if(su[3]<su[0])
		 * if(su[3]<su[1])
		 * if(su[3]<su[2])
		 * if(su[3]<su[3])
		 * if(su[3]<su[4])
		 * 
		 */
		int[] rank={1,1,1,1,1}; //su의 요소들 순대로 일단 1로 설정해놓는다.
		
		for(int a=0;a<size;a++){
			for(int b=0;b<size;b++){
				if(su[a]<su[b]){
					rank[a]=rank[a]+1; //rank[a]++
				}
			}
			
			System.out.println(su[a]+"의 등수:"+rank[a]+"등");
		}//
		/*
		 * 분석
		 * 
		 * a=0
		 *       b=0   su[0]<su[0]  > 둘다 -3이라 맞지않음
		 *       b=1   su[0]<su[1]  > -3<7 맞음 > rank[0]=rank[0]+1=1+1>2
		 *       b=2   su[0]<su[2]  > -3<0 맞음 > rank[0]=2+1 
		 *       b=3   su[0]<su[3]  > -3<8 맞음 > rank[0]=3+1
		 *       b=4   su[0]<su[4] > -3<-6 틀림  > 결론 rank[0]=4
		 *       
		 *       
		 * a=1
		 * 		 b=0   su[1]<su[0]  > 7<-3 틀림
		 *       b=1   su[1]<su[1]  > 7<7 틀림
		 *       b=2   su[1]<su[2]  > 7<0 틀림  
		 *       b=3   su[1]<su[3]  > 7<8 맞음 > rank[1]=1+1
		 *       b=4   su[1]<su[4]  > 7<-6 틀림 > rank[1]=2
		 *       
		 * a=2
		 * 		 b=0   su[2]<su[0]  > 0<-3 틀림
		 *       b=1   su[2]<su[1]  > 0<7 맞음 > rank[2]=1+1
		 *       b=2   su[2]<su[2]  > 0<0 틀림
		 *       b=3   su[2]<su[3]  > 0<8 맞음 > rank[2]=2+1
		 *       b=4   su[2]<su[4]  > 0<-6 틀림 > rank[2]=3           
		 *       
		 *           ...
		 *           
		 */
		
		
		
	}//main

}//class
