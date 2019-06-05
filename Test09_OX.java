package oop0604;

class Sungjuk{
	
	private int no;						//번호
	private String name;				//이름
	private int[] answer=new int[5];	//답안제출
	private char[] ox=new char[5];		//ox표시
	public int score;					//점수
	public int rank;					//등수
	
	
	public Sungjuk(){}
	
	//클래스를 설계할 때는 한사람것만 생각하고 짠다. 그 후는 반복문으로 돌리면되니까.
	
	//초기값전달 > 생성자로 한다.
	public Sungjuk(int no,String name,int a,int b,int c,int d,int e){
		this.no=no;
		this.name=name;
		this.answer[0]=a;
		this.answer[1]=b;
		this.answer[2]=c;
		this.answer[3]=d;
		this.answer[4]=e;
		this.rank=1;
	}
	
	
	public void compute(){
		//제출한 answer답안과 정답을 비교해서
		//OX를 구하고, 맞은 갯수에 따라 점수구하기.
		int[] dap={1,1,1,1,1};	//정답 > 맞으면 o, 틀리면 x > 한문제당 20점 계산

		
		 for(int idx=0; idx<dap.length; idx++){
	            if(dap[idx]==this.answer[idx]){
	            	this.ox[idx]='O';
	                this.score=this.score+20;
	            }else{
	            	this.ox[idx]='X';
	            }
	        }//for end
		
	}//compute()


	public void disp(){
		//출력하기
        System.out.print("NO."+this.no+" ");
        System.out.print(this.name+" ");
        for(int a=0;a<this.ox.length;a++){
        	System.out.print(this.ox[a]+" ");
        }
        System.out.print(this.score+"점"+" ");
        System.out.print(this.rank+"등"+" ");
        System.out.println();

	}//disp()
	
	
	
}//sungjuk class



public class Test09_OX {

	public static void main(String[] args) {
	
		/*
		성적프로그램
		pretyimo.cafe24.com > OOP
		[예제] 성적프로그램 OX 표시하기
		    
		          ** 시험결과 **
		====================================
		번호 이름    1  2  3  4  5  점수 등수      
		------------------------------------    
		1    홍길동  ○ X  ○ ○ ○  80   2    
		2    무궁화  ○ ○ ○ ○ ○ 100   1
		3    라일락  X  X  X  X  ○  20   5
		4    진달래  X  ○ X  ○ ○  60   3
		5    봉선화  ○ ○ X  X  X   40   4
		------------------------------------   
		- 맞힌문제 ○ , 틀린문제 X표시
		- 점수: ○당 20점씩
		- 등수: 점수를 기준으로 높은사람이 1등
		- 정렬: 등수를 기준으로 오름차순 정렬
		*/
		
		Sungjuk[] student={
				new Sungjuk(1,"홍길동",1,2,1,1,1),
				new Sungjuk(2,"무궁화",1,1,1,1,1),
				new Sungjuk(3,"라일락",3,4,2,4,1),
				new Sungjuk(4,"진달래",4,1,3,1,1),
				new Sungjuk(5,"봉선화",1,1,2,3,2)
		};

		
	int size=student.length;
	
	//1)점수계산하기
	for(int idx=0; idx<size; idx++){
        student[idx].compute();
    }//for end
    
    //2) 등수구하기
    for(int a=0;a<size;a++){
		for(int b=0;b<size;b++){
			if(student[a].score<student[b].score){
				student[a].rank=student[a].rank+1;
			}
		}

	}//
    
    //3) 정렬하기(등수를 기준으로 오름차순 정렬)
    
    for(int a=0;a<size-1;a++){ 
		for(int b=a+1;b<size;b++){
		if(student[a].rank>student[b].rank){
		Sungjuk tmp=student[a];
		student[a]=student[b];
		student[b]=tmp;
				}
			}
		}//for
		
    
    //4)출력하기
    for(int idx=0; idx<size; idx++){
        student[idx].disp();
    }//for end
 

	}//main



}//class