# JSP 기초 1

- JSP 페이지 디렉티브

```jsp
<%@ page	%>
<%@ include	%>
<%@ tagli	%>
```

- JSP 코드 주석 : Ctrl+Shift+/ (\<%-- --%\>) -> JSP코드 입력할 때는 이렇게 입력해야함(스크립스트릿주석)

```jsp
<%-- 	
 스크립스트릿 주석걸기
<%
	out.println("<style>.txt{color:red}</style>");
	out.println("<span class=txt>오필승코리아</span>");
%>
--%>
```

- 한글인코딩 : 완성형(MS949) : EUC-KR / 조합형 : UTF-8

```jsp
<%@ page %> 	디렉티브
contentType="" 	필수요소
import=""		자바패키지
```

> 예시

```jsp
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
```

- 스크립트릿(Scriptlet) : JSP코드 작성영역 -> \<% %\>

- .jsp 페이지에서 사용 가능한 문법

  - HTML tag
  - CSS : \<style\>\</style\>
  - JavaScript(jQuery) : \<script\>\</script\>
  - JSP : \<% %\>

- JSP하는 이유는 동적인 이미지.

  - HTML 에서는 1+3을 계산할 수 없기 떄문이다.

  - 자바스크립트는 그대로 노출되기 때문이다. (인터프리터언어)

> 웹페이지 소스

