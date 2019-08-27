

# request 내부객체의 다양한 메소드





## 입력 파일

```jsp
<body>

	<form action="09_requestok.jsp">
	아이디:<input type="text" name="uid">
	<br>
	<input type="submit" value="request내부객체">
	</form>

</body>
```





## 결과 파일

톰캣 IPv4 지정하기

> IP주소 6자리 -> 4자리변경

이클립스 -> Run -> Run Configurations -> Tomcat Server -> (x)=Arguments -> VM arguemnts에 아래와 같이 추가 -> 공백1칸 주고 -Djava.net.preferIPv4Stack=true  -> Apply



### 1) 한글 인코딩

> UTF-8 : 조합형
>
> EUC-KR : 완성형,MS949
>
> > 대소문자 구분 없음

```jsp
<%
request.setCharacterEncoding("UTF-8");
%>
```



### 2) 사용자가 입력한 정보 가져오기

> name 이름 가져오기

```jsp
<%
out.println(request.getParameter("uid"));
%>
```





### 3) 요청한 사용자의 다양한 정보

```jsp
<%
out.println(request.getRemoteAddr()); //요청한 pc의 ip 정보
out.println(request.getRemoteHost()); //host의 ip
out.println(request.getRemotePort()); //port번호
%>
```

```jsp
<%
	out.println(request.getContextPath());	//a
	out.println(request.getRequestURI());	//b
	out.println(request.getRequestURL()); 	//c
%>
```

> 결과값!! 중요!!
>
> a) 해당 프로젝트 이름
>
> > /basicWeb
>
> b) 사용자가 요청한 명령어만
>
> > /basicWeb/basic/09_requestok.jsp
>
> c) 사용자가 요청한 명령어 전체
>
> > http://localhost:8090/basicWeb/basic/09_requestok.jsp

```jsp
<%
//둘 다 같은 의미
out.println(request.getRealPath("/basic"));		
out.println(application.getRealPath("/basic")); 
%>
```

> 내 컴퓨터 입장에서 basic 폴더의 실제 물리적 경로
>
> > 아래 경우는 이클립스에서 톰캣서버를 실행한 경우
>
> d:\\
>
> > D:\\java0514\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\basicWeb\\basic

```jsp
<%
request.setAttribute("user", "korea");
//내부변수의 리턴형은 Object이므로 형변환해서 사용한다
Object obj=request.getAttribute("user"); 
String str=(String)obj;
out.println(str);
%>
```

> 내부변수
>
> > request.setAttribute("변수명",값);
> > request.getAttribute("변수명");





------





# 성적입력 및 출력, 테이블에 저장

성적테이블을 만들어 (SQL문) 사용자에게 입력을 받고 출력하기

**[성적테이블 CRUD]**

sungjukForm.jsp : 	성적쓰기 	->	 sungjukIns.jsp 

sungjukList.jsp	 : 	성적목록 	--(sno 넘겨주기)--> 	sungjukRead.jsp 상세보기페이지 	

-> 수정(sungjukUpdate.jsp) / 삭제(sungjukDel.jsp)

- 연결고리가 생기는 거지 각각 독립적인 페이지
- 상세보기, 수정, 삭제 페이지는 PRIMARY KEY가 와야함. (이번 테이블에서는 sno)

**[페이지 이동]**

- \<a href=""\>\</a\> : 무조건 get 방식
- location.href=""
- \<form action=""\>



## 성적테이블 작성(sungjuk.sql)

이클립스에서도 .sql을 만들 수 있다. 단, 실행은 cmd -> sqlplus 나 developer를 통해서 실행한다.

사용자에게 입력받을 만한 컬럼은 uname, kor, eng, mat, addr 정도이다. 

입력폼은 5개 정도 필요하다

```sql
--성적테이블 삭제
DROP TABLE sungjuk;

--성적테이블 생성
CREATE TABLE sungjuk (
    sno NUMBER NOT NULL 
    ,uname VARCHAR(20)
    ,kor INT NOT NULL 
    ,eng INT NOT NULL 
    ,mat INT NOT NULL 
    ,aver INT
    ,addr VARCHAR(50)
    ,wdate DATE 
);

--모든 행 삭제
DELETE FROM sungjuk;

--행 갯수
SELECT COUNT(*) FROM sungjuk;
```

