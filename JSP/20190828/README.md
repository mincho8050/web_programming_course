# Java Beans 개요





## 1) 자바 웹페이지의 개발방식의 흐름

servlet(.java)  -> jsp  -> servlet(.java)



## 2) 서블릿의 이해



**서블릿을 이용한 구성**

- 자바로 개발된 .class 파일
- JSP에 비하여 컴파일 단계가 생략되기 때문에 속도가 빠르다.
- 서블릿의 단점 : 디자인 부분과 혼합하여 작업하기가 매우 어렵다.

**JSP(Java Server Page)를 이용한 구성**

- .jsp 파일
- Servlet의 불편한 디자인 부분을 좀더 간결하게 제작하도록 개선된 서버 스크립트
- 하나의 JSP페이지에는 HTML, CSS, JavaScript, Java Code등이 혼합되어 코딩이 이루어 진다.
- 유지보수 및 보안 문제, 기능 확장이 어려워 개발시 JSP와 Beans로 분리한다.

**. JSP + Beans 를 이용한 구성**

- .jsp + .java 파일로 구성
- BEANS는 콤포넌트 자바 개발자가 Business Logic(Process Logic)를 구현하는 목적으로 사용된다.
- DB관련해서 INSERT, UPDATE, DELETE, SELECT등 구현시 주로 사용한다.





## 3) Beans의 이해

- jsp페이지에 나열되는 자바 처리로직은 디자인 코드와 함께 매우 복잡한 코드를 구성한다.
  이로인해 디자인 변경시 자바코드가 영향을 받아 오류가 자주 발생되며, 
  코드 수정시 코드를 알아볼 수 없어 유지보수가 어렵다.
  또한 작업 도중 자바 코드가 JSP 페이지에 반복적으로 사용될 수 있으며,
  코드의 노출로 저작권등 보안에 심각한 문제가 발생된다.
  이러한 반복되는 자바 코드들을 JAVA파일안에 저장하여 사용하는 형태를 빈즈라고 한다.



- 데이터를 출력하는 레이어와 데이터를 처리하는 레이어를 분리(Manager, Process class)하여
  유지보수 시간을 단축 시키 수 있으며 코드의 가독성을 높일 수 있다. 

- 확장자는 *.java 이며 컴파일해서 .class형태로 배포한다.

- 빈즈는 dll과 같은 원리를 가지고 있다.

- 빈즈의 종류

  DTO(Data Transfer Object) class 
  Manager(Process) class
  DAO(Data Access Object) class







------





# Beans 테스트1 - 계산기





## 계산기(computerForm.jsp)



```html
<body>
	<h1>* 계산기 *</h1>
	<!-- 1) JSP 메소드를 통한 계산기 실습
		<form action="computerok1.jsp">
	 -->
	 
	 <!-- 2) new 연산자
	<form action="computerok2.jsp">
	 -->
	 
    <!-- 3) beans 이용-->
	 <form action="computerok3.jsp">
	<table border="1">
		<tr>
			<th>숫자1</th>
			<td><input type="number" name="num1" size="5" autofocus></td>
		</tr>
		<tr>
			<th>숫자2</th>
			<td><input type="number" name="num2" size="5"></td>
		</tr>
		<tr>
			<td colspan="2" class="subbtn">
				<input type="submit" value="계산">
			</td>
		</tr>
	</table>
	</form>

</body>
```







## 1) JSP 메소드를 이용 (computerok1.jsp)



```java
<body>
	<h1>* 계산결과 *</h1>
	<h2>1) JSP 메소드 호출</h2>
	
	<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	out.print(num1+"+"+num2+"="+add(num1,num2));
	out.print("<hr>");
	out.print(num1+"-"+num2+"="+sub(num1,num2));
	out.print("<hr>");
	out.print(num1+"*"+num2+"="+mul(num1,num2));
	out.print("<hr>");
	out.print(num1+"/"+num2+"="+div(num1,num2));
	out.print("<hr>");
	out.print(num1+"%"+num2+"="+mod(num1,num2));
	out.print("<hr>");
	%>
	
	
	<%!
	//JSP 메소드 작성 영역--------------------------------------
	public int add(int a, int b){return a+b;}
	public int sub(int a, int b){return a-b;}
	public int mul(int a, int b){return a*b;}
	public int div(int a, int b){return a/b;}
	public int mod(int a, int b){return a%b;}
	%>

</body>
```







