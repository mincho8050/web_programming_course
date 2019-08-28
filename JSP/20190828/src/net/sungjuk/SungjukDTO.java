package net.sungjuk;

public class SungjukDTO {
	//Data Transfer Object 데이터 전송 객체
	//Value Object
	//SungjukVO, SungjukDataBean 라고도 쓰임
	//테이블의 칼럼과 1:1 매칭되는 field를
	//private 접근제어로 선언하고
	//getter, setter함수를 작성한다
	private int sno;
	private String uname;
	private int kor;
	private int eng;
	private int mat;
	private int aver;
	private String addr;
	private String wdate;
	
	//default constructor
	public SungjukDTO(){}//SungjukDTO
	
	
	
	//각 field에 접근할 수 있는 getter, setter함수
	//>Source -> Generate Getters and Setters... -> 자동추가
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getAver() {
		return aver;
	}

	public void setAver(int aver) {
		this.aver = aver;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	//개발자들이 에러 확인용으로 주로 사용
	//Source -> Generate toSting()...
	@Override
	public String toString() {
		return "SungjukDTO [sno=" + sno + ", uname=" + uname + ", kor=" + kor
				+ ", eng=" + eng + ", mat=" + mat + ", aver=" + aver
				+ ", addr=" + addr + ", wdate=" + wdate + "]";
	}
	
	
	
	
	
	
}//
