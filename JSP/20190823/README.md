# JSP 내부객체

> 객체 Object

```
Sungjuk sj=new Sungjuk()
-> 클래스	    : Sungjuk
-> 객체		: new Sungjuk()
-> 참조변수	   : sj
-> 사용법	   : sj.disp()
```

> test.jsp -> text_jsp.java -> test_jsp.class
>
> > 근데 톰캣이 text_jsp.java -> test_jsp.class 과정을 해준다. (자동으로 만들어줌)
>
> text_jsp.java 경로
>
> >  D:\java0514\workspace\.metadata\.plugins
> > 	\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost

톰캣서버에 의해 자동으로 생성된 객체

개발자는 별도의 객체를 선언하지 않고 가져다 사용만 한다.

1. out : 본문(\<body\>)를 가리키는 출력객체 -> JspWriter out
2. request : 사용자가 요청한 정보를 관리 -> HttpServletRequest request (차지하는 비율이 큼, 제일 중요)
3. response : 요청한 사용자에게 응답 -> HttpServletResponse response
4. session : 요청한 사용자를 개발적으로 구분하기 위한 객체 -> HttpSession session 
5. application : 서버에 대한 정보를 관리하는 객체 -> ServletContext application
6. pageContext : JSP, JSTL, EL등 동일한 페이지 내에서 서로 다른 문법과 데이터를 교류할 수 있다.                              -> PageContext pageContext







## request 객체내부

계층구조

```
interface ServletRequest {} -> Superinterface

interface HttpServletRequest extends ServletRequest {}

class HttpServletRequestWrapper implements HttpServletRequest {}

HttpServletRequest request=new HttpServletRequestWrapper() -> 다형성
```









------





# form 기초



## 1) 입력

- \<form\>\</form\> : 사용자가 입력한 정보를 서버로 전송하기 위한 양식

- name : 폼 이름. 웹서버에서 접근

- id : 폼 아이디. 주로 JavaScript, jQuery에서 사용

- method : 폼 전송방식. get / post 방식

  ```
  [전송 방식]
  
  1) method="get" 방식 : 사용자가 요청한 정보가 URL 노출
  	- 생략가능
      - test.jsp?서버로전송되는값들
      - test.jsp?변수1=값1&변수2=값2&변수3=값3 ..	
      - 값이 그대로 노출되기 때문에 보안이 중요한 사이트는 사용하지 않음.
      - 예) 검색어
      
  2) method="post" 방식 : 사용자가 요청한 정보가 URL에 노출되지 않고 패키지화 되어서 서버로 전송
  	- 한글이 깨짐
  	- 예) 비번, 주민번호, 계좌번호 등
  ```

- action : 사용자가 요청한 정보를 서버가 받아서 처리할 결과페이지

- enctype : 폼에서 파일을 첨부해서 서버로 전송하고자 할 때

  - enctype 속성은 method="post"인 경우에만 사용할 수 있다.
  - 속성 : "multipart/form-data" 추가

> 06_form기초.jsp -> 부모, 결과입력 폼
>
> > 주소 : localhost:8090/basicWeb/basic/06_form기초.jsp

```jsp
<body>
    <h1>* 성적 입력 *</h1>
    <form name="sungkjukfrm"
          id="sungkjukfrm"
          method="post"
          action="06_formok.jsp">
        이름 :<input type="text" name="uname" id="uname" size="10" maxlength="10">
        <hr>
        국어 :<input type="number" name="kor" id="kor" size="5" min="0" max="100">
        <hr>
        영어 :<input type="number" name="eng" id="eng" size="5" min="0" max="100">
        <hr>
        수학 :<input type="number" name="mat" id="mat" size="5" min="0" max="100">
        <hr>
        <input type="submit" value="전송">
        <input type="reset" value="취소">
    </form>
</body>
```

![01](https://user-images.githubusercontent.com/49340180/63566490-5f909800-c5a8-11e9-90c7-330a48970304.PNG)







## 2) 결과

- request 내부 객체 : 사용자가 요청한 정보를 관리하는 객체

  - request.getParameter("") : 요청한 정보를 개별적으로 가져올 때

  ```
  예)
  <input type="number" name="kor">
  request.getParameter("kor") -> id가 아니라 name값 -> 리턴형은 String
  ```



> 06_formok.jsp -> 자식, 결과출력 
>
> 결과확인하려면 부모페이지를 run해야함
>
> > 주소 : localhost:8090/basicWeb/basic/06_formok.jsp?uname=가나다&kor=10&eng=80&mat=50
> >
> > > -> 06_formok.jsp?uname(변수1)=가나다(값1)&kor(변수2)=10(값2)&eng(변수3)=80(값1)&mat(변수4)=50(값4) -> method="get" 방식!!
> >
> > 주소 :localhost:8090/basicWeb/basic/06_formok.jsp -> 패키지화 되어서 값이 보이지 않음 -> "post" 방식
> >
> > 에러 [HTTP Status 404] : action에 있는 파일명이 다를 때

```jsp
<body>
	<h1>* 성적 결과 *</h1>
	<%
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>");
	%>
</body>
```

> 이렇게 하면 method="post" 방식일 때는 한글이 깨짐 ->  다시 조합해야함

**1) 한글 UTF-8 인코딩**

