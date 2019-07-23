
SELECT * FROM emp;


--문)
--emp 테이블에서 월급을 가장 많이 받는 직원정보를 조회하시오
SELECT MAX(sal) FROM emp; --500

SELECT *
FROM emp
WHERE sal=(SELECT MAX(sal) FROM emp);

--문)
--평균 급여보다 많은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오
SELECT AVG(sal) FROM emp; --328

SELECT ename,deptno,sal
FROM emp
WHERE sal>(SELECT AVG(sal) FROM emp);

--문) 부서코드 10의 최고급여보다 더 많은 급여를 받는 직원목록을 조회하시오
SELECT MAX(sal) 
FROM emp 
WHERE deptno=10; --225

SELECT *
FROM emp
WHERE sal>(
                SELECT MAX(sal) 
                FROM emp 
                WHERE deptno=10
                );


--문) 손흥민과 같은 입사일에 입사한 사람들중에서
--박지성보다 급여를 적게 받는 사람의 이름, 급여, 입사일을 조회하시오

SELECT hiredate
FROM emp
WHERE ename='손흥민'; --02/01/11 
SELECT sal
FROM emp
WHERE ename='박지성'; --325

SELECT *
FROM emp
WHERE 
    hiredate=(
    SELECT hiredate
    FROM emp
    WHERE ename='손흥민'
) AND 
    sal<(
    SELECT sal
    FROM emp
    WHERE ename='박지성'
);








