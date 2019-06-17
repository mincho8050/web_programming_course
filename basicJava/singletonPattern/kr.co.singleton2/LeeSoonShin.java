package kr.co.singleton2;

//싱글톤 클래스 설계
public class LeeSoonShin {

	private String name;
	private	int age;
	private String address;
	
	//1)객체를 외부에서 만들 수 없도록 생성자함수를 private속성으로 한다.
	private LeeSoonShin() {} //기본 생성자. private로 한다.
	private LeeSoonShin(String name, int age, String address) {
		this.name = name;
		this.age = age;
		this.address = address;
	}//멤버변수에 직접접근 차단.(private) getter,setter를 이용해 접근.
		
	//getter,setter 생성(외부와 연결된 통로)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public void info(){
		System.out.println(name);
		System.out.println(age);
		System.out.println(address);
	}
	
	
	//2)내부에서 객체하나를 만들어서 상수화
	//	> static final
	//static은 공유, continue
	private static final LeeSoonShin lss=new LeeSoonShin("이순산",50,"조선");
	
	//3) 2)에서 선언된 레퍼런스 변수(lss)에 대한 getter함수 만들기
	public static LeeSoonShin getLss(){
		return lss;
	}
	
	
	
	
	

}//class
