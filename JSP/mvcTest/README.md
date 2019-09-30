

# 자바 개발 방식

- .jsp
- .java -> Servlet 클래스
- .jsp + .java(DTO, DAO)







# 서블릿(Servlet)





## 서블릿(Servlet)의 기본

### 1) 서블릿의 개요

\- JSP와 서블릿은 자바 기반으로 만들어진 웹 프로그래밍 언어이다
\- 서블릿이 자바 코드에 의존적이라면
  JSP는 덜 의존적이라 프로그래밍하기가 더 쉽고 편하다

### 2) 서블릿의 동작 원리

\- Servlet클래스 작성
  GenericServlet 클래스 또는 HttpServlet클래스 상속받는다
\- javax.servlet과 javax.servlet.http의 클래스와 인터페이스를 이용해 만든다
\- 서블릿은 main()메소드를 갖지 않는다.
  서버가 서블릿에 요청을 전달할 때마다 서블릿의 service()메소드가 자동호출 된다

### 3) 서블릿의 요청과 응답의 과정에서 웹컨테이너(톰캣)가 하는일

\- 객체가 있는지 유무판단, 없으면 생성
\- Thread생성
\- Service()호출
\- Service()가 doGet()자동 호출

### 4) 서블릿의 요청과 응답의 과정에서 Service() 메소드가 하는일

\- request가 올 때마다 doGet()호출
\- doGet()은 HttpServlet에 의해 지원 받는 몇몇 Service()중 하나이다.













