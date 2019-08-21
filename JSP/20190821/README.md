

# 환경설정 확인

1. JDK 8.0.20 이상 확인

   : cmd -> java -version 

   ​		  ->javac (자바가 어느 경로에서든 실행할 수 있는지 확인)

2. Eclipse Luna

   : Eclipse 실행 -> Help -> About Eclipse 에서 버전확인

   : 작업공간 변경 -> File -> Switch Workspace -> Other

3. Apache Tomcat 8.0.26 (시험용)

4. DBMS Oracle 11g XE

   : cmd -> sqlplus 아이디/비번





------





# Tomcat 설치

- **9 버전 기준**
  - Eclipse Luna는 9 버전을 읽지 못함(8.5 이상도 불가할 수 있음)
  - 나중에는 그냥 Eclipse 최신판, Tomcat 9 버전 다운받고 사용해도 됨
- 서버의 종류
  - DB서버
  - 메일서버
  - 웹서버 (Web Server) : 웹브라우저를 이용해서 요청, 응답
    - IIS 	: .asp , 닷넷 (Windows 계열이라 OS에 있어서 추가하면됨)
    - Tomcat , JBoss : .jsp
    - Linux    : .php
- Tomcat Web Server , JSP Container
  - 무료
  - [http://www.apache.org](http://www.apache.org/)







## 1) Tomcat 9 설치

-  JSP Server(Servlet Container, JSP Container)는 
        JSP코드 및 JAVA코드를 해석하여 처리하고 
        결과를 HTML로 변환해 브라우저로 출력하는 역할을 수행한다.
     \- Tomcat 6.X는 J2SE 6.0(1.6)이상 설치해야 가능하다.
     \- Tomcat은 Application간에 메모리가 공유됨으로 하나의 JSP 사이트가
       문제가 생기면 다른 웹사이트도 영향을 받게 된다.
     \- Tomcat에는 하나의 Web Application만 설치를 권장한다.
     \- Tomcat과 비슷한 서버로 JBoss, Resin, JRun 등이 있다.
-  [http://www.apache.org](http://www.apache.org/) -> Tomcat -> Download -> Tomcat 9
        -> Binary Distributions -> Core -> zip 다운
        -> apache-tomcat-9.0.8.zip 압축풀기
        -> 폴더명 tomcat-9.0 변경후 경로 이동
- D:/java0123/tomcat-9.0/bin
                                  conf
                                  lib
                                  logs
                                  temp



## 2) Tomcat 서버 포트 수정

tomcat-9.0/conf/server.xml을 수정한다. 69번 라인 근처
     - Oracle 9i이상은 Apache, XDB가 설치되어 있어 8080포트를 
       이용하기 때문에 포트 충돌을 막기위해 8080을 사용하지않고 
       8090 포트로 변경한다.

```xml
<Connector port="8090" protocol="HTTP/1.1" 
           connectionTimeout="20000" 
           redirectPort="8443" URIEncoding="UTF-8" />
```





## 3) Tomcat 서버 시작

tomcat-9.0/bin/startup.bat 더블 클릭





## 4) Web Application의 환경설정

1. /tomcat-9.0/webapps     : 홈디렉토리, root, 기본설치 폴더

2. /tomcat-9.0/webapps/soldesk: soldesk 프로젝트 설정

3. /tomcat-9.0/webapps/soldesk/WEB-INF  :   web.xml 환경 설정 파일 저장
       \- 틀린경우: web-inf, Web-inf, WEB-inf, WEB_INF, 대소문자 반드시 일치
       \- WEB-INF 폴더는 soldesk 폴더를 JSP Web 프로젝트 폴더로 인식됨으로 반드시 생성.

4. /tomcat-9.0/webapps/soldesk/WEB-INF/lib    :   *.jar 등 여러 드라이버(Library) 저장 폴더

5. /tomcat-9.0/webapps/soldesk/WEB-INF/classes  :   *.class, servlet, beans가 위치

6. 브라우저(크롬,파이어폭스,익스플로러) 확인

   - http://localhost:9090/soldesk/test.jsp
          localhost: 현재 사용중인 컴퓨터를 지정하는 별명

   - http://127.0.0.1:9090/soldesk/test.jsp
          127.0.0.1: 현재 컴퓨터를 지정하는 IP  

   - http://172.16.4.100:9090/soldesk/test.jsp
          172.16.4.1: 고정 IP, 사설 고정 IP

​     ※ 고정IP 확인 방법: cmd 창 -> ipconfig







------





# Eclipse에서 Web Application 생성

Java EE 로 변경 후(Tomcat 설치하면 엔터프라이즈는 자동으로 설치 된다.)

New -> Dynamic Web Project 로 만든다.  마지막에 Generate web.xml deployment descriptor 체크한다.

WEB-INF\web.xml : 환경 설정 파일이다

실제 이클립스에서 다루는 것은 WebContent에 있는 것들을 다룬다. (내가 다루고 있는 Project의 root가 되는 것. Project명은 따로 있지만 다루는 것은 WebContent에서 다룬다)

Eclipse는 원본으로 하는게 하니라 복사본으로 다룬다.







------







# Eclipse 에서 Tomcat 연동

한 번만 연결하면 다음부터는 복사해서 사용

- Window
    -> Preferences
    -> Server
    -> Runtime Environments
    -> Add 
    -> Browse... 
    -> tomcat-9설치 폴더 선택 (버전에 따라 다름. Luna는 8까지 사용가능)



### Tomcat 서버 복사

Servers 탭 -> New (우클릭)

> Server 탭이 보이지 않으면 Window -> Show View

결과 확인은 우클릭 ->Run As / 또한 다른 웹브라우저로 확인 하고 싶으면 Window -> Web Browser로 변경


