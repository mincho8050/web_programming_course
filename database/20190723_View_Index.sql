--물리적 테이블 : 사용자가 CREATE에 의해 생성된 실제 존재하는 테이블
--논리적 테이블 : 사용자가 SQL문에 의해 가공된 테이블

--뷰(View) 
--1) 정의
--테이블에 대한 가상의 테이블로써 테이블처럼 직접 데이터를 소유하지 않고
--검색시에 이용할 수 있도록 정보를 담고 있는 객체
--테이블 정보의 부분집합
--2) 사용 목적
--테이블에 대한 보안 기능을 설정해야 하는 경우
--복잡하며 자주 사용하는 질의 SQL문을 보다 쉽고 간단하게 사용해야 하는 경우

--3) 뷰 생성 권한 부여
--cmd 열고 > sqlplus / as sysdba 입력
--SQL>grant create view to java0514;

--4) 뷰 생성 형식
CREATE OR REPLACE VIEW 뷰이름
AS
    [SQL문]
-> REPLACE : 이미 존재하는 뷰의 내용을 수정함

--5) 뷰 생성하기
--CREATE VIEW 뷰이름
CREATE VIEW test_view
AS
    SELECT * FROM emp;

--6) 뷰 삭제하기
--DROP VIEW 뷰이름
DROP VIEW test_view;


SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno;


--테이블,뷰 목록 확인
SELECT * FROM tab;

--뷰생성(두번째부터는 수정)
--CREATE OR REPLACE VIEW 뷰이름
--AS 실제로실행할SQL명령어
CREATE OR REPLACE VIEW test_view
AS
    SELECT empno,ename,job,sal,deptno
    FROM emp;
--뷰에 등록된 SQL문 실행   
--생성된 뷰는 테이블처럼 사용가능
SELECT * 
FROM test_view;

SELECT * FROM emp;

--뷰의 세부 정보 확인(데이터사전)
SELECT * FROM user_views;

--AS명령어 (alias별칭)
SELECT ename AS 이름
            ,sal 급여
            ,hiredate 입사일
FROM emp;
        
--emp테이블 이름을 AA로 바꿔서 사용
SELECT *
FROM emp AA;

SELECT *
FROM emp AA
ORDER BY AA.ename; --AA테이블에 있는 ename 이라는 의미

SELECT *
FROM emp
ORDER BY emp.ename; --emp테이블에 있는 ename이라는 의미


SELECT * FROM emp;  --직원테이블
SELECT * FROM dept; --부서테이블

--JOIN 사용
SELECT emp.ename,emp.deptno,dept.*
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
--AS붙인거
SELECT AA.ename,AA.deptno,BB.*
FROM emp AA JOIN dept BB
ON AA.deptno=BB.deptno;

CREATE OR REPLACE VIEW test2_view
AS
    SELECT AA.ename,AA.deptno,BB.dname,bb.loc --BB.* > 중복칼럼이라고 오류뜸. > 자기 소속위치를 어디인지 알려줘야함!
    FROM emp AA JOIN dept BB
    ON AA.deptno=BB.deptno;
    
SELECT * FROM test2_view;

SELECT emp.ename,emp.deptno,dept.dname
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT ename,deptno, dname
FROM (
    SELECT emp.ename,emp.deptno,dept.dname
    FROM emp JOIN dept
    ON emp.deptno=dept.deptno
) AA
WHERE AA.deptno=10;





