-- 20190805_프로시저


--[PL/SQL 기본문법]

-- 콘솔창 출력하기 위한 명령어
SET SERVEROUTPUT ON;

--1)연산자
DECLARE
    --변수선언 및 대입
    a NUMBER := 3;
    b NUMBER :=5;
BEGIN
    --콘솔창 출력
    dbms_output.put_line('*실행결과*');
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    dbms_output.put_line(a+b);
    --결합연산자
    dbms_output.put_line(a || '+' || b || '=' || (a+b));
END;
/


--2) 조건문
2) 조건문-1
DECLARE
  --성적프로그램
  uname VARCHAR2(50) := '무궁화';
  kor   NUMBER := 100;
  eng   NUMBER := 95;
  mat   NUMBER := 80;
  aver  NUMBER := (kor+eng+mat)/3; 
  grade VARCHAR2(50) := NULL;
begin
  IF aver>=90 THEN grade:='A';
  ELSIF aver>=80 THEN grade:='B';
  ELSIF aver>=70 THEN grade:='C';
  ELSIF aver>=60 THEN grade:='D';
  ELSE  grade:='F';
  END IF;

  --출력
   DBMS_OUTPUT.PUT_LINE('*실행결과*');
   DBMS_OUTPUT.PUT_LINE('이름 : ' || uname);
   DBMS_OUTPUT.PUT_LINE('국어 : ' || kor);
   DBMS_OUTPUT.PUT_LINE('영어 : ' || eng);
   DBMS_OUTPUT.PUT_LINE('수학 : ' || mat);
   DBMS_OUTPUT.PUT_LINE('평균 : ' || aver);
   DBMS_OUTPUT.PUT_LINE('학점 : ' || grade);
END;
/

--3)조건문-2
DECLARE
  --성적프로그램
  uname VARCHAR2(50) := '무궁화';
  kor   NUMBER := 100;
  eng   NUMBER := 95;
  mat   NUMBER := 80;
  aver  NUMBER := (kor+eng+mat)/3; 
  grade VARCHAR2(50) := NULL;
begin
  IF aver BETWEEN 90 AND 100 THEN grade:='A';
  ELSIF aver BETWEEN 80 AND 89 THEN grade:='B';
  ELSIF aver BETWEEN 70 AND 79 THEN grade:='C';
  ELSIF aver BETWEEN 60 AND 69 THEN grade:='D';
  ELSE  grade:='F';
  END IF;

  --출력
   DBMS_OUTPUT.PUT_LINE('*실행결과*');
   DBMS_OUTPUT.PUT_LINE('이름 : ' || uname);
   DBMS_OUTPUT.PUT_LINE('국어 : ' || kor);
   DBMS_OUTPUT.PUT_LINE('영어 : ' || eng);
   DBMS_OUTPUT.PUT_LINE('수학 : ' || mat);
   DBMS_OUTPUT.PUT_LINE('평균 : ' || aver);
   DBMS_OUTPUT.PUT_LINE('학점 : ' || grade);
END;
/


--4) 반복문
DECLARE 
    dan NUMBER:=4;
    i NUMBER DEFAULT 0;
BEGIN
    LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
        EXIT WHEN i=9; --i값이 9이면 빠져나오기ㅏ
    END LOOP;
END;
/


--5) 반복문2
DECLARE
    dan NUMBER :=4;
    i NUMBER DEFAULT 0;
BEGIN
    FOR i IN 1..9 LOOP --FOR 변수 IN 시작..종료값
    DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
    END LOOP;
END;
/


--6) 반복문-3
DECLARE
    dan NUMBER:=4;
    i NUMBER DEFAULT 0;
BEGIN
    WHILE i<10 LOOP
        i:=i+1;
        EXIT WHEN i=10;
       DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
    END LOOP;
END;
/


--[성적테이블 생성]
DROP TABLE sungjuk;
DROP SEQUENCE sungjuk_seq;
CREATE SEQUENCE sungjuk_seq;

