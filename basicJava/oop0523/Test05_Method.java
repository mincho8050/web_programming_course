package oop0523;

public class Test05_Method {
	
	public static void test1(int a,int b){//int a=su[0] , int b=su[2]
		System.out.println(a+b);
	}//test1
	
	public static void test2(int[] a){//배열로 받기때문에 int[] 함수명으로 받기.
		
		for(int idx=0;idx<a.length;idx++){
			System.out.println(a[idx]);
		}
		
	}//test2

	public static void test3(String a,String b){
		System.out.println(a);
		System.out.println(b);
	}//test3
	
    public static void test4(String[] a){
		for(int idx=0;idx<a.length;idx++){
			System.out.println(a[idx]);
		}
	}//test4
	
    public static void test5(int a,int b){
    	System.out.println(a);
    	System.out.println(b);
    }//test5
    
    public static void test6(int[][] su){
    	int row=su.length; //전체 행의 길이
    	for(int a=0;a<row;a++){
    		int col=su[a].length; //
    		for(int b=0;b<col;b++){
    			System.out.print(su[a][b]+" ");
    		}
    	}
    }//test6
    
    public static void test7(char a,char b,char c){
    	System.out.println(a);
    	System.out.println(b);
    	System.out.println(c);
    }//test7

    
    public static int mo(char[][] alp){
    	
    	int count=0;
    	int row=alp.length;
    	
    	for(int a=0;a<row;a++){
    		int col=alp[a].length;
    		
    		for(int b=0;b<col;b++){
    			
    			if(alp[a][b]=='a'||alp[a][b]=='e'||alp[a][b]=='i'||alp[a][b]=='o'||alp[a][b]=='u'||
    					alp[a][b]=='A'||alp[a][b]=='E'||alp[a][b]=='I'||alp[a][b]=='O'||alp[a][b]=='U')
					
    		  count=count+1;
    		}
    		
    	}//for
         return count; //return count 를 마지막에 써줘야함. if 안에 써주면 에러.
    }//mo
    
    
	public static void main(String[] args) {
		// 전달값이 1차원 배열인 경우
		
		int[] su={2,4,6};
		test1(su[0],su[2]); //test1(2,6)
		                    
		
		test2(su); //su배열을 다 받는다는 말.
		
		
		String[] name={"진달래","무궁화","홍길동"};
		test3(name[0],name[2]); // 진달래, 홍길동
		test4(name); //name배열을 다 넘긴다는 의미.
		
		
//------------------------------------------------------------------------------------------
		
		
		// 전달값이 2차원 배열인 경우
		
		int[][] su2={
				{1,2,3},
				{6,5,4} //2행3열
		};
		
		test5(su2[0][0],su2[1][2]); //1,4
		test6(su2);
		
		
		char[][] ch={
				{'Y','e','a','r'},
				{'M','o','n','t','h'},
				{'D','a','t','e'}
		};
		
		test7(ch[0][0],ch[1][0],ch[2][0]);
		
		// 문) 모음의 갯수를 출력하시오.
		int result=mo(ch);
		System.out.println(result);
		
		
		
		
		
		
		
		

	}//main

}//class
