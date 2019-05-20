package oop0516;

public class Test06_Operator {

	public static void main(String[] args) {
		// 대입연산자
		int a=3;
		a=a+2;
		System.out.println(a);
		a+=2; //기존 a변수에 2를 +한 값을 다시 2에 넣는것. a=a+2; 식인데. 간단하게 줄인 것. 
		System.out.println(a); //7
		
		a=a-3;
		System.out.println(a); //4
		a-=3; //이것도 간단하게 쓴것.
		System.out.println(a); //1
		
		a*=5;
		System.out.println(a); //5
		
		a/=6;
		System.out.println(a); //0
		

//-------------------------------------------------------------------------------------------------------
		
		// 1씩 증가 연산자
		int b=3;
		b=b+1;
		b+=1;
		System.out.println(b); //5
		
		b++; //1씩 증가한다는 단축표시
		System.out.println(b); //6
		++b; //순서 바꿔도 상관 없음.
		System.out.println(b); //7

//-------------------------------------------------------------------------------------------------------

		//1씩 감소 연산자
		int c=3;
		c=c-1;
		c-=1;
		System.out.println(c); //1
		
		c--; //1씩 감소한다는 단축표시
		System.out.println(c);
		--c; //순서 바꿔도 상관 없음.
		System.out.println(c);
		
		
//-------------------------------------------------------------------------------------------------------
		
		//1씩 증가,감소 연산자는 단독으로 쓰면 괜찮은데 다른것과 함께 혼용할 때는 주의하기.
		//1증감연산자는 계산식,대입연산자와 사용되는 경우 주의
		int x=10,y=20;
		int q=x++; //++이 변수명 뒤에있음. 나중에 x값 증가.
		          // int q=x
		          // x=x+1
		int r=--y; //먼저 y변수값 감소
		          //y=y-1
		          //int r=y
		
		System.out.println(x); //11
		System.out.println(y); //19
		System.out.println(q); //10 맨처음 x값인 10이 먼저 q에 대입되었기 떄문에 10
		System.out.println(r); //19
		
		
		
		
//-------------------------------------------------------------------------------------------------------
		
		//과제)
		int s=2,d=6;
		int f=++s*d--;
		
		System.out.println(s); //++s기 때문에 먼저 증감이 적용된다. 그래서 3을 예상 > 맞음
		System.out.println(d); //5예상 > 맞음
		System.out.println(f); // ++2기 때문에 3, 6--는 후자에 있어서 늦게 적용되서 그냥 6, 그래서 3*6=18예상. > 맞음
		
		
		
		
		
		
		
		
		

	}

}