> 기존에 테이블이 있었다면 삭제한다. (DROP TABLE sungjuk;) 그리고 행을 삭제하고 행 갯수가 0이어야 한다.





## 성적 입력 폼(sungjukForm.jsp)

이름, 국어, 영어, 수학, 주소를 입력받을 폼이다.

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







## 성적 출력 (sungjukIns.jsp)

```java
String url="jdbc:oracle:thin:@localhost:1521:xe"; //오라클 서버 어디에 있는지.
String user="java0514";
String password="1234";	
String driver="oracle.jdbc.driver.OracleDriver";
```

> 이렇게 변수에 저장해서 쓰는게 편하지만 이번 실습에서는 저장하지 않고 바로 사용했다.

```java
<body>

	<h1>*성적 결과*</h1>
	
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	
	<%
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//입력정보 가져와서 변수에 담기
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	
	//평균 구하기
	int aver=(kor+eng+mat)/3;
	
	//출력
	out.println("이름:"+uname+"<hr>");
	out.println("국어:"+kor+"<hr>");
	out.println("영어:"+eng+"<hr>");
	out.println("수학:"+mat+"<hr>");
	out.println("평균:"+aver+"<hr>");
	out.println("주소:"+addr+"<hr>");
	out.println("요청IP:"+request.getRemoteAddr()+"<hr>");
	
	//Oracle DB 저장 ------------------------------------------------------------
	try{
		
		//1)Oracle 드라이버 (oracle6.jar)
		//WEB-INF -> lib 폴더에 넣기
		Class.forName("oracle.jdbc.OracleDriver");
		
		//2)Oracle DB 연결
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		
		
		//3)SQL문작성
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
		int cnt=pstmt.executeUpdate();
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
		
		
	}catch(Exception e){
		out.println("실패!!"+e);
	}//try
	
	%>


</body>
```







## 저장된 성적 리스트 불러오기(sungjukList.jsp)



```java
<body>
	<h1>*성적 목록*</h1>
	
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>등록일</th>
		</tr>
		<%
		try{
			
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe"
					,"java0514"
					,"1234");
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno,uname,kor,eng,mat,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY wdate DESC ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){ //cursor가 있는지?
				do{
		%>	<!-- 첫번째 스크립트릿끝.  -->		
					<tr>
						<!-- sno를 불러내는데 위에있는 select문에서 sno가 없으면 오류 -->
						<td><a href='sungjukRead.jsp?sno=<%=rs.getInt("sno")%>'><%=rs.getString("uname")%></a></td>
						<td><%=rs.getInt("kor")%></td>
						<td><%=rs.getInt("eng")%></td>
						<td><%=rs.getInt("mat")%></td>
						<td><%=rs.getString("wdate").substring(0,10)%></td>
					</tr>
		<!-- 두 번째 스크립트릿 시작 -->
		<%		
				}while(rs.next());
				
			}else{
				out.println("<tr>");
				out.println("	<td colspan='5'>글없음!</td>");
				out.println("</tr>");
			}//if
			
		}catch(Exception e){
			out.println("실패: "+e);
		}//try
		%>
		
	</table>

</body>
```







## 상세보기 페이지 (sungjukRead.jsp)

SQL문

```sql
--상세보기
SELECT *
FROM sungjuk
WHERE sno=2;
```



```java
<body>
	<h1>*성적 상세보기*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	<%
	/* sungjukList.jsp에서 넘긴 sno값 */
	int sno=Integer.parseInt(request.getParameter("sno"));
	//out.println(sno);
	try{
		//DB연결은 반복적인 작업은 클래스로 만들어 함수화 시킨다
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno,uname,kor,eng,mat,aver,addr,wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
        
		ResultSet rs=pstmt.executeQuery();
		//sungjukList.jsp와의 차이는 반복문의 차이. sungjukRead.jsp는 하나만 불러오기 때문에
		if(rs.next()){ //cursor가 있는지
		%>
		<!-- 테이블 만들기 위해 스크립트릿을 나눔/body 부분 활성화 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td><%=rs.getString("uname") %></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><%=rs.getInt("kor") %></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><%=rs.getInt("eng") %></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><%=rs.getInt("mat") %></td>
			</tr>
			<tr>
				<th>평균</th>
				<td><%=rs.getInt("aver") %></td>
			</tr>
			<tr>
				<th>주소</th>
				<% 
				/* 주소를 한글로 출력 */
				String addr=rs.getString("addr");
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
				<td><%=rs.getString("wdate").substring(0,10) %></td>
			</tr>
		</table>
        <!-- sno은 위에서 담은 변수! 페이지는 독립적이지만 변수로 연결된다 -->
		<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>
		&nbsp;&nbsp;
		<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>	
		<%		
		}else{
			out.print("해당 글 없음!");
		}

		
	}catch(Exception e){
		out.println("실패: "+e);
	}//try
	
	%>
</body>
```