CREATE TABLE sungjuk (
    sno NUMBER NOT NULL PRIMARY KEY
    ,uname VARCHAR(50) NOT NULL
    ,kor NUMBER(3) NOT NULL CHECK(kor BETWEEN 0 AND 100)
    ,eng NUMBER(3) NOT NULL CHECK(eng BETWEEN 0 AND 100)
    ,mat NUMBER(3) NOT NULL CHECK(mat BETWEEN 0 AND 100)
    ,tot NUMBER(3) DEFAULT 0
    ,aver NUMBER(5,2) DEFAULT 0
    ,addr VARCHAR(30) CHECK(addr IN ('Seoul','Jeju','Suwon','Busan'))
    ,wdate DATE DEFAULT SYSDATE
);

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon');

SELECT * FROM sungjuk;

--sno=3행가져오기
SELECT *
FROM sungjuk
WHERE sno=3;

--프로시저를 이용해서 sno=3 가져오기
DECLARE
    v_sno NUMBER;
    v_uname VARCHAR2(50);
    v_kor NUMBER;
    v_eng NUMBER;
    v_mat NUMBER;
    v_addr VARCHAR2(30);
    v_wdate DATE;
BEGIN
    --SQL문 작성
    SELECT sno, uname, kor, eng, mat, addr, wdate
    INTO v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
    FROM sungjuk
    WHERE sno=3;
    
    --출력
   DBMS_OUTPUT.PUT_LINE('*실행결과*');
   DBMS_OUTPUT.PUT_LINE('번호 : ' || v_sno);
   DBMS_OUTPUT.PUT_LINE('이름 : ' || v_uname);
   DBMS_OUTPUT.PUT_LINE('국어 : ' || v_kor);
   DBMS_OUTPUT.PUT_LINE('영어 : ' || v_eng);
   DBMS_OUTPUT.PUT_LINE('수학 : ' || v_mat);
   DBMS_OUTPUT.PUT_LINE('주소 : ' || v_addr);
   DBMS_OUTPUT.PUT_LINE('작성일 : ' || v_wdate);
END;
/



--주소를 한글로 출력
declare
  v_sno   number;
  v_uname varchar2(50);
  v_kor   number;
  v_eng   number;
  v_mat   number;
  v_addr  varchar2(30);
  v_wdate date;
  v_juso  varchar2(30);
begin
  --SQL문 작성
  select sno, uname, kor, eng, mat, addr, wdate
  into v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
  from sungjuk
  where sno=3;

  if    v_addr='Seoul' then v_juso:='서울';
  elsif v_addr='Jeju'  then v_juso:='제주';
  elsif v_addr='Suwon' then v_juso:='수원';
  elsif v_addr='Busan' then v_juso:='부산';
  end if;

  dbms_output.put_line('*실행결과*');
  dbms_output.put_line('번호 : ' || v_sno);
  dbms_output.put_line('이름 : ' || v_uname);
  dbms_output.put_line('국어 : ' || v_kor);
  dbms_output.put_line('영어 : ' || v_eng);
  dbms_output.put_line('수학 : ' || v_mat);
  dbms_output.put_line('주소 : ' || v_addr);
  dbms_output.put_line('주소 : ' || v_juso);
  dbms_output.put_line('작성일 : ' || v_wdate);

end;
/


--[PL/SQL 참조변수]
--%TYPE
-->테이블에서 한 개 컬럼의 데이터타입 및 사이즈를 참조
-->형식) 변수명 테이블명.칼럼명%TYPE
--%ROWTYPE
--테이블의 ROW타입과 같다는 의미
-->형식) 변수명 테이블명%ROWTYPE


--1) %TYPE
DECLARE
    v_sno sungjuk.sno%TYPE;
    v_uname sungjuk.uname%TYPE;
    v_kor sungjuk.kor%TYPE;
    v_eng sungjuk.eng%TYPE;
    v_mat sungjuk.mat%TYPE;
    v_addr sungjuk.addr%TYPE;
    v_wdate sungjuk.wdate%TYPE;
