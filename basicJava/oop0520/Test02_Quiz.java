package oop0520;

public class Test02_Quiz {

	public static void main(String[] args) {
		// 반복문 연습문제
		
		
		// 문1) 1~100중에서 2의 배수이면서, 3의 배수의 갯수를 구하시오.
		//a%2==0&&a%3==0  아니면 6의 배수구하기.
		
		int count=0;
		for(int a=1;a<=100;a++){
			if(a%6==0){
				count=count+1;
			}
		}

		System.out.println(count);
//------------------------------------------------------------------------------------
		
		
		// 문2) 소문자 중에서 모음의 갯수를 구하시오.
		// > 모음 aeiou > 5개
		
		int alpcount=0;
		for(char ch='a';ch<='z';ch++){
			if(ch=='a'||ch=='e'||ch=='i'||ch=='o'||ch=='u'){
				alpcount=alpcount+1;
			}
			
		}
		
		System.out.println(alpcount);
	
		/*
	    //선생님이 하신 switch 방법
		for(char ch='a';ch<='z';ch++){
		switch(ch){
		case 'a':
		case 'e':
		case 'i':
		case 'o':
		case 'u': alpcount++;
		}
		}
		System.out.println(alpcount);
		*/
		
		
		
		
//----------------------------------------------------------------------------------
		
		// 문3) 대문자 알파펫을 한줄에 5개씩 출력하시오
		// 카운트 변수가 5의 배수여야 5번에 한번씩
		// 5의 배수가 나오면 줄바꿈.
		//System.out.println(); 아무것도 안쓰면 줄바꿈
		/*
		 * ABCDE
		 * FGHIJ
		 * KLMNO
		 * PQRST
		 * UVWXY
		 * Z
		 * 으로 출력
		 */
		
		
		for(char alp='A';alp<='Z';alp++){
			
			//System.out.print(alp);썼을때는 A만 따로 써졌는데.
			//이유는 A가 65라 5로 나눠져서 한칸이 띄워진다.
			if(alp%5==0){
				System.out.println();
			}
			System.out.print(alp); 
			//이렇게 하면 위에 공백이 생긴다. 

		}//
		
		//선생님이 하신거.
		int upper=0;
		for (char alp='A';alp<='Z';alp++){
			upper++;
			//System.out.print(upper);
			System.out.print(alp);
			if(upper%5==0){
				System.out.println();
			}
			
		}//공백이 생기지 않음 
		
		
		
	
		
//----------------------------------------------------------------------------------
		
		
		// 문4) 1~100중에서 짝수의 합, 홀수의 합을 각각 구하시오.
		int even=0;//짝수의 합
		int odd=0;//홀수의 합
		
		for(int b=1;b<=100;b++){
			if(b%2==0){
				even=even+b;
			}else if(b%2!=0){
				odd=odd+b;
			}//선생님이 하신부분은 여기는 else로 그냥 했다.
			 //어차피 숫자는 짝수 아니면 홀수니까.
		}
		System.out.println("짝수의 합 : "+even);
		System.out.println("홀수의 합 : "+odd);
		

//----------------------------------------------------------------------------------
		
		// 문5) 다음식의 결과를 구하시오.
		// > 1-2+3-4 ....  +99-100 = ?
		//-+-+-+ 엇갈리게 나옴
		//홀수끼리 다 더하고 홀수는 -로 해서 더하고 해서 총계산..?
		
		int ecount=0; //짝수
		int ocount=0; //홀수
		
	    for(int c=1;c<=100;c++){
	    	if(c%2!=0){
	    		ocount=ocount+c;
	    	}else if(c%2==0){
	    		ecount=ecount-c;
	    	}
	    }
	    
	    System.out.println(ocount+ecount);
	    
	    //선생님이 하신것.
	    
	    /* boolean flag=false;
	    for(int h=1;h<=100;h++){
	    	if(flag){
	    		flag=false;
	    	}else{
	    		flag=true;
	    	}
	    }//
	    
	     * h=1   if(false)
	     *       else{flag=true}
	     *       
	     * h=2   if(true){flag=false}
	     * h=3   if(false)
	     *       else{flag=true}      
	     */
	    
	    boolean flag=false;
	    int hap=0;
	    
	    for(int h=1;h<=100;h++){
	    	if(flag){
	    		hap=hap-h;
	    		flag=false;
	    	}else{
	    		hap=hap+h;
	    		flag=true;
	    	}
	    }//
	    
	    /*
	     * h=1   if(false)
	     *       hap=0+1
	     *       flag=true
	     *       
	     * h2    if(true)
	     *       hap=1-2
	     *       flag=false
	     * 
	     * h3    if(false)
	     *       hap=-1+3
	     *       flag=true
	     *       
	     * h4    if(true)
	     *       hap=2-4
	     *       flag=false                    
	     */
	    
	    System.out.println(hap);

	
//-----------------------------------------------------------------------------------
		
		
		// 문6) 두 수 사이의 합을 구하시오.
		//2+3+4+5=?
		//5+4+3+2=?
		//start 값과 end 값이 바뀌어도 값이 동일하게 나오게 하기.
	    
		int start=5,end=2;
		int tcount=0;
		 
		
		
		if(start>end){
			for(int c=end;c<=start;c++){
				tcount=tcount+c;
			}
		}else if(start<end){
			for(int c=start;c<=end;c++){
				tcount=tcount+c;
			}
		}
		
		System.out.println(start+"와"+end+"의 사이 합 : "+tcount);
		
	   	//선생님이 하신것.
		//swap : 변수값을 서로 교환
		int start2=5,end2=2;
		int sum=0;
		
		if(start2>end2){//만약 시작값이 마지막값보다 크다면
			//swap
			int tmp=start2; //가상의 변수에 시작값을 잠시 두고
			start2=end2;//시작값을 마지막값에 둔다.
			end2=tmp;//그리고 가상의 변수의 값을 마지막값에 넣는다.
			         //이렇게 되면 시작값과 마지막값이 바뀌면서 시작값<마지막값. 이렇게 된다.
		}//if end
		
		for(int k=start2;k<=end2;k++){//시작값<마지막값(원래부터 이렇던가 아니면 위의 식에서 바뀌었든가)
			sum=sum+k;
		}//
		
		System.out.println(sum);
		

	}//main end

}//class end