## 2) new 연산자 (computerok2.jsp)

Compute.java 클래스를 만든다

```java
package net.testbean;
public class Compute {
	
	public int add(int a, int b){return a+b;}
	public int sub(int a, int b){return a-b;}
	public int mul(int a, int b){return a*b;}
	public int div(int a, int b){return a/b;}
	public int mod(int a, int b){return a%b;}
	
}
```

new 연산자를 이용해 불러온다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.testbean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computerok2.jsp</title>
</head>
<body>
	<h1>* 계산 결과 *</h1>
	<h2>2) new연산자를 이용해서 객체 생성 후 메소드 호출</h2>
	
	<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	/*
	객체 new Compute()
	->RAM의 heap영역에 메모리가 할당되고 주소값이 발생
	참조변수 comp
	*/
	
	Compute comp=new Compute();
	out.print(num1+"+"+num2+"="+comp.add(num1,num2));
	out.print("<hr>");
	out.print(num1+"-"+num2+"="+comp.sub(num1,num2));
	out.print("<hr>");
	out.print(num1+"*"+num2+"="+comp.mul(num1,num2));
	out.print("<hr>");
	out.print(num1+"/"+num2+"="+comp.div(num1,num2));
	out.print("<hr>");
	out.print(num1+"%"+num2+"="+comp.mod(num1,num2));
	out.print("<hr>");
	%>

</body>
</html>
```







## 3) beans 이용 (computerok3.jsp)

위와 동일하게 Compute.java 클래스를 만들어 불러온다.

**Java Bean(객체) 생성**

```jsp
<jsp:useBean id="객체명" class="팩키지명.클래스명" scope="page">    
```

**Java Bean(id)의 유효범위**

- scope="page" : 현재페이지에서만 유효, 생략 시 기본값
- scope="request" : 다른페이지에서 공유
- scope="session" : 다른페이지에서 공유
- scope="application" : 다른페이지에서 공유

**[주의사항]**

Java Bean(id)가 제대로 생성 안될 수도 있다.

-> 해당프로젝트를 Refresh , Validate, Project -> Clean 해주기

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.testbean.*"%>
<jsp:useBean id="comp" class="net.testbean.Compute" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computerok3.jsp</title>
</head>
<body>	
	<h1>* 계산 결과 *</h1>
	<h2>3) Java Bean을 이용해서 객체 생성 후 메소드 호출</h2>

	
	<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());

	out.print(num1+"+"+num2+"="+comp.add(num1,num2));
	out.print("<hr>");
	out.print(num1+"-"+num2+"="+comp.sub(num1,num2));
	out.print("<hr>");
	out.print(num1+"*"+num2+"="+comp.mul(num1,num2));
	out.print("<hr>");
	out.print(num1+"/"+num2+"="+comp.div(num1,num2));
	out.print("<hr>");
	out.print(num1+"%"+num2+"="+comp.mod(num1,num2));
	out.print("<hr>");
	%>

</body>
</html>
```







------







# Beans 테스트2 - 절대값, 팩토리얼





## 절대값,팩토리얼 입력(calcForm.jsp)



```html
<body>
	<h1>* 절대값/팩토리얼 *</h1>
	
	<form action="calcok.jsp">
	<table border="1">
		<tr>
			<th>숫자</th>
			<td><input type="number" name="num1" size="5" autofocus></td>
		</tr>
		<tr>
			<td colspan="2" class="subbtn">
				<input type="submit" value="계산">
			</td>
		</tr>
	</table>
	</form>

</body>
```