## 공통 페이지(ssi.jsp)

보통 공통적으로 들어가는 코드들을 작성한다.

```java
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
//sql.jsp 공통으로 사용할 코드 작성
request.setCharacterEncoding("UTF-8");//인코딩
%>
```





## 삭제 페이지(sungjukDel.jsp)

다른 페이지와 다르게 공통페이지를 연결한다.

```JSP
<%@include file="ssi.jsp"%>
```



```java
<body>
	<h1>*성적 삭제*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" DELETE FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		int cnt=pstmt.executeUpdate();
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
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>

</body>
```













## 수정 페이지1 (sungjukUpdate.jsp)

SQL문

```sql
--행수정
--내가 입력한것만 수정되도록 / 평균도 수정되도록!(입력하진 않았지만)
UPDATE sungjuk
SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?
WHERE sno=?;
```

수정하고자 하는 행을 가져와서	-> SELECT문 (sungjukRead.jsp문 참조)

 폼에 출력하고 -> sungjukForm.jsp 참조

해당 데이터를 수정한다.	-> UPDATE문

그래서 수정 페이지는 2개 필요함 (sungjungUpdateProc.jsp)

```java
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		//수정은 SELECT 명령어가 사전에 실행되어야 한다.
		//수정하고자 하는 행을 가져와서 폼에 출력하고 해당 데이터를 수정한다.
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno,uname,kor,eng,mat,addr ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
	 %>
	 <!-- 
	 action으로 자료가 넘어갈 때는 form이 넘어감. sno이 있긴 하지만
	 form요소 안에는 sno이 없음. 이때 form형식 중에 hidden이 있다. 
	 이걸로 보이지는 않지만 자료를 넘길 때 사용한다
	  -->
	 <form method="post" action="sungjukUpdateProc.jsp">
	 	<input type="hidden" name="sno" value="<%=sno%>">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
				<!-- value값은 가지고있는 값을 화면상에 표시 / 원래 저장된 값이 보이기 위해 -->
					<input type="text" name="uname" value="<%=rs.getString("uname") %>" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" value="<%=rs.getInt("kor") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" value="<%=rs.getInt("eng") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" value="<%=rs.getInt("mat") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
			<%
			//저장된 주소가 selected 하도록 일단 이름이 기니까 변수에 저장
			String addr=rs.getString("addr");
			%>
					<select name="addr">
						<option value="Seoul" <%if(addr.equals("Seoul")){out.println("selected");} %>>서울</option>
						<option value="Jeju" <%if(addr.equals("Jeju")){out.println("selected");} %>>제주</option>
						<option value="Busan" <%if(addr.equals("Busan")){out.println("selected");} %>>부산</option>
						<option value="Suwon" <%if(addr.equals("Suwon")){out.println("selected");} %>>수원</option>
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
		}else{
			out.print("해당 글 없음!");
		}
		
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>

</body>
```





## 수정페이지2 (sungjukUpdateProc.jsp)



```java
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	
	<% 
	int sno=Integer.parseInt(request.getParameter("sno"));
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		
		StringBuilder sql=new StringBuilder();
		sql.append(" UPDATE sungjuk ");
		sql.append(" SET uname=?,kor=?,eng=?,mat=?,aver=?,addr=? ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, uname);
		pstmt.setInt(2, kor);
		pstmt.setInt(3, eng);
		pstmt.setInt(4, mat);
		pstmt.setInt(5, aver);
		pstmt.setString(6, addr);
		pstmt.setInt(7, sno);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>성적 수정이 실패했습니다.</p>");
			out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
			//>javascript:history.back() -> 뒤로 가겠다는 것.
		}else{
			out.println("<script>");
			out.println("	alert('성적이 수정이 완료되었습니다.');");
			out.println("	location.href='sungjukList.jsp';");//목록페이지이동
			out.println("</script>");
		}//if
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>

</body>
```