```jsp
<%
request.setCharacterEncoding("UTF-8");
%>
```

**2) 사용자가 입력 요청한 정보를 개별적으로 가져오기**

> \<input type="text" name="uname"\> 에서 가져오는 것
>
> getParameter() 리턴형이 String이라서 아무리 숫자를 입력해도 String으로 오기 때문에 재가공이 필요하다

```jsp
<%
// 한글 UTF-8 인코딩
request.setCharacterEncoding("UTF-8");

// 사용자가 입력 요청한 정보를 개별적으로 가져오기
String uname=request.getParameter("uname");
int kor=Integer.parseInt(request.getParameter("kor"));
int eng=Integer.parseInt(request.getParameter("eng"));
int mat=Integer.parseInt(request.getParameter("mat"));

// 평균 구하기
int aver=(kor+eng+mat)/3;

// 출력
out.println("이름"+uname+"<hr>");
out.println("국어"+kor+"<hr>");
out.println("영어"+eng+"<hr>");
out.println("수학"+mat+"<hr>");
out.println("평균"+aver+"<hr>");

%>
<!-- 성적결과 테이블에 출력 -->
<table border="1">
	<tr>
		<th>이름</th>
		<td><%=uname%></td>
	</tr>
	<tr>
		<th>국어</th>
		<td><%=kor%></td>
	</tr>
	<tr>
		<th>영어</th>
		<td><%=eng%></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><%=mat%></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=aver%></td>
	</tr>
</table>
```

