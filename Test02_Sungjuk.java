package oop0522;

public class Test02_Sungjuk {

	public static void main(String[] args) {
		
		// 성적 프로그램 완성하기
		
		
		
		String[] name={"아이린","웬디","슬기","조이","예리"};
		int[] kor={100,20,85,55,95};
		int[] eng={100,40,80,65,95};
		int[] mat={100,35,75,70,35};
		int[] aver=new int[5];
		int[] rank={1,1,1,1,1};
		int size=name.length;
		

		//평균구하기
		
		for(int idx=0;idx<size;idx++){
			aver[idx]=(kor[idx]+eng[idx]+mat[idx])/3;
		}//
		
		
		
		//등수구하기 (평균값을 기준으로)
		
		
		for(int a=0;a<size;a++){
			for(int b=0;b<size;b++){
				if(aver[a]<aver[b]){
					rank[a]=rank[a]+1;
				}
			}
			
			System.out.println();
			
		}//
		

		//출력하기
		
		for(int idx=0;idx<size;idx++){
			System.out.print("이름:"+name[idx]+" ");
			System.out.print("국어:"+kor[idx]+"점"+" ");
			System.out.print("영어:"+eng[idx]+"점"+" ");
			System.out.print("수학:"+mat[idx]+"점"+" ");
			System.out.print("평균:"+aver[idx]+"점"+" ");
			System.out.print(rank[idx]+"등"+" ");
			
			// 문1) 과락 > 합격,재시험, 불합격
			// 평균 70점 이상이상, 각과목 40점 이상
			
			if(aver[idx]>=70){
				if(kor[idx]<40||eng[idx]<40||mat[idx]<40){
					System.out.print(" 재시험 ");
				}else{
					System.out.print(" 합격 ");
				}
				
			}else{
				System.out.print(" 불합격 ");
			}
			
			
			// 문2) 평균 10점당 *개씩
			
			for(int s=0;s<(aver[idx]/10);s++){
				System.out.print("*");
			}
			
			
			
		
			// 문3) 평균 95점 이상 장학생
			
			
			if(aver[idx]>=95){
				System.out.print(" 장학생");
			}
			
			
			
			System.out.println();
		}//for
		
		
		
		
		
		

	}//main

}//class