![01](https://user-images.githubusercontent.com/49340180/63483778-75cf2300-c4d8-11e9-9e5d-6bd5f82c1cdc.PNG)

> 이런식으로 JSP코드 소스는 보이지 않는다.

http://localhost:8090/basicWeb/basic/01_jsp기초문법.jsp 이라는 주소는 보이는 주소이고 물리적인 주소인

http://localhost:8090/WebContent/basic/01_jsp기초문법.jsp 로 접근하면 에러뜸 

WebContent는 외부에서 접근 불가능

- JSP 에서 HTML 태그를 사용하는 경우

```jsp
<body>
<%
	out.print("<h1>토끼</h1>");
 	out.print("<img src='../images/t04.jpg'>");
 	out.print("<hr>");
%>
</body>
```

- out.println();을 사용하는 이유

```jsp
<body>
<%
 	out.print("서울");
 	out.print("부산");
 	out.print("제주");
 	out.println("<br>");
 	out.println("개나리");
 	out.println("진달래");
 	out.println("라일락");
%>
</body>
```

> 화면상 노출

![01](https://user-images.githubusercontent.com/49340180/63485214-64d4e080-c4dd-11e9-9ebe-b721f0b1c01f.PNG)

> 페이지 소스보기에서의 화면
>
> 화면상 노출은 그냥 띄어쓰기인데 페이지소스에서는 한줄 띄어쓰기이다. 소스편집 하기 편하라고 쓰는 것.

![02](https://user-images.githubusercontent.com/49340180/63485216-656d7700-c4dd-11e9-9b62-581ee23a1d16.PNG)

- 스크립스트릿은 문서에 여러 번 가능하다.
- 스크립스트릿 안에서의 HTML, CSS 이런것들을 쓰면 페이지 소스에서 보이는데 그냥 JSP를 쓰면 소스가 보이지 않는다.



------





# JSP 기초 2

JSP 페이지의 지시자(Directive)



## 1) page 디렉티브

- \<%@ page   %\>

- \<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%\>
- language="java" : JSP 페이지의 스트립트에서 사용할 프로그래밍 언어. 생략가능
- contentType="text/html; 응답결과를 html문서 형식으로 생성해서 출력한다.
                    charset=UTF-8" 사용할 문자의 인코딩은 한글로 된 문서를 생성할 때는 UTF-8 사용한다.
- pageEncoding="UTF-8" : JSP페이지에서 사용하는 문자의 인코딩을 지정할때 사용한다.
                              charset=UTF-8 에서 지정했으면, 생략 가능하다

- \<%@ page contentType="text/html; charset=UTF-8" %\>

- \<%@ page import="java.util.*" %\>





## 2) include 디렉티브

- \<%@ include file="파일명" %\>
- 공통적으로 포함될 내용을 가진 파일을 해당 JSP페이지내에 삽입하는 기능을 제공한다.



## 3) taglib 디렉티브

- \<%@ taglib prefix="" uri=""%\>







------





# JSP 기초 3

자바문법과 거의 동일하다.



## 1) 단순 출력

```jsp
<body>
	<h1>성적프로그램</h1>
	
	<%
	
	String name="무궁화";
	int kor=80, eng=85, mat=90;
	int aver=(kor+eng+mat)/3;
	
	//1) 출력
	out.println("이름"+name+"<br>");
	out.println("국어"+kor+"<br>");
	out.println("영어"+eng+"<br>");
	out.println("수학"+mat+"<br>");
	out.println("평균"+aver+"<br>");
		
	%>
</body>
```





## 2) 테이블 표작성 출력

```jsp
<body>
    <%
    	out.println("<table border='1'>");
        out.println("<tr>");
        out.println("	<th>이름</th>");
        out.println("	<td>"+name+"</td>");
        out.println("<tr>");
        out.println("<tr>");
        out.println("	<th>국어</th>");
        out.println("	<td>"+kor+"</td>");
        out.println("<tr>");
        out.println("<tr>");
        out.println("	<th>영어</th>");
        out.println("	<td>"+eng+"</td>");
        out.println("<tr>");
        out.println("<tr>");
        out.println("	<th>수학</th>");
        out.println("	<td>"+mat+"</td>");
        out.println("<tr>");
        out.println("<tr>");
        out.println("	<th>평균</th>");
        out.println("	<td>"+aver+"</td>");
        out.println("<tr>");
        out.println("</table>");	
    %>
</body>
```





## 3) 표현식(Expression) 출력

out.print()의 단축키

\<% %\>밖에 쓴다.

> \<%out.print(값);%\> 의 요약형 <%=값%>
>
> ; 세미콜론 생략

```jsp
<body>
    <table border="1">
        <tr>
            <th>이름</th>
            <td><%out.print(name);%></td>
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
</body>
```





------



# JSP 기초 4

배열, 반복문, 조건문

성적프로그램을 기반으로 연습

> 계산식

```jsp
<body>
    
	<%
	String[] name={"아이린","슬기","조이","예리","웬디"};
	int[] kor={100,35,75,95,85};
	int[] eng={100,40,80,95,90};
	int[] mat={95,50,60,35,85};
	int[] aver=new int[5];
	int[] rank={1,1,1,1,1};
	int size=name.length;
	
	//1)평균 구하기
	for(int a=0;a<size;a++){
    	aver[a]=(kor[a]+eng[a]+mat[a])/3;   	
	}//for
	
	//2)등수 구하기(평균 구하기)
	for(int a=0;a<size;a++){
	    for(int b=0;b<size;b++){
	        if(aver[a]<aver[b]){
	            rank[a]++;
	        }
	    }
	}//for	
	%>
    
</body>
```

> 출력하기
>
> >  중간중간 스크립트릿을 중간에 넣어 계산이나 반복, 조건 이런게 필요한 부분부분에 넣어야 한다. HTML 을 동적이게 만들어 준다.

```jsp
<body>

	...

	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>평균</th>
			<th>등수</th>
			<th>결과</th>
			<th>장학여부</th>
		</tr>
		<%
			for(int idx=0; idx<size; idx++){
		%> 
		<!-- html공간 : 이렇게 중간중간 활성화를 시킬 수 있다.
			<tr></tr>이 다섯번 반복된다.
		-->
        <tr>
            <td><%=name[idx]%></td>
            <td><%=kor[idx]%></td>
            <td><%=eng[idx]%></td>
            <td><%=mat[idx]%></td>
            <td><%=aver[idx]%></td>
            <td><%=rank[idx]%></td>

            <td>
            <%
                //과락과목
                if(aver[idx]>=70){
                    if(kor[idx]<40||eng[idx]<40||mat[idx]<40){
                        out.print("재시험");
                    }else{
                        out.print("합격");
                    }		            
                }else{
                    out.print("불합격");
                }//if
                //10점당 별 한개씩
                for(int b=0;b<(aver[idx]/10);b++){
                    out.print("★");
                }//for
            %>
            </td>
            <td class="best">
                <%
                    //평균 95점 이상은 장학생 (글자는 진하고, 빨간색)
                    if(aver[idx]>=95){
                        out.print(" 장학생");
                    }
                %>
            </td>
        </tr>				
		<%
			}//for
		%>
	</table>
	
</body>
```





------





# JSP 기초 5

메소드(함수)



```jsp
<body>
	최댓값 : <%=max(3,5) %>
	<hr>
	두 수 사이의 차이 : <%=diff(2,6) %>
	<hr>
	
	<%!
		//JSP함수 작성 영역(많이 사용안함) !를 붙이면 함수작성공간
		public int max(int a, int b){
			return Math.max(a,b);
		}//max
		public int diff(int a, int b){
			int c=a-b;
			return (c<0)?-c:c;
		}//diff	
	%>
</body>
```

