
--[조인 JOIN]
--두 개 이상의 테이블을 결합하여 데이터를 추출하는 기법
--두 테이블의 공통값을 이용하여 칼럼을 조합하는 수단

--표준(ANSI) SQL문 -공통
--각 DB만의 SQL문

--형식 : ANSI SQL문 )
--        SELECT 칼럼명
--        FROM 테이블1 JOIN 테이블2
--        ON 조건절;
--left 테이블이 기준(테이블1)

--형식 : Oracle SQL문 )
--            SELECT 칼럼명
--            FROM 테이블1 , 테이블2
--            WHERE 조건절;


DROP TABLE emp;
DROP TABLE dept;

--부서테이블 (부모)
CREATE TABLE dept (
    deptno  NUMBER(7) PRIMARY KEY
    ,dname VARCHAR(20)
    ,loc VARCHAR(10)
);

--칼럼추가
INSERT INTO dept VALUES(10,'경리팀','부산');
INSERT INTO dept VALUES(20,'연구팀','대전');
INSERT INTO dept VALUES(30,'총무팀','대구');
INSERT INTO dept VALUES(40,'전산팀','인천');


--직원테이블 (자식)
CREATE TABLE emp(
    empno   NUMBER(4)  PRIMARY KEY
    ,ename VARCHAR2(10) 
    ,job    VARCHAR2(9)
    ,mgr    NUMBER(4)   
    ,hiredate   DATE    
    ,sal NUMBER(7,2)  
    ,comm NUMBER(7,2) 
    ,deptno NUMBER(7)   REFERENCES dept(deptno)
);

--칼럼추가
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '개나리', '사원', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '진달래', '주임', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '라일락', '주임', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '손흥민', '과장', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '박지성', '주임', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '김연아', '사원', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '무궁화', '사원', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, '홍길동', '부장', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '송강호', '과장', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '정우성', '대표', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '김혜수', '사원', 7902, '2001-12-03', 200, 20);


SELECT * FROM emp;
SELECT * FROM dept;


SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT *
FROM emp , dept
WHERE emp.deptno=dept.deptno;

























