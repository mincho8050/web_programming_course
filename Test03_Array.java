package oop0522;

public class Test03_Array {

	public static void main(String[] args) {
		// 2차원 배열
		// > 행과 열로 구성
		// > 행과 열은 0부터 시작.
		
		/*
		 * @@@   0행3열
		 * @@@   0행3열
		 * 
		 */
		
		int[][] kor=new int[2][3]; //2행3열
		//2차원배열은 기본적으로 반복문이 2개가 온다.
		kor[0][0]=10;
		kor[0][1]=20;
		kor[0][2]=30;
		
		kor[1][0]=40;
		kor[1][1]=50;
		kor[1][2]=60;		
		
		System.out.println(kor[0][0]);
		System.out.println(kor[0][1]);
		System.out.println(kor[0][2]);
		
		System.out.println(kor[1][0]);
		System.out.println(kor[1][1]);
		System.out.println(kor[1][2]);		
		//이중반복문이 기본
		
//-------------------------------------------------------------------------------------------------------------
		//2차원 배열을 압축해서 사용하는 법.
		
		int[][] eng={
		 //     0열  1열 2열 		
				{10,20,30},//0행
				{40,50,60}//1행
				}; //0행은 0행끼리, 1행은 1행끼리 묶는거.
		           //2행3열
		
		System.out.println(eng.length);  //결과값 : 2
		                                 //행의 갯수.
		
		System.out.println(eng[0].length); //결과값 : 3
		                                   //0행의 열의 갯수
		
		System.out.println(eng[1].length); //결과값 : 3
		                                   //1행의 열의 갯수.
		
		
		for(int a=0;a<=1;a++){
			for(int b=0;b<=2;b++){
				System.out.println(eng[a][b]);
			}
		}//for
		
		
		System.out.println();
//-----------------------------------------------------------------------------------------------------------------------		
		
		/*
		 * 자바는 다각형도 허용한다.
		 * 
		 * 00      0행2열
		 * 0000    1행4열
		 * 00      2행2열
		 * 
		 * 각 행의 열의 갯수가 달라도 무방하다.
		 * 
		 */
		
		int[][] mat={
				{10,20},
				{30,40,50,60},
				{70,80,90}
		};
		
		int row=mat.length; //행의 갯수. 3
		
		for(int c=0;c<row;c++){
			int col=mat[c].length;//c행의 열의 갯수를 구한다. 
			for(int d=0;d<col;d++){
				System.out.print(mat[c][d]+" ");
			}
		}//for
		
		System.out.println();
//------------------------------------------------------------------------------------------------------------------
		
		char[][] ch={
				{'H','a','p','p','y'},	
				{'A','p','p','l','e'},
				{'S','o','l','d','e','s','k'}
		};
		
		int row1=ch.length; //행의 갯수.
		
		// 문) 모음의 갯수를 구하시오. aeiou
		
		int count=0;
		
		for(int x=0;x<row1;x++){
			int col1=ch[x].length;
			for(int y=0;y<col1;y++){
				if(ch[x][y]=='a'||ch[x][y]=='e'||ch[x][y]=='i'||ch[x][y]=='o'||ch[x][y]=='u'||
						ch[x][y]=='A'||ch[x][y]=='E'||ch[x][y]=='I'||ch[x][y]=='O'||ch[x][y]=='U'){
					count=count+1;
				}
					
			}
			
		}//for
		
		System.out.println("모음의 갯수 : "+count+"개");
		
		
	/*	
	 * // 선생님이 한 것.
		 int mo=0;
        for(int a=0; a<row; a++){
            int col=ch[a].length;
            for(int b=0; b<col; b++){
                char c=ch[a][b];     //각 요소값 가져오기
                if(c>='A' && c<='Z'){//대문자인지?
                    c=(char)(c+32);  //대문자면 소문자로 바꿈
                }
                switch(c){ //그다음 switch를 사용해서 갯수 구하기.
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':mo++;
                }
            }//for end
        }//for end
        
        System.out.println(mo);
        
        */
		 

		
		

	}//main

}//class
