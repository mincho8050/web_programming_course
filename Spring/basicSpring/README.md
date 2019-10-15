

# 1) STS(Spring Tool Suite) 

- [http://spring.io](http://spring.io/)  
- 스프링 개발 지원, 메이븐등의 플러그인 내장으로 Controller 개발 지원 편리.
- 개발 라이브러리 자동 지원.



## 1-1) 다운로드

​    \- JDK1.4는 Spring 2.5, JDK 1.5부터 Spring 3.0 지원.
​      . 대부분의 기업은 JDK 1.4 서버를 사용함
​      . 전자정부 프레임웍도 eGov 2.5 부터 3.0.5 지원

​    \- [http://spring.io](http://spring.io/)
​      -> TOOLS
​      -> Spring Tool Suite 3 -> See All Versions
​      -> Based on Eclipse 4.7.2 -> WIN, 64BIT zip 400MB 다운로드

​      64 BIT: spring-tool-suite-3.9.2.RELEASE-e4.7.2-win32-x86_64.zip
​      32 BIt: spring-tool-suite-3.9.2.RELEASE-e4.7.2-win32.zip

​      spring-tool-suite-3.9.2.RELEASE-e4.7.2-win32-x86_64.zip 파일을 선택하고
​      '여기에 압축풀기'를 해야 '긴 파일명으로 인한 에러'가 나지 않습니다.

 

## 1-2 ) 폴더이름 변경

 /setup/sts-bundle/sts-3.9.2.RELEASE 폴더의 이름을 'sts-3'로 변경합니다.





## 1-3 )설치

​    \- Tool 설치 폴더: D:/java0123/sts-3
​      Workspace 폴더: D:/java0123/workspace
​    
​    \- /sts-3/STS.exe 실행

 

## 1-4) STS 기본 설정

​    \- eclipse 4.2 이상의 설정: Window -> Preferences

​    . 글꼴     : General -> Apperance -> Colors and Fonts -> Basic -> Text Font에서 수정
​                 (@글꼴은 세로로 출력, 14 이상 권장)

​    . 취소 버퍼 크기: General -> Editors -> Text Editors 
​                 -> Undo history size: 20480, Displayed tab width: 2 

​    . 라인 번호: General -> Editors -> Text Editors 
​                 -> "Insert spaces for Tabs, Show Line Number" Check

​    . TAB의 공백 지정: Java -> Code Style -> Formatter -> New...
​                 -> "jsp" 입력 -> Tab policy를 "Spaces only"선택
​                 -> Indentation size: 2, Tab size: 2하고 확인

   . JSP 템플릿 : Window -> Preferences -> Web -> JSP Files -> Editor -> Templates
                  New -> Name: myjsp
                         Context: New JSP
                         Description: HTML5기반 JSP 페이지
                         Pattern: 내용복사

   . 글자크기 단축키 : Ctrl + Shift + +/-





# 2) Data Source Explorer 추가 설치

※ Window -> Show View에 Data Source Explorer가 없으므로 추가 설치해야 함

   STS -> Help -> Install New Software... -> http://download.eclipse.org/releases/oxygen/ 입력
       -> Database Development 체크 후 설치
       -> STS 다시 시작

   ※ 참조 블로그
      http://blog.naver.com/PostView.nhn?blogId=gingsero&logNo=221026840250







# 3) 스프링 라이브러리 다운로드

http://repo.spring.io/release/org/springframework/spring/

spring-framework-4.0.4.RELEASE-dist.zip 다운 후 압축 풀기





# 4) Spring MVC 프로젝트 import 하기

- 해당 프로젝트 .zip으로 압축하기
  STS 툴 -> Package Explorer 에서 마우스 오른쪽 버튼
  -> Import...
  -> General
  -> Existing Projects into Workspace
  -> Select archive file
  -> Browse...
  -> zip파일 선택
  -> Finish





# 5) Spring Tools 4 for Eclipse

- Download STS4 Windows 64-bit
      -> spring-tool-suite-4-4.1.2.RELEASE-e4.10.0-win32.win32.x86_64.zip 다운후 압축풀기
- Spring Tool Suite 4 는 기본적으로 자바를 많이 배제했기 때문에
      STS-3에서 기본적으로 설치되어 있었던 내용을 추가로 설치 해야 한다
- Spring Legacy Project (구형프로젝트)
      -> 설정이 복잡함. 아직까지 현업에서 개발자이 더 선호하고 있음
      -> STS 4 에서는 기본적으로 지원안함
- Spring Boot
      -> 최신 기술. 설정을 최소화함.
      -> 현재 STS 4에서 추천하고 있는 프로젝트
- STS 4부터는 Spring Legacy Project를 지원하지 않으므로 별도로 추가 설치 해야 한다





## 5-1) STS 3 플러그인 추가 설치

​    \- Help
​      -> Eclipse Marketplace
​      -> spring 검색
​      -> Spring Tools 3 Add-On 3.9.7.Release 확장 프로그램 설치



## 5-2) JSP 추가

​    \- Spring Legacy Project에서는 기본적으로 JSP를 사용하고 있지만
​      Spring Boot에서는 기본적으로 내장되어 있는 템플릿페이지를 사용하도록 권장하고 있음.

​    \- Help
​      -> Install New Software...
​      -> Work with
​      -> 2018-12 - http://download.eclipse.org/releases/2018-12
​      -> java web 검색
​      -> Eclipse Java Web Developer Tools 체크후 설치



------





# 1) Maven 의존성 추가

- 필요한 라이브러리가 있는 경우 jar 파일을 다운받아 /WEB-INF/lib 폴더에
  복사를 안해도 'pom.xml'에 라이브러리관련 선언만으로 자동 다운로드되어
  개발의 편리성을 제공함. 

  .라이브러리 저장 경로 : C:/Users/STU/.m2

- 프로젝트의 '/Maven Dependencies'폴더를 보면 자동으로 다운로드된 라이브러가 저장되어 있다.

- XML문을 지우면 jar 파일이 자동으로 삭제된다.

- 만약 인터넷의 문제로 다운로드가 안되면 'D:/java0123/maven' 폴더에 jar 파일을 직접 저장할 수 있다.

- Spring 관련 라이브러리(의존성) 검색

  - [http://mvnrepository.com](http://mvnrepository.com/)





# 2) Local 저장소의 설정

- 메이븐은 기본적으로 저장소를 운영체제의 계정을 따라 생성된다.
  'C:/Users/STU/.m2' 하지만 이경로는 개발환경이 바뀌면 불편함으로 수동으로 저장소를 지정할 수 있다.
- 기본 경로에있는 jar 파일이 인식이 안되는 경우 인식이됨.
- 라이브러리를 운영체제로부터 분리하여 이동





## 2-1) Maven 설정 파일의 생성

D:/java0123/maven/settings.xml

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                              http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <localRepository>D:/java0514/maven</localRepository>
    <interactiveMode>true</interactiveMode>
    <usePluginRegistry>false</usePluginRegistry>
    <offline>false</offline>
    <pluginGroups>
        <pluginGroup>org.codehaus.mojo</pluginGroup>
    </pluginGroups>
</settings>
```





## 2-2) STS 에서 Maven 환경 설정

  STS -> Window
      -> Preferences
      -> Maven
      -> User Settings
      -> User Settings : settings.xml 지정







# 3) Spring기반 MVC의 원리



## 3-1) 기본 구조

- Model: DAO, Manager, Process, DTO등

- View: JSP

- Controller(Action): Spring에서 지원 하는 Controller사용
      . MVC에서 사용되는 Controller Servlet은 Spring이 자동으로 지원해줌으로
        개발자는 MVC의 Model에 해당하는 클래스만 개발하면 됨.

- 용어의 변경

  ```
  MVC Controller servlet     <-----> Spring 자동 지원.
  
  MVC Action class           <-----> Spring Controller class(기능 처리)
  --------------------------         ----------------------------------  
  Add.java                           AddController.java
  Sub.java                           SubController.java
  Controller3Logic.java              Controller3LogicController.java  
  ```

- 소프트웨어공학에서 Controller에 Action class 를 같은 범주로 포함하는 경우도 있음.



## 3-2) 스프링 MVC의 주요 구성 요소

- DispatcherServlet
      클라이언트의 요청을 중앙에서 처리하는 스프링 MVC의 핵심 구성요소이다
      클라이언트의 요청을 전달 받는다. 컨트롤러에게 클라이언트의 요청을 전달하고,
      컨트롤러가 리턴한 결과값을 View에 전달하여 알맞은 응답을 생성하도록 한다.
- HandlerMapping
      클라이언트의 요청 URL을 어떤 컨트롤러가 처리할지를 결정한다.
- 컨트롤러(Controller)
      클라이언트의 요청을 처리한 뒤, 그 결과를 DispatcherServlet에 알려 준다
      스트럿츠의 Action과 동일한 역할을 수행한다.
- ModelAndView
      컨트롤러가 처리한 결과 정보 및 뷰 선택에 필요한 정보를 담는다.
- ViewResolver
      컨트롤러의 처리 결과를 생성할 뷰를 결정한다.
- 뷰(View)
      컨트롤러의 처리 결과 화면을 생성한다.
      JSP나 Velocity템플릿 파일 등을 뷰로 사용한다.