## 결과 창 (calcok.jsp)

CalcBean.java 클래스를 만든다.

> package째 복사해서 src에 붙여넣으면 자동으로 생성

```java
package net.testbean;

public class CalcBean {

  public int abs(int su){
    // 절대값 구하기(무조건 양수 출력)
    if(su<0)
      return -su;
    else
      return su;

}

  public int fact(int su){
    // 팩토리얼값 구하기 4*3*2*1
    return (su==0) ? 1 : su*fact(su-1);    
  }

}
```

만든 CalcBean.java 클래스를 불러온다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.testbean.*" %>
<jsp:useBean id="calc" class="net.testbean.CalcBean" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calcok.jsp</title>
</head>
<body>
	<h1>* Java Bean 이용한 계산 결과 *</h1>
	
	<%
	int su=Integer.parseInt(request.getParameter("num1"));
	out.print(su+" 절대값: "+calc.abs(su));
	out.print("<hr>");
	out.print(su+" 팩토리얼: "+calc.fact(su));
	%>
</body>
</html>

```









------





# Beans를 이용한 성적테이블





## 성적 입력폼(sungjukForm.jsp)



```html
<body>

	<h1>*성적 입력 폼*</h1>
	
	<p><a href="sungjukList.jsp">[성적목록]</a></p>
	
	<form method="post" action="sungjukIns.jsp">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="uname" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="addr">
						<option value="Seoul">서울</option>
						<option value="Jeju">제주</option>
						<option value="Busan">부산</option>
						<option value="Suwon">수원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>

</body>

```





## 데이터베이스 클래스

보안을 위해 따로 데이터베이스를 불러오는 코드는 클래스로 만든다.

DBOpen.java 와 DBClose.java 클래스를 만든다.(이번은 DBOpen.java만 사용)

**DBOpen.java**

```java
package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		return con;
	}//getConnection
	
	
	
}//

```





## 성적 결과 폼(sungjukIns.jsp)

SungjukDAO.java , SungjukDTO.java 클래스를 만든다.



**성적 결과창**

sungjukDAO.java , sungjukDTO.java는 net.sungjuk 위치에 있고 이걸 불러와야 한다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukIns.jsp</title>
<style>
	.btn2{
	  text-decoration: none;
      display:inline-block;
      padding:1px 5px 1px 5px;
      border-radius: 8px;
      border:1px solid white;
	}
	.btn2:hover{
		color:black !important;
		background-color: #d9f2e6;
	}
</style>
</head>
<body>
	<h1>*성적 결과*</h1>
	<p><a href="sungjukForm.jsp" class="btn2">성적쓰기</a></p>
	<%
	request.setCharacterEncoding("UTF-8");
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	//1) dto객체를 사용하기 전
	//int cnt=dao.insert(uname, kor, eng, mat, aver, addr);
	
	//2)dto객체를 사용한 경우
	//->전달값을 모두 dto객체에 담기
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt=dao.insert(dto);
	if(cnt==0){
		out.println("<p>성적 입력이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('성적이 입력되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지이동
		out.println("</script>");
	}//if
	
	%>
</body>
</html>

```



### **DAO (Data Access Object)**

- Insert, delete, update, select등 레코드 처리를 주 목적으로 한다.
- DTO 객체를 데이터베이스 서버에 저장한다.
- 데이터베이스 서버로 부터 레코드를 SELECT한 후, DTO 객체로 변경해 가져온다.
- SQL을 직접 실행하는 기능을 가지고 있다.
- JSP에서 데이터베이스 접속 로직을 Beans로 작성하여 DB정보 변경시 쉽게 변경사항을 구현할 수 있다.
- 데이터 접근을 목적하는 객체이다.
- 커넥션 같은 것을 하나만 두고 여러 사용자가 DAO의 인터페이스를 사용하여 필요한 자료에 접근 하도록 하는 것
- DB를 사용해 데이터를 조회하거나 조작하는 기능을 전담하도록 만든 오브젝트를 말한다.



