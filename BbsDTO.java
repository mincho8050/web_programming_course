package oop0604;

public class BbsDTO { 	//getter 와 setter함수가 있는걸 DTO라고 함.
						//DTO에서의 멤버변수는 private로 대부분함. 
						//이때 함수의 도움을 받아 연결시키는데. 
						//값을 줄떄는 set, 가져올때는 get을 이용해 함수를 만든다.

	private String uid;			//글쓴 아이디
	private String upw;			//글 비번
	private String subject;		//글 제목
	private String content;		//글 내용
	private int readcnt;		//조회수
	

	public BbsDTO(){}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getUpw() {
		return upw;
	}


	public void setUpw(String upw) {
		this.upw = upw;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	@Override
	public String toString() {
		return "BbsDTO [uid=" + uid + ", upw=" + upw + ", subject=" + subject
				+ ", content=" + content + ", readcnt=" + readcnt + "]";
	}//toString 에러잡는 용도로 함.
	
	
	
	
	
	
}//class
