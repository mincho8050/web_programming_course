CREATE TABLE emp(
    empno   NUMBER(4)   --사번
    ,ename VARCHAR2(10) --이름
    ,job    VARCHAR2(9) --직급
    ,mgr    NUMBER(4)   --매니저정보
    ,hiredate   DATE    --입사일
    ,sal NUMBER(7,2)    --급여
    ,comm NUMBER(7,2) --커미션(보너스)
    ,deptno NUMBER(2)   --부서코드
);

SELECT * FROM tab;

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'개나리','사원',7902,'2000-12-17',200,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'진달래','주임',7698,'2001-12-15',360,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'라일락','주임',7698,'2001-02-17',355,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'손흥민','과장',7839,'2002-01-11',400,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'박지성','주임',7698,'2000-07-12',325,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'김연아','사원',7698,'2001-12-17',225,10);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'무궁화','사원',7839,'2005-11-14',200,10);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'홍길동','부장',7566,'2006-06-17',450,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'송강호','과장',7566,'2018-09-17',400,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'정우성','대표',7839,'2004-09-09',500,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'김혜수','사원',7902,'2001-12-03',200,20);

SELECT * FROM emp;

--문) 테이블의 필드 목록을 확인하시오
SELECT * FROM emp;

--문) 사원이름순(오름차순) 정렬하시오
SELECT * FROM emp
ORDER BY ename;

--문) 사원이름순(내림차순) 정렬하시오
SELECT * FROM emp
ORDER BY ename DESC;

--문) 급여 내림차순으로 사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오

SELECT ename,sal,deptno
FROM emp
ORDER BY sal DESC;

--문) 부서코드 오름차순, 급여 내림차순으로
--사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오
SELECT ename,sal,deptno
FROM emp
ORDER BY deptno,sal DESC;

--문)이름(ename)/입사일자(hiredate)/부서코드(deptno)를 
--부서코드 오름차순, 입사일자(hiredate)오름차순으로 조회하시오
SELECT ename,hiredate,deptno
FROM emp
ORDER BY deptno,hiredate;

--문)직급(job) 칼럼의 중복데이터를 하나씩만 조회하시오
SELECT DISTINCT(job)
FROM emp;

--문)emp테이블의 job 오름차순, sal 내림차순으로 정렬해서
--ename 이름, job 직급, sal 급여 칼럼명으로 별칭을 바꿔서 조회하시오
SELECT ename AS 이름,job AS 직급,sal AS 급여
FROM emp
ORDER BY job ASC,sal DESC;

--문)급여가 100보다 많고 400보다 작은 직원 조회하기(급여 내림차순)
SELECT *
FROM emp
WHERE sal>100 AND sal<400
ORDER BY sal DESC;

--문)급여가 100이하 또는 400 이상의 직원 검색하기(급여 내림차순)
SELECT *
FROM emp
WHERE sal<=100 OR sal>=400
ORDER BY sal DESC;

SELECT *
FROM emp
WHERE NOT(sal>100 AND sal<400)  --NOT 사용
ORDER BY sal DESC;

--문)직급(job)이 과장 또는 부장인 직원들을 이름순으로 조회하시오
SELECT *
FROM emp
WHERE job IN('과장','부장')
ORDER BY ename;

--문)부서코드(deptno)가 30인 직원을 조회하시오
SELECT *
FROM emp
WHERE deptno=30;

--문)중복된 부서코드를 한개씩만 조회하시오
SELECT DISTINCT(deptno)
FROM emp;

--문)부서코드가 10 또는 20 또는 30인 직원을 조회하시오
--(or,in연산자 각각 활용해서 조회)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

--문)급여가 300~500인 직원을 급여순으로 조회하시오
--(AND,BETWEEN연산자 각각 활용해서 조회)
SELECT *
FROM emp
WHERE sal BETWEEN 300 AND 500
ORDER BY sal;

SELECT *
FROM emp
WHERE sal>=300 AND sal<=500
ORDER BY sal;

--문)이름이 무궁화 조회하시오
SELECT *
FROM emp
WHERE ename='무궁화';

--문)김씨성을 조회하시오
SELECT *
FROM emp
WHERE ename LIKE'김%';

--문)이름에 '화' 포함된 줄을 조회하시오
SELECT *
FROM emp
WHERE ename LIKE '%화%';

--문) 부서코드가 20인 레코드에 대해서 급여의 1%를 커미션으로 책정하시오
UPDATE emp
SET comm=sal*0.01
WHERE deptno=20;


--문)연봉을 아래와 같이 구한 후 이름, 급여, 커미션, 연봉을 조회하시오
--연봉구하는 식: 급여(sal)*12개월+보너스(comm)
SELECT 
    ename
    ,sal
    ,comm
    ,sal*12+comm AS a_income
FROM emp;


--문)커미션이 null이면 0으로 바꾼 후 연봉을 다시 계산해서
--이름,급여,커미션,연봉을 조회하시오
SELECT
    ename
    ,sal
    ,comm
    ,sal*12+NVL(comm,0) AS a_income
FROM emp;

--문)각 사람의 급여를 검색해서 '누구누구의 급여는 얼마입니다'로 조회하시오
--(|| 결합연산자) > 자바에서의 +연산자라고 생각하면됨
--연결 연산자
--SELECT 문 내부에 || 수직바를 사용해서 표현한다.
--기존의 칼럼내에 문자열을 추가하고자 할 때 사용한다
SELECT ename || '의 급여는 ' || sal || ' 입니다.' 
FROM emp;


--문) 다음의 SQL문을 분석하시오
--SELECT empno,sal
--FROM emp
--WHERE NOT(sal>200 AND sal<300)
--ORDER BY sal;
emp테이블에서
급여가 (200 초과이면서 300 미만)아닌
> 결론은 200 이하 또는 300 이상의
직원의 이름과 급여를 급여 오름차순으로 조회

--문)다음의 SQL문을 분석하시오
--SELECT empno,sal
--FROM emp
--WHERE not sal>200 AND sal<300
--ORDER BY sal;
emp테이블에서 
급여가 200 초과가 아니면서(NOT이 sal>200만 적용), 급여가 300 미만인 
직원의 이름과 급여를 급여 오름차순으로 
조회한다.

--연산자 우선순위
--() 괄호 : 연산자 우선순위보다 우선함
--1 순위 : 비교연산자, SQL연산자, 산수연산자
--2 순위 : NOT
--3 순위 : AND
--4 순위 : OR
--5 순위 : 결합연산자

--문)emp테이블에서 입사일(hiredate)이 2005년1월1일 이전인 사원에 대해
--사원의 이름(ename),입사일,부서번호(deptno)를 입사일순으로 조회하시오
SELECT ename,hiredate,deptno
FROM emp
WHERE hiredate<TO_DATE('20050101','YYYY-MM-DD');
--TO_DATE('20050101');해도 되고
--TO_DATE('2005-01-01'); 해도된다

SELECT ename,hiredate,deptno
FROM emp
WHERE hiredate<'20050101'
ORDER BY hiredate;

--문)emp테이블에서 부서번호가 20번이나 30번인 부서에 속한
--사원들에 대하여 이름, 직업코드(job),부서번호를 이름순으로 조회하시오 
--(or,in연산자 각각 활용해서 모두 조회)
SELECT ename,job,deptno
FROM emp
WHERE deptno IN(20,30)
ORDER BY ename;

SELECT ename,job,deptno
FROM emp
WHERE deptno=10 OR deptno=20
ORDER BY ename;