**SungjukDAO.java클래스의 insert()**

```java
package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;

import net.utility.*; //DB

public class SungjukDAO {
		public int insert(String uname, int kor, int eng, int mat, int aver, String addr){
		
		int cnt=0;
		
		try{
			//DB연결
			Connection con=DBOpen.getConnection();
			
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno,uname,kor,eng,mat,aver,addr,wdate) ");
			sql.append(" VALUES((SELECT NVL(MAX(sno),0)+1 FROM sungjuk) ");
			sql.append(" ,?,?,?,?,?,?,SYSDATE)");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uname);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, mat);
			pstmt.setInt(5, aver);
			pstmt.setString(6, addr);
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
		
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		
		return cnt;
		
	}//insert
	
	//dto객체를 사용한 insert함수
	public int insert(SungjukDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno,uname,kor,eng,mat,aver,addr,wdate) ");
			sql.append(" VALUES((SELECT NVL(MAX(sno),0)+1 FROM sungjuk) ");
			sql.append(" ,?,?,?,?,?,?,SYSDATE)");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//insert

}//

```



### **DTO (Data Transfer Object) 데이터 전송 객체**

- 사용자가 입력한 값을 객체형태로 받을수 있게 클래스를 구성한다
- 폼에서 입력된 데이터들은 하나의 DTO 객체로 변환 될 수 있다.
- 하나의 데이터베이스 레코드를 저장하며 레코드와 같은 구조를 가지고 있다.
- 레코드가 50개이면 DTO 객체도 50개가 만들어 진다. 
- 한개의 레코드는 빈즈 클래스 객체 하나로 매핑된다.
- 한개의 컬럼은 멤버 변수로 매핑된다.
- 데이터가 포함된 객체를 한 시스템에서 다른 시스템으로 전달하는 작업을 처리하는 객체이다.
- DTO는 VO로 바꿔 말할 수 있는데 계층간 데이터 교환을 위한 자바빈즈를 말한다.
  - SungjukVO (Value Object) , SungjukDataBean 라고도 쓰임
- 테이블의 칼럼과 1:1 매칭되는 field를 private 접근제어로 선언하고 getter, setter함수를 작성한다



**SungjukDTO.java 클래스**

```java
package net.sungjuk;

public class SungjukDTO {

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

```







## 성적 목록 (sungjukList.jsp)



```java
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
</head>
<body>
	<h1>* 성적 목록 *</h1>
	
	<p><a href="sungjukForm.jsp" class="btn2">성적쓰기</a></p>
	
	<table border="1">
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	</tr>

	<%
	  //전체목록 
	  ArrayList<SungjukDTO> list = dao.list();
	  if(list==null){
	      out.println("<tr>");
	      out.println("  <td colspan='5'>글없음!!</td>");
	      out.println("</tr>");
	  }else{
	      for(int idx=0; idx<list.size(); idx++) {
	          dto=list.get(idx);   
	%>
			  <tr>
			    <td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>" class="btn3"><%=dto.getUname()%></a></td>
			    <td><%=dto.getKor()%></td>
			    <td><%=dto.getEng()%></td>
			    <td><%=dto.getMat()%></td>
			    <td><%=dto.getWdate().substring(0,10)%></td>
			  </tr>
	<%          
	      }//for end
	  }//if end
	%>  
	</table>
</body>
</html>

```



**sungjukDAO.java클래스의 list()**

```java
public class SungjukDAO{
    
    public ArrayList<SungjukDTO> list(){
		//DB에서 가져온 데이터를 list에서 모아서
		//sungjukList.jsp에 전달한다.
		ArrayList<SungjukDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno,uname,kor,eng,mat,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY wdate DESC ");
			
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<SungjukDTO>(); //전체저장
				do{
					SungjukDTO dto=new SungjukDTO(); //한줄저장
					dto.setSno(rs.getInt("sno"));
					dto.setUname(rs.getString("uname"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setWdate(rs.getString("wdate"));
					list.add(dto);
				}while(rs.next());//do~while
				
			}else{
				//이걸 넣지 않아도 되지만, 그래도 넣어주는게 좋음.
				list=null;
			}//if
			
		}catch(Exception e){
			System.out.println("목록실패 : "+e);
		}
		
		return list;
	}//list 
}

```