![02](https://user-images.githubusercontent.com/49340180/63566491-5f909800-c5a8-11e9-860a-20f57e38bd36.PNG)





------







# 계산기 실습을 통한 form 연습





## 1) 계산기 입력폼 (07_calc.jsp)

form은 여러개 있어도 submit이 있는 form만 전송

```jsp
<body>
	<h1>* 계산 연습 *</h1>
	<form 
		name="calcfrm"
		method="get"
		action="07_calcok.jsp">
	첫 번째 수 : <input type="number" 
					  name="num1" 
					  min="0"
					  max="100"
					  required>
	<hr>
	연산자 : <input type="text"
				   name="op"
				   size="3"
				   required>
	<hr>
	두 번째 수 : <input type="number" 
					  name="num2" 
					  min="0"
					  max="100"
					  required>
	<hr>
	<input type="submit" value="계산">				  
	<input type="reset" value="취소">				  
	</form>
	
</body>
```







## 2) 계산기 출력 폼 (07_calcok.jsp)

사칙연산+나머지 연산자

```jsp
<%
//인코딩
request.setCharacterEncoding("UTF-8");
	
//사용자가 입력 요청한 정보 가져오기. -여기가 중요
int num1=Integer.parseInt(request.getParameter("num1"));
String op=request.getParameter("op");
int num2=Integer.parseInt(request.getParameter("num2"));

//if문
if(op.equals("+")){
    out.print("두 수의 합 : "+(num1+num2));
}else if(op.equals("-")){
    out.print("두 수의 차 : "+(num1-num2));
}else if(op.equals("*")){
    out.print("두 수의 곱 : "+(num1*num2));
}else if(op.equals("/")){
    out.print("두 수의 몫 : "+((double)num1/(double)num2));
}else{
    out.print("두 수의 나머지 : "+(num1%num2));
}

/* 
switch~case문
switch(op){
case "+":out.print("두 수의 합 : "+(num1+num2)); break;
case "-":out.print("두 수의 차 : "+(num1-num2)); break;
case "*":out.print("두 수의 곱 : "+(num1*num2)); break;
case "/":out.print("두 수의 몫 : "+((double)num1/(double)num2)); break;
case "%":out.print("두 수의 나머지 : "+(num1%num2)); break;
} */

%>
```

> 테이블에 출력하는 다른 방식

```jsp
<body>
    
<%
...
    
int result1=0;
double result2=0.0;

if(op.equals("+")){
    result1=num1+num2;
}else if(op.equals("-")){
    result1=num1-num2;
}else if(op.equals("*")){
    result1=num1*num2;
}else if(op.equals("/")){
    result2=(double)num1/num2;
}else{
    result1=num1%num2;
}

%>
<!-- 테이블 출력 -->
<table border="1">
<tr>
    <td><%=num1%></td>
    <td><%=op%></td>
    <td><%=num2%></td>
    <td>=</td>
    <td>
    <%
    if(op.equals("/")){
        out.print(result2);
    }else{
        out.print(result1);
    }
    %>
    </td>
</tr>
</table>
    
</body>
```







------







# 다양한 컨트롤 요소들





## 1) 입력



```jsp
<body>

	<h1>다양한 컨트롤 요소들</h1>
	<form action="08_ok.jsp">
		아이디 :<input type="text" name="uid">
		<hr>
		비번	:<input type="password" name="upw">
		<hr>
		이름 :<input type="text" name="uname">
		<hr>
		내용 :<textarea rows="5" cols="20" name="content"></textarea>
        <hr>
        <!-- a) name이 동일한 경우-->
		숫자1 : <input type="text" name="num"> <br>
		숫자2 : <input type="text" name="num"> <br>
		숫자3 : <input type="text" name="num"> <br>
        
        <!-- b) 라디오버튼 -->
        <hr>
		성별 : <input type="radio" name="gender" value="M">남
		  	  <input type="radio" name="gender" value="F">여
        
        <!-- c) 체크 박스 -->
        <hr>
		약관동의
		<input type="checkbox" name="agree" value="Y">
        <!-- c) value값이 없는 체크박스-->
        <hr>
		SMS : <input type="checkbox" name="sms">
        
        <!-- d) 목록 상자 -->
		<hr>
		통신 회사 : <select name="telecom">
					<option value="sk">SK
					<option value="lg">LG U+
					<option value="ktf">KTF
				  </select>
        
        <!-- e) hidden 속성 -->
        <!-- 폼요소지만 본문에 출력되지 않되는 속성  -->
		<input type="hidden" name="page" value="7">
        
        <!-- 
			f) 파일 첨부에 관한 속성
			주의 사항:<form enctype="multipart/form-data"> 추가해야함 
		-->
        <input type="file" name="attach">
        
        <input type="submit" value="전송">
	</form>

</body>
```









## 2) 입력 결과



```jsp
<body>
	
	<h1>*다양한 폼 컨트롤 요소 결과*</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	
	//trim() 공백제거
	String uid=request.getParameter("uid").trim();
	String upw=request.getParameter("upw").trim();
	String uname=request.getParameter("uname").trim();
	String content=request.getParameter("content").trim();
	
	out.print(uid+"<hr>");
	out.print(upw+"<hr>");
	out.print(uname+"<hr>");
	//<textarea>값은 엔터를 <br>로 치환해서 출력해야함!
    //그렇지않으면 엔터가 적용되지 않음
	content=content.replace("\n", "<br>");
	out.print(content+"<hr>");
	%>

</body>
```

> request객체에 존재하지 않는 정보를 가져오면 어떤 결과가 나오는지 확인하기.
>
> > null값이 반환

```jsp
<%
out.print(request.getParameter("kor"));
%>
```

![01](https://user-images.githubusercontent.com/49340180/63576453-2ddaf980-c5c7-11e9-99ac-f2323ca7e773.PNG)



### a) name이 동일한 경우

> getParameterValues() 은 리턴형이 String[] 1차 String 배열

```jsp
<%
String[] num=request.getParameterValues("num");
for(int i=0;i<num.length;i++){
    out.print(num[i]+"<br>");
}
%>
```





### b) 라디오 버튼

> 동시에 선택하지 않으려면 name을 동일하게 준다.
>
> 대체적으로 value값은 고정값으로 넘긴다.(사용자가 쓰는게 아니니까, 개발자가 설정하는 것)
>
> > 남자를 클릭하면 성별:M / 여자를 클릭하면 성별:F 로 넘어온다

```jsp
<%
out.print("성별:"+request.getParameter("gender"));
%>
```





### c) 체크 박스

> value값이 Y여서 체크하면 "Y" / 체크하지 않으면 null 값이 넘어온다
>
> > 체크박스도 대체적으로 value값을 넣는다.

```jsp
<%
out.print("약관동의:"+request.getParameter("agree"));
%>
```

value값이 없는 체크 박스

> 체크하면 on / 체크하지 않으면 null값이 넘어온다.

```jsp
<%
out.print("sms:"+request.getParameter("sms"));
%>
```





### d) 목록 상자

> 출력값은 value값으로 출력되는데, 되도록 선택하는 방식으로 자료를 넘겨야 쓰레기값을 덜 수 있다. 

```jsp
<%
out.print("통신회사:"+request.getParameter("telecom"));
%>
```





### e) hidden 속성

> 폼 요소지만 본문에 출력되지 않음. value값이 넘어온다. 
>
> 개발자는 많이 사용한다고 함

```jsp
<%
out.print("페이지:"+request.getParameter("page"));
%>
```





### f) 파일첨부에 관한 속성

>첨부파일 선택하면 파일명이 전송됨.
>
>파일이 전송된 것이 아니라 파일명!이 전송된 것임
>
>> 첨부된 파일을 가져오려면 다른 방식으로 request객체에 접근해야 한다!!!
>
>request.getParameter("attach")는 실제 파일을 가지고 있는 것이 아니라 파일명이 출력된 것이다.

```jsp
<%
out.print("첨부 파일:"+request.getParameter("attach"));
%>
```