BEGIN
     --SQL문 작성
    SELECT sno, uname, kor, eng, mat, addr, wdate
    INTO v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
    FROM sungjuk
    WHERE sno=3;
    
    --출력
   DBMS_OUTPUT.PUT_LINE('*실행결과*');
   DBMS_OUTPUT.PUT_LINE('번호 : ' || v_sno);
   DBMS_OUTPUT.PUT_LINE('이름 : ' || v_uname);
   DBMS_OUTPUT.PUT_LINE('국어 : ' || v_kor);
   DBMS_OUTPUT.PUT_LINE('영어 : ' || v_eng);
   DBMS_OUTPUT.PUT_LINE('수학 : ' || v_mat);
   DBMS_OUTPUT.PUT_LINE('주소 : ' || v_addr);
   DBMS_OUTPUT.PUT_LINE('작성일 : ' || v_wdate);  
END;
/


--2) %ROWTYPE 
DECLARE
   sj sungjuk%ROWTYPE;
BEGIN
     --SQL문 작성
    SELECT *
    INTO sj
    FROM sungjuk
    WHERE sno=3;
    
    --출력
   DBMS_OUTPUT.PUT_LINE('*실행결과*');
   DBMS_OUTPUT.PUT_LINE('번호 : ' || sj.sno);
   DBMS_OUTPUT.PUT_LINE('이름 : ' || sj.uname);
   DBMS_OUTPUT.PUT_LINE('국어 : ' || sj.kor);
   DBMS_OUTPUT.PUT_LINE('영어 : ' || sj.eng);
   DBMS_OUTPUT.PUT_LINE('수학 : ' || sj.mat);
   DBMS_OUTPUT.PUT_LINE('주소 : ' || sj.addr);
   DBMS_OUTPUT.PUT_LINE('작성일 : ' || sj.wdate);  
END;
/


--[커서를 이용해서 복수행 처리]

--FETCH문
--오픈된 커서로부터 한 행을 인출한다
--형식) FETCH 커서명 INTO 변수명

--sno>=5 레코드 조회
SELECT *
FROM sungjuk
WHERE sno>=5;
--프로시저 이용하기
DECLARE
    v_cursor SYS_REFCURSOR;     --커서를 담는  변수선언 및 자료형
    rec sungjuk%ROWTYPE;            --한 행 담을 수 있는 변수선언
BEGIN
    OPEN v_cursor FOR       --v_cursor가 가리키는 곳
    SELECT *
    FROM sungjuk
    WHERE sno>=5;
    
    LOOP
        FETCH v_cursor INTO rec; --한 행 인출해서 rec에 대입
        EXIT WHEN v_cursor%NOTFOUND;--자료가 없으면 빠져나감
        DBMS_OUTPUT.PUT_LINE(rec.sno);
        DBMS_OUTPUT.PUT_LINE(rec.uname);
        DBMS_OUTPUT.PUT_LINE(rec.kor);
        DBMS_OUTPUT.PUT_LINE(rec.eng);
        DBMS_OUTPUT.PUT_LINE(rec.mat);
        DBMS_OUTPUT.PUT_LINE(rec.addr);
        DBMS_OUTPUT.PUT_LINE(rec.wdate);
        
    END LOOP;

END;
/



--[PL/SQL 생성]
--저장하는것은 DECLARE 대신 CREATE 사용
--생성하면 그 다음부터는 자동으로 업데이트. 생성과 삭제만 알아보기.? 신경쓰기?
--CREATE PROCEDURE 프로시저명; -> 프로시저 생성
--DROP PROCEDURE 프로시저명;     -> 프로시저 삭제 

--test 프로시저 생성
CREATE OR REPLACE PROCEDURE test 
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('테스트');
END;
--생성할때는 / 사용하지 않아도 된다


--test 프로시저 호출
EXECUTE test;

--test 프로시저 삭제
DROP PROCEDURE test;