## 성적 상세보기 (sungjukRead.jsp)



```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukRead.jsp</title>
</head>
<body>
	<h1>* 성적 상세보기 *</h1>
	<p>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);  
	//리턴형은 SungjukDTO -> 위에서 id를 dto라고 해서 사용
	//함수명 read() , 매개변수 sno
	if(dto==null){
		out.print("해당글 없음!!");	
	}else{
	%>
	
	<table border="1">
	<tr>
		<th>이름</th> 
		<td><%=dto.getUname() %></td>
	</tr>
	<tr> 
		<th>국어</th> 
		<td><%=dto.getKor() %></td>
	</tr>
	<tr>
		<th>영어</th> 
		<td><%=dto.getEng() %></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><%=dto.getMat() %></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=dto.getAver() %></td>
	</tr>
	<tr>
		<th>주소</th>
	<% 
		/* 주소를 한글로 출력 */
		String addr=dto.getAddr().toString();
		if(addr.equals("Seoul")){
			addr="서울";
		}else if(addr.equals("Busan")){
			addr="부산";
		}else if(addr.equals("Jeju")){
			addr="제주";
		}else{
			addr="수원";
		}//if
	%>
		<td><%=addr %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getWdate().substring(0,10) %></td>
	</tr>
	</table>
	<!-- sno은 위에서 담은 변수! 페이지는 독립적이지만 변수로 연결된다 -->
	<a href="sungjukUpdate.jsp?sno=<%=sno%>" class="btn">수정</a>
	&nbsp;&nbsp;
	<a href="sungjukDel.jsp?sno=<%=sno%>" class="btn">삭제</a>	
	<%
	}//if
	
	%>

</body>
</html>

```



**SungjukDAO.java클래스의 read()**

```java
public class SungjukDAO {
    public SungjukDTO read(int sno){
		SungjukDTO dto=null;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
			}else{
				dto=null;
			}//if
			
		}catch(Exception e){
			System.out.println("상세보기실패 : "+e);
		}//try
		
		return dto;
	};//read
}

```







## 성적 삭제 (sungjukDel.jsp)

위에서는 이렇게 직접 import를 했는데 이런 공통적인 부분은 따로 .jsp 파일로 묶어 그 파일 하나만 include 하는 형식으로 한다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO"></jsp:useBean>

```

**ssi.jsp**

> 한글변환은 모든 페이지의 공통부분이기 때문에 넣어준다.
>
> 만약 프로젝트시 공통부분은 이렇게 파일로 만들어 사용한다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sungjuk.*" %>

<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>

<%
	//ssi.jsp 공통페이지
	request.setCharacterEncoding("UTF-8");
%>

```



**sungjukDel.jsp**

