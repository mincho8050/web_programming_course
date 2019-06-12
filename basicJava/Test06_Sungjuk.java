package oop0611;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.*;
import java.util.StringTokenizer;



public class Test06_Sungjuk {

	public static void main(String[] args) {
		/*
		 * 성적 프로그램
		 * 성적 입력 자료를 가져와서  > sungjuk.txt
		 * 성적 결과 파일 완성하기. > 메모장에 출력 > result.txt
		 */
		/*
		 * 입력
		 * 	무궁화,95,90,100
			홍길동,30,55,40
			라일락,60,95,75
			진달래,20,85,65
			봉선화,100,35,100
			
			입력값!
			sungjuk.txt에 이렇게 한줄씩 들어가 있음.
			우리가 필요한 데이터들은 한사람에 대한 데이터.
			줄단위로 불러와서 자르는게 낫다고함. 
			, 기준으로 잘라서 이름은 name, 국어는 kor등 이렇게 저장한다고함.
			
			String[] name{}
			int[] kor 
			이렇게 여기에 하나씩 넣는다고함.
			spilt하니까 자료분리가 불편하다고 토큰을 사용한다고하심.
			이렇게 분리해서 넣는걸 5번 반복하신다고함.
			입력데이터가 완성안된걸 가공하는것이 중요. 
		 */
		
		/*
		 * 출력
		 *                    성 / 적 / 결 / 과
				--------------------------------------------------------
				이름   국어 영어 수학 평균 등수 결과
				--------------------------------------------------------
				무궁화  95   90  100  100  1    합격   ********** 장학생
				홍길동  30   55   40   33  5    불합격 ***
				개나리  90   95   90   91  2    합격   *********
				진달래  70   80   60   70  4    합격   *******
				라일락  35  100  100   78  3    재시험 *******
				--------------------------------------------------------
				>이건 파일과 점수가다름 형식만 참고
		 */
		
		try{
			
			String inName="D:/java0514/testFile/sungjuk.txt"; //입력
			String outName="D:/java0514/testFile/result.txt"; //출력
			
			
			//1) 데이터 저장 변수 선언
			//아직 내용이 메모장에 있으니까 이렇게 선언한다.
			//줄단위로 가져온다.
			//예전에 성적프로그램 했던거 가져온거
			String[] name=new String[5];
			int[] kor=new int[5];
			int[] eng=new int[5];
			int[] mat=new int[5];
			int[] aver=new int[5];
			int[] rank={1,1,1,1,1};
			int size=name.length;
			
			
			
			//2) sungjuk.txt에서 가져와서 한줄에 ,를 기준으로 토큰 후 해당변수에 저장하기.
			// > 읽기모드로 가져와야함. 엔터를 기준으로 가져올것임
			//커서가 가리켜야 나옴. 가리키면 true, 없으면 false
			//커서는 next속성을 가지고 있다.  previous속성과 last , first속성을 가지고 있음.
			//원하는 패턴대로 사용할 수 있다.
			FileReader in=new FileReader(inName);
			//커서를 만들어줘야 우리가 원하는 내용을 가져올 수 있음
			//자료가 없으면 커서가 안만들어짐
			BufferedReader br=new BufferedReader(in);
			
			//2-1) 한줄을 가져오기 그래야 토큰을 한다.
			//그럴려면 메모장에 다섯줄이 있는데 일괄처리 해야함.
			
			int idx=0; //값을 넣을떄의 변수.
			String line=null; // 빈값, 있으면 string 없으면 null
			
			
			while(true){//무한반복
			line=br.readLine();//없는 데이터면 null
			if(line==null){//null이면
				break;//반복문 탈출
			}//if
			//텍스트 파일에서 무궁화,95,90,100 가져와서
			//line변수에 넣은거임
			//한줄만 가져온거니까 나머지 가져오려면 for문 사용
			//만약 줄수가 100줄이라면 idx<5 범위를 맨날 고쳐야 하니까 for문보다는 
			//while문으로 하자.
			//while문은 한줄씩 읽고 초기화. 벗어남. 
			/*
			 * for(int idx=0;idx<5;idx++){
				line=br.readLine();
				}//for
				이렇게 해도 상관은 없는데 조건을 매번 변경해줘야하니까 while문의 무한반복을 이용하자.
			 */
			
			//System.out.println(line); 테스트
			/*
			 * 여기까지 했을 때의 출력값.
			 * 	무궁화,95,90,100
				홍길동,30,55,40
				라일락,60,95,75
				진달래,20,85,65
				봉선화,100,35,100
			 */
			
			
			StringTokenizer st=new StringTokenizer(line,",");
			//System.out.println(line); 테스트
			while(st.hasMoreElements()){ //토큰할게 있을때가지 반복
				//System.out.println(st.nextToken()); 테스트
				name[idx]=st.nextToken();
				kor[idx]=Integer.parseInt(st.nextToken()); //int라 형변환
				eng[idx]=Integer.parseInt(st.nextToken()); 
				mat[idx]=Integer.parseInt(st.nextToken()); 
				
			}//while
			idx++;	//그 다음 사람은 idx가 증가해야 하기 때문에
					//안그러면 계속 idx가 0이기 때문에 0번째에 저장된다. 
			
			/*
			 * 	무궁화,95,90,100	>line을 ,를 기준으로 토큰
				무궁화	> name[0]
				95		> kor[0]
				90		> eng[0]	
				100		> mat[0]
				---------------------------------
				홍길동,30,55,40	>line을 ,를 기준으로 토큰
				홍길동	> name[1]
				30		> name[1]
				55		> name[1]	
				40		> name[1]
				
				반복할때마다 점선기준으로 0,1~ 
				이니까 변수가 1씩 증가해서 넣어줘야한다.
				idx를 해야한다.
			 */
			
			//--여기가 한줄씩 불러서 ,를 기준으로 분리 후 변수에 저장하기.

			}//while end
			
			
			
			//3) 평균, 등수 구하기.
			
			//평균
			for(int idx1=0;idx1<5;idx1++){
				aver[idx1]=(kor[idx1]+eng[idx1]+mat[idx1])/3;
			}
			
			//등수
			for(int idx2=0;idx2<5;idx2++){	
				for(int b=0;b<size;b++){
					if(aver[idx2]<aver[b]){
						rank[idx2]=rank[idx2]+1;
					}
				}

			}//

			
			//4) result.txt에 출력하기
			FileWriter fw=new FileWriter(outName);
			PrintWriter out=new PrintWriter(fw,false); //true면 버퍼클리어.
			/*
			 * 플러시(Flush)
			 * 버퍼가 다 찼을 때, 버퍼에 쌓인 데이터를 실제로 전송되어야 할 곳(또는 저장되어야 할 곳)에
			 * 전송하고 (또는 저장하고) 버퍼를 비우는 것을 '플러시'라고 한다.
			 */
			
			
			//out.printf("%d %f %c %s",3,1.2,'r',"soldesk"); > 테스트 혼합해서 사용할 수 있음
			
			out.println(" 성 / 적 / 결 / 과");
			out.println("--------------------------------------------------------");
			out.println("이름   국어 영어 수학 평균 등수 결과");
			out.println("--------------------------------------------------------");
			
			
			//이름, 국어, 영어, 수학, 평균 , 별, 과락, 장학생
			for(int idx3=0;idx3<5;idx3++){
				
				out.printf("%-6s %-5d %-5d %-5d %-5d %-5d",name[idx3],kor[idx3],eng[idx3],mat[idx3],aver[idx3],rank[idx3]);
				// 문1) 과락 > 합격,재시험, 불합격
				// 평균 70점 이상이상, 각과목 40점 이상
				
				if(aver[idx3]>=70){
					if(kor[idx3]<40||eng[idx3]<40||mat[idx3]<40){
						out.printf("%-6s","재시험");
						
					}else{
						out.printf("%-6s","합격");
						
					}
					
				}else{
					out.printf("%-6s","불합격");
					
				}
				
				
				// 문2) 평균 10점당 *개씩
				
				for(int s=0;s<(aver[idx3]/10);s++){
					out.printf("*");
				}
				
				// 문3) 평균 95점 이상 장학생
				
				
				if(aver[idx3]>=95){
					out.printf("%6s","장학생");
				}

				
				out.println();//줄바꿈
			}//for 이름, 국어, 영어, 수학, 평균 , 별, 과락, 장학생
			

			in.close();
			fw.close();
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}//try
		
		
		
		
		
	}//main

	

}//class
