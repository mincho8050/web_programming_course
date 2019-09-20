# JSP Mini Project

[jQuery 관련 Eclipse Plugin 설치](http://handcoding.tistory.com/8)



------



# 사용자 정의 태그 custom tag

.xml 은 환경설정 및 안드로이드 OS 사용할 때 많이 사용



```xml
<database>
	<url></url>
    <driver></driver>
    <username></username>
    <password></password>
</database>
```



------



# Cookie 클래스

- javax.servlet.http.Cookie 클래스를 이용.

- Tomcat 서버가 Client에 저장하는 텍스트 파일로 된 정보

- 보안성이 없음으로 계정과 패스워드를 동시에 쿠키에 저장하면, 쿠키의 내용을 전부 편집기로
    열어 볼 수 있음으로 보안에 문제가 될 수 있다.

  \- 4Kb까지 저장할 수 있다. 네트워크 트래픽이 많아짐으로  1KB안쪽으로 사용 권장.

- 쿠키는 웹페이지 접속시 서버로 자동으로 전송되고 서버에 의해서 클라이언트에 쓰여지므로
    쿠키를 사용하지 않는 옵션을 브러우저에서 지정가능.
   
- 쿠키의 저장 폴더(최근의 브러우저는 보안상의 이유로 쿠키 내용을 볼 수 없도록 변경함):
     . Window XP IE의 경우: 탐색기 --> 도구 --> 폴더 옵션 --> 보기:
         보호된 운영 체제 파일 숨기기 체크 해제, 숨김 파일 및 폴더 표시 선택. 
         "C:\Documents and Settings\각 계정(Administrator)\Cookies"가 지정됨

- 사용예)
     .하루동안 이벤트창 오픈 하지 않기
     .ID/PASSWORD 자동으로 저장기능 등 입력된 값의 자동 출력
     .내가 클릭한 상품 목록

- setMaxAge()
    .쿠키의 생존 기간 초 단위 지정, 12시간의 경우 12*60*60
    .브러우저는 시간이 지난 쿠키는 서버로 전송하지 않고 자동으로 삭제하며
     사용자가 직접 삭제도 가능. 쿠키는 브러우저가 사용하는 데이터임.

- 쿠키변수 선언 및 초기값
     Cookie cname=new Cookie(쿠키 변수명, 쿠키 값)
      예) Cookie cname=new Cookie("cname", "user1");

- 접속자의 브러우저의 옵션에서 쿠키를 사용할 수 없도록하면 쿠키는 작동되지 않음으로
    중요한 기능은 세션이나 데이터베이스를 이용한다.
    쿠키에 쇼핑카트등의 사용은 주의할 것.



------



# 파일 전송

- 사용자가 클래스를 이용해서 직접 생성 가능
- 외부 라이브러리 활용 (cos.jar)
  - 프로젝트에 외부 라이브러리 적용시키려면 프로젝트 -> WEB-INF -> lib 에 넣기





## 파일업로드 라이브러리 무료 배포 (cos.jar)

[cos.jar 다운로드](http://www.servlets.com/) -> com.oreilly.servlet -> cos-20.08.zip 압축 해제 

-> setup/cos-20.08/lib/cos.jar 복사 -> WebContent/WEB-INF/lib/cos.jar 붙여넣기

-> cos.jar API문서 참조: setup/cos-26Dec2008/doc/index.html

**파일이 저장되는 물리적 경로**

D:\java0514\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\myweb\storage





------



# 포토갤러리(이미지게시판)

- 쓰기, 목록, 상세보기





------



# 메일서버(POP3, SMTP)

- DB서버
- Web 서버
- 메일 서버(POP3, SMTP)



## 자바 메일 보내기

- 문의 메일 보내기, 쇼핑몰에 상품 구매 후에 구매완료되었습니다등
    자바코드를 이용해서 메일을 보낸다.

- 메일 서버(POP3/SMTP) 구축후, 메일 라이브러리를 통해서
    간편하게 메일을 전송할수 있는 JSP파일을 작성한다.
    별도로 메일 서버는 구축하지 않고 카페24 메일 서버를 활용할 예정.

- 카페24 유료 회원이면 카페24에서 제공하는 메일 서버를 계정 인증후의 3개까지 사용할 수 있다.(유료전환)
    [http://www.cafe24.com](http://www.cafe24.com/)  -> 나의 서비스 관리 -> 이메일계정 추가/삭제



- JAF(JavaBeans Activation Framework)와  JavaMail 라이브러리가 필요

    1) JAF 다운로드 jaf-1_1_1.zip -> activation.jar
        http://www.oracle.com/technetwork/java/jaf11-139815.html

    2) javaMail 다운로드 javamail1_4_7.zip -> mail.jar
        http://www.oracle.com/technetwork/java/javamail/javamail145-1904579.html

  ​      JavaMail 1.5 -> http://www.oracle.com/technetwork/java/index-138643.html

 	 3) mail.jar와 activation.jar 를 /WEB-INF/lib/폴더에 복사