> \<%@ include file="ssi.jsp" %\> 
>
> > 공통부분인 파일을 include 한 모습

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukDel.jsp</title>
</head>
<body>
	<h1>* 성적 삭제 *</h1>
	
	<p>
		<a href="sungjukList.jsp" class="btn2">[성적목록]</a>
		<a href="sungjukForm.jsp" class="btn2">[성적쓰기]</a>
	</p>
	
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	int cnt=dao.delete(sno); 
	if(cnt==0){
		out.println("<p>성적 삭제이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('성적이 삭제되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지이동
		out.println("</script>");
	}//if
	%>

</body>
</html>

```



**SungjukDAO.java클래스의 delete()**

```java
public class SungjukDAO {
    public int delete(int sno){
            int cnt=0;
            try{
                Connection con=DBOpen.getConnection();
                StringBuilder sql=new StringBuilder();
                sql.append(" DELETE FROM sungjuk ");
                sql.append(" WHERE sno=? ");

                PreparedStatement pstmt=con.prepareStatement(sql.toString());
                pstmt.setInt(1, sno);
                cnt=pstmt.executeUpdate();


            }catch(Exception e){
                System.out.println("삭제실패 : "+e);
            }//try

            return cnt;
        }//delete


        public int update(SungjukDTO dto){
            int cnt=0;
            try{
                Connection con=DBOpen.getConnection();
                StringBuilder sql=new StringBuilder();
                sql.append(" UPDATE sungjuk ");
                sql.append(" SET uname=?,kor=?,eng=?,mat=?,aver=?,addr=? ");
                sql.append(" WHERE sno=? ");

                //4)SQL문 변환
                PreparedStatement pstmt=null;
                pstmt=con.prepareStatement(sql.toString());
                pstmt.setString(1, dto.getUname());
                pstmt.setInt(2, dto.getKor());
                pstmt.setInt(3, dto.getEng());
                pstmt.setInt(4, dto.getMat());
                pstmt.setInt(5, dto.getAver());
                pstmt.setString(6, dto.getAddr());
                pstmt.setInt(7, dto.getSno());


                //5)SQL문 실행
                cnt=pstmt.executeUpdate();


            }catch(Exception e){
                System.out.println("행추가 실패"+e);
            }//try
            return cnt;
        }//insert
}

```











## 성적 수정1 (sungjukUpdate.jsp)

틀은 성적 입력과 동일하게 하는대신 SELECT를 통해 값이 보여야 하기 때문에

SungjukDAO클래스의 read() 함수를 불러와서 사용한다. (상세보여주기 페이지와 동일한 함수 사용)

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
	</p>
	
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);
	if(dto==null){
		out.print("해당글 없음!!");	
	}else{
	%>
	<form method="post" action="sungjukUpdateProc.jsp">
	 	<input type="hidden" name="sno" value="<%=sno%>">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
				<!-- value값은 가지고있는 값을 화면상에 표시 / 원래 저장된 값이 보이기 위해 -->
					<input type="text" name="uname" value="<%=dto.getUname() %>" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" value="<%=dto.getKor() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" value="<%=dto.getEng() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" value="<%=dto.getMat() %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="addr">
						<option value="Seoul" <%if(dto.getAddr().equals("Seoul")){out.println("selected");} %>>서울</option>
						<option value="Jeju" <%if(dto.getAddr().equals("Jeju")){out.println("selected");} %>>제주</option>
						<option value="Busan" <%if(dto.getAddr().equals("Busan")){out.println("selected");} %>>부산</option>
						<option value="Suwon" <%if(dto.getAddr().equals("Suwon")){out.println("selected");} %>>수원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<%
	}//if
	
	%>

</body>
</html>

```









## 성적 수정2 (sungjukUpdateProc.jsp)

성적 결과폼처럼 값을 받은 뒤 SungjukDAO 클래스에서 update() 함수를 받아 사용한다. 이때 수정이므로 INSERT와는 다른 점이 sno를 dto 객체에 담아야 한다.

> dto.setSno(sno); 

```java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukUpdateProc.jsp</title>
</head>
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno").trim());
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	//2)dto객체를 사용한 경우
	//->전달값을 모두 dto객체에 담기
	dto.setSno(sno);
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt=dao.update(dto);
	if(cnt==0){
		out.println("<p>성적 수정이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('성적이 수정되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지이동
		out.println("</script>");
	}//if
	
	%>
</body>
</html>

```





**SungjukDAO.java클래스의 update()**

```java
public class SungjukDAO {
    public int update(SungjukDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=?,kor=?,eng=?,mat=?,aver=?,addr=? ");
			sql.append(" WHERE sno=? ");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			pstmt.setInt(7, dto.getSno());
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//update
}

```











