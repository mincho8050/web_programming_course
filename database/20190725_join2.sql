

--테이블 조인

--테이블 2개 조인
SELECT t1.*, t2.*
FROM t1 JOIN t2
ON t1.x=t2.x;

--테이블 3개 조인
SELECT t1.*, t2.*, t3.*
FROM t1 JOIN t2
ON t1.x=t2.x JOIN t3
ON t1.y=t3.y;

--테이블 4개 조인
SELECT t1.x , t2.y , t3.z, t4.* 
FROM t1 JOIN t2
ON t1.x=t2.x JOIN t3
ON t1.y=t3.y JOIN t4
ON t1.z=t4.z;

---------------------------------------------------------------------------------


--부서테이블
SELECT * FROM dept;
--직원 테이블
SELECT * FROM emp;

--문) 아래의 조건과 같이 커미션을 구하시오
-- 사원 : 급여*0.03 / 주임 : 급여*0.02 / 과장 : 급여*0.01
UPDATE emp 
SET comm=sal*0.03
WHERE job='사원';
UPDATE emp 
SET comm=sal*0.02
WHERE job='주임';
UPDATE emp 
SET comm=sal*0.01
WHERE job='과장';

--직원테이블에 부서명을 출력하기

--emp, dept테이블의 모든 칼럼 출력
SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
--emp, dept테이블의 모든 칼럼 출력
SELECT emp.* , dept.*
FROM emp JOIN dept
ON emp.deptno = dept.deptno;
--테이블명.칼럼명 조회
SELECT emp.empno 
            ,emp.ename
            ,emp.deptno
            ,dept.deptno
            ,dept.dname
FROM emp JOIN dept
ON emp.deptno = dept.deptno;
--2개 테이블에 중복되지 않은 칼럼명은 생략가능
--SELECT empno
--            ,ename
--            ,deptno --column ambiguously defined 오류
--            ,dname
--            ,loc
--FROM emp JOIN dept
--ON emp.deptno = dept.deptno;
--2개 테이블에 중복되는 칼럼명을 테이블명을 명시해야함!
SELECT empno
            ,ename
            ,dept.deptno --조건으로 썼던거기 때문에 emp 테이블이든, dept테이블이든 이런식으로 출력해야한다!
            ,dname
            ,loc
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

--테이블 별칭 ALIAS
SELECT em.* , de.*
FROM emp em, dept de
WHERE em.deptno=de.deptno;

SELECT em.* , de.*
FROM emp em JOIN dept de
ON em.deptno=de.deptno;

SELECT empno
            ,ename
            ,em.deptno
            ,dname
            ,loc
FROM emp em JOIN dept de
ON em.deptno=de.deptno;

--논리적 테이블을 aa별칭을 통해 새로운 테이블로 가공할 수 있다
--ALIAS가 여기까지 허용
SELECT aa.*
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;
--이렇게도 작성 가능
SELECT aa.empno
            ,aa.ename
            ,aa.deptno
            ,aa.dname
            ,aa.loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;
--조회테이블별칭 aa 생략가능
SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
ORDER BY aa.ename;

SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc --2)
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa --1)
ORDER BY aa.ename; --3)




---------------------------------------------------------------------------------





--문) 각 부서의 인원수를 인원수순으로 아래와 같이 조회하시오
-- 연구팀 5명 , 총무팀 4명, 경리팀 2명
SELECT dname,COUNT(*) || '명' cnt
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY dname
ORDER BY COUNT(*) DESC;


--문) 각 부서별 급여, 커미션의 합계를 구한 후
--급여합계순으로 아래와 같이 조회하시오
--총무팀 1655 413
--연구팀 1535 307
-- 경리팀 425 212
SELECT *
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT dname
            ,SUM(sal)
            ,SUM(NVL(comm,0))
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY dname
ORDER BY SUM(sal) DESC; 

--선생님방식1
--조인 후 합계
SELECT EM.sal
            ,EM.comm
            ,EM.deptno
            ,DE.dname
FROM emp EM JOIN dept DE
ON EM.deptno=DE.deptno;

SELECT AA.dname 
            ,SUM(sal)   급여합계
            ,SUM(NVL(comm,0)) 커미션합계
FROM(
    SELECT EM.sal
                ,EM.comm
                ,EM.deptno
                ,DE.dname
    FROM emp EM JOIN dept DE
    ON EM.deptno=DE.deptno
) AA
GROUP BY AA.dname
ORDER BY SUM(sal) DESC;

--선생님방식2
--합계 후 조인
SELECT deptno
            ,SUM(sal)
            ,SUM(NVL(comm,0))
FROM emp
GROUP BY deptno;

SELECT AA.*
            ,DE.dname
FROM(
    SELECT deptno
            ,SUM(sal) hap1
            ,SUM(NVL(comm,0)) hap2
    FROM emp
    GROUP BY deptno
) AA JOIN dept DE
ON AA.deptno=DE.deptno
ORDER BY hap1 DESC;

----------------------------------------------------------------------------------------------------------------------------------




--문) 각 지역별 커미션합계를 구한 후 그 커미션 합계가 20이하 지역만
--지역순으로 아래와 같이 조회하시오
--대구 15
--대전 13
SELECT *
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT loc
            ,TRUNC(SUM(comm)) 
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY loc
HAVING TRUNC(SUM(comm))<=20
ORDER BY SUM(AA.comm) DESC;


--선생님 방법
SELECT dept.loc
            ,emp.comm
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT AA.loc
            ,ROUND(SUM(NVL(AA.comm,0)),0)
FROM(
    SELECT dept.loc
                ,emp.comm
    FROM emp JOIN dept
    ON emp.deptno=dept.deptno
) AA
GROUP BY AA.loc
HAVING SUM(AA.comm)<=20
ORDER BY AA.loc;




