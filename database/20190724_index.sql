
SELECT * FROM c_emp;
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id  NUMBER(5)
    ,name VARCHAR2(25)
    ,salary NUMBER(7,2)
    ,phone VARCHAR2(15)
    ,dept_id NUMBER(7)
);

INSERT INTO c_emp(id,name) VALUES (10,'kim');
INSERT INTO c_emp(id,name) VALUES (20,'park');
INSERT INTO c_emp(id,name) VALUES (30,'hong');

--인덱스 생성 전
SELECT * 
FROM c_emp
WHERE name='hong';
--F10 실행계획 보기 (커서위치 중요)
-- >  full scan cost 3

--Primary key , Unique 제약조건을 만들면 해당 인덱스 페이지가 자동으로 생성된다

--인덱스 생성 후 
--CREATE INDEX 인덱스명 ON 테이블명(칼럼명);
CREATE INDEX c_emp_name_idx
ON c_emp(name);
--실행계획보기 F10 (인덱스 생성 후)
--SELECT * 
--FROM c_emp
--WHERE name='hong';
-->range scan, cost 1

--인덱스 삭제
DROP INDEX c_emp_name_idx;


--PK는 인덱스가 자동으로 생성되면서 정렬된다
CREATE TABLE emp4(
    no NUMBER PRIMARY KEY
    ,name VARCHAR2(10)
    ,sal NUMBER
);

--인덱스 목록 보기
SELECT * FROM user_indexes;

--실행계획보기 F10
SELECT * 
FROM emp4
WHERE no=3;
--unique scan, cost 1



--예) 테스트용 레코드 100만건 입력
--PL/SQL (Procedural Language) 프로시저
-- > 절자척인 데이터베이스 프로그래밍 언어

CREATE TABLE emp3(
    no      NUMBER
    ,name VARCHAR2(10)
    ,sal       NUMBER
);



--기본골격
DECLARE --프로시저 선언문
    --필요한 변수 선언
    i NUMBER := 1; -- i 변수에 1 대입(대입연산자 :=)
    name VARCHAR(20) :='kim';
    sal NUMBER :=0;
BEGIN
    -- T-SQL문 (제어문-조건문,반복문 등)
    WHILE i<=1000000 LOOP 
        IF i MOD 2 = 0 THEN --(MOD : 나머지연산자 , 같다연산자 = 하나만!)
            name := 'kim' || TO_CHAR (i);
            sal := 300;
        ELSIF i MOD 3 = 0 THEN --ELSE IF는 이렇게 작성
            name :='park' || TO_CHAR(i);
            sal := 400;
        ELSIF i MOD 5 = 0 THEN 
            name :='hong' || TO_CHAR(i);
            sal := 500;
        ELSE
            name :='shin' || TO_CHAR(i);
            sal := 250;
        END IF; --IF문 닫는 태그
        
        INSERT INTO emp3(no,name,sal)
        VALUES (i ,name ,sal);
        i := i+1;        
    END LOOP; --LOOP ~ END LOOP 마치 블라켓같은 느낌
END;
/ -- / 까지임..

--프로시저 전에는 0 출력
SELECT COUNT(*) FROM emp3;
--프로시저 후에는 1000000

--모조칼럼
--ROWID : 행의 주소값 / ROWNUM : 행번호
SELECT * 
FROM emp3
WHERE ROWNUM >=1 AND ROWNUM<=10;

--인덱스를 사용하지 않은 경우
SELECT *
FROM emp3
WHERE name='kim466';
--실행계획 F10 > full scan , cost 894


--문) name 칼럼을 기준으로 인덱스 생성 후
--name 칼럼에서 조회하고 F10 계획 결과 확인하기
CREATE INDEX emp3_name_index
ON emp3(name);

--인덱스 사용한 경우
SELECT *
FROM emp3
WHERE name='kim466';
--실행계획 F10 > range scan , cost 3

SELECT * FROM user_indexes; --인덱스 목록

SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM user_indexes
WHERE TABLE_NAME IN ('EMP3','EMP4'); --테이블 이름 여기서는 대문자로 ! '' 안에!!
--결과값
--EMP3_NAME_INDEX	EMP3	NONUNIQUE   > 중복될수 있음
--SYS_C007084	EMP4	UNIQUE                      > PRIMARY KEY 를 설정했음 그래서 UNIQUE

--name 인덱스 삭제 후 테스트
DROP INDEX emp3_name_index;

--이름과 급여를 기준으로 인덱스 생성
CREATE INDEX emp3_name_sal_index
ON emp3(name,sal);

--full scan , cost 894
SELECT * 
FROM emp3
WHERE no=466;
--range scan , cost 17
SELECT * 
FROM emp3
WHERE name='kim466';
--full scan , cost 895
SELECT * 
FROM emp3
WHERE sal > 200;
--range scan , cost 3
SELECT *
FROM emp3
WHERE name='kim466' AND sal>200;
















