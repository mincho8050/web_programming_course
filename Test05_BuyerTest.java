package oop0609;

import java.util.Vector;

//import oop0610.Product;

class Product extends Object{
	public int price;		//상품가격
	public int bounsPoint;	//마일리지 가격의 10%
	
	//기본생성자함수
	public Product(){};
	
	public Product(int price){
		this.price=price;//지역변수와 멤버변수를 구분하기 위해 this
		//상품가격이랑 마일리지는 모든 상품의 공통적인 부분 > 부모클래스로 둔다. 
		this.bounsPoint=(int)(price*0.1); //마일리지
										  //상품가격*10
	}//product
	
	
}//class

class SmartTV extends Product{
	//상품가격이 100, 마일리지 > 상품가격*10% > 100*0.1
	//부모한테 물려받은 price가 살아있는것임. (눈에보이지는 않지만 물려받았음)
	//부모생성자의 도움을 받아야한다.
	//super()를 사용한다.
	
//	int price=100; 을 하면 부모랑 별개로 price를 만들게 된다.
//	부모한테서 물려받은 price로 한다.
	
	public SmartTV(){
		super(100);		//이렇게 값을 전달해주는 순간에 SmartTV의 price는 100 bounsPoint는 10
						//super를 이용해서 값을 전달하면 부모클래스랑 연동? 된다.
	}
	
	@Override
	public String toString() {
		return "스마트TV"; 	//상품명
							//Object의 조상클래스 재정의. override
	}

}//class


class Notebook extends Product{
	//상품가격 200
	public Notebook(){
		super(200);		//Notebook의 price는 200 , bounsPoint는 20
	}
	@Override
	public String toString() {
		return "노트북";	//상품명
	}
}//class



class MobilePhone extends Product{
	//상품가격 150
	public MobilePhone(){
		super(150); 	//price 150 , bounsPoint 15
	}
	@Override
	public String toString() {
		return "핸드폰";	//상품명
	}
}//class


class Buyer{
	
	private int money=1000;	//나의 총재산
	private int mileage=0;	//마일리지 점수
	
	//구매한 상품을 저장하는 배열.
	//list를 이용해서 한다. 배열을 이용할 수도 있다. oop0610 > Test04는 배열을 이용.
	private Vector<Product> vec=new Vector<Product>();
	
	public Buyer(){}
	
//	public void buy(SmartTV a){}
//	public void buy(Notebook a){}
//	public void buy(MobilePhone a){}
//	이렇게 하나하나 값을 받아도 틀린건 아니지만 부모가 Product라는 공통점이 있음
//	다향성!
	public void buy(Product p){
		
		if(this.money<p.price){
			System.out.println("잔액이 부족합니다.");
			return;
		}//if
		
		//구매한 상품을 저장
		vec.add(p);
		
		
		this.money=this.money-p.price;
		this.mileage=this.mileage+p.bounsPoint;
		//값이 들어오면 나의 총재산은 그 가격만큼 줄어들고 마일리지는 그 가격 보너스포인트 만큼 늘어난다.
	}//buy()
	//부모가 자식한테 들어가면 자식한테 맞춰짐. 
	//만약 SmartTV 값이 들어가면 그렇게 변함. 왜냐 Product는 부모니까! 
	
	
	public void disp(){
		
		//내가 구매한 상품명
		String goods="";
		//내가 사용한 총 누적 합계
		int hap=0;
		
		if(vec.isEmpty()){
			System.out.println("구매 상품 내역이 없습니다.");
			return;
		}//이건 굳이 안넣어도 상관없다고함
		
		for(int n=0;n<vec.size();n++){
			if(vec.get(n)==null) break; //10개 선언했는데 구매한 갯수가 5개면 0~4번째까지는 찍어도
									 //5번째부터는 null 빈값. 회전수가 남아있어도 break
			goods=goods+vec.get(n).toString()+" ";
							//item[n].toString() 생략가능
							// > 각각 SmartTV , Notebook , MobilePhone 의 override된 toString()
			hap=hap+vec.get(n).price;
		}//for
		
		System.out.println("구매상품내역: "+goods);
		System.out.println("사용금액: "+hap);
		System.out.println("남은재산: "+this.money);
		System.out.println("마일리지: "+this.mileage);
	}//disp()
	
	public void refund(Product p){
		if(vec.remove(p)){
			System.out.println(p.toString()+"반품");
			this.money=this.money+p.price;
			this.mileage=this.mileage-p.bounsPoint;
		}else{
			System.out.println(p.toString()+"상품이 없습니다.");
		}
		
	}//refund()
	
	
	
}//class





public class Test05_BuyerTest {

	public static void main(String[] args) {
		/*
		 * 상품 구매 관련 프로그램
		 * >종합예제. 잘분석하자.
		 */

		
		//상품 진열하기
		SmartTV tv=new SmartTV();
		Notebook note=new Notebook();
		MobilePhone phone=new MobilePhone();
		
		
		//상품 구매하기
		Buyer kim=new Buyer();
		kim.buy(tv);

		kim.buy(note);

		kim.buy(phone);
		
		//상품 구매 내역 출력하기
		kim.disp();
		
		
		
		System.out.println("-----------------반품");
		kim.refund(phone);
		kim.disp();
			
		
		
		
		
		
	}//main

}//class
