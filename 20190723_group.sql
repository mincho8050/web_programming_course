

SELECT ename,deptno
FROM emp;

--GROUP BY 는 집계함수와 많이 사용
--집계함수
-- : SUM() , AVG() , MAX() , MIN() , COUNT()

--문) 부서코드별로 급여정보 조회하기
SELECT deptno
FROM emp
GROUP BY deptno;

SELECT deptno
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT deptno,ename --에러
FROM emp
GROUP BY deptno
ORDER BY deptno;


SELECT deptno   AS 부서코드
            ,SUM(sal)
            ,ROUND(AVG(sal))
            ,MAX(sal)
            ,MIN(sal)
            ,COUNT(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;


--부서코드별 급여합계를 구하시오
SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno;

--HAVING 조건절
--GROUP BY에 사용하는 조건!!

--부서코드별 급여합계를 구해서
--그 합계값이 1500이상만 조회하시오
SELECT deptno,SUM(sal) AS 급여합계
FROM emp
GROUP BY deptno
HAVING SUM(sal)>=1500;

--에러 
--실행순서상 에러
SELECT deptno,SUM(sal) AS 급여합계  --실행순서 4번
FROM emp                --실행순서 1번
GROUP BY deptno     --실행순서 2번
HAVING 급여합계>=1500;--실행순서 3번

--급여가 300이상 데이터중에서
--부서코드별 급여평균을 구해서 급여순으로 조회하시오
SELECT AVG(sal) , COUNT(sal) --11
FROM emp;   --328 > 전체가 대상

SELECT AVG(sal)  , COUNT(sal) --7
FROM emp
WHERE sal>=300; --398 > WHERE 조건절을 사용해 일부분만 추출

--부서별 급여평균이 300이상 조회
SELECT AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=300;

--급여가 300이상 데이터중에서 
--부서코드별 급여평균을 구해서 급여순으로 정렬
SELECT deptno , AVG(sal)
FROM emp
WHERE sal>=300
GROUP BY deptno
ORDER BY AVG(sal);  --378,413


--급여가 300이상 데이터중에서
--부서코드별 급여평균이 400 이상을
--급여순으로 조회하시오
SELECT deptno,AVG(sal)     --5번째
FROM emp  --1번째
WHERE sal>=300--2번째
GROUP BY deptno--3번째
HAVING AVG(sal)>=400    --4번째
ORDER BY AVG(sal); --413 ,6번째

--문) 부서별 급여총액(급여+커미션)이 가장 높은 급여총액과 가장 낮은 급여총액,
--급여총액의 평균금액을 반올림해서 소수점 1자리까지 출력하시오
SELECT sal+NVL(comm,0) --null값은 계산하면 null이 나옴
FROM emp;
--MySQL 은 IFNULL이란 함수가 있다(NVL 대신-Oracle함수임)
SELECT deptno
            ,MAX(sal+NVL(comm,0)) 
            ,MIN(sal+NVL(comm,0))
            ,ROUND(AVG(sal+NVL(comm,0)),1)
FROM emp
GROUP BY deptno
ORDER BY deptno;




SELECT hiredate FROM emp;

--문) hiredate칼럼을 사용하여 월별로 입사한 인원수를 구하시오
--TO_CHAR(날짜,'출력형식)
--날짜자료형의 데이터를 문자변환 함수
SELECT TO_CHAR(hiredate,'mm')
FROM emp;

SELECT TO_CHAR(hiredate,'mm') || '월'
FROM emp;

SELECT TO_CHAR(hiredate,'mm'),COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate,'mm')
ORDER BY TO_CHAR(hiredate,'mm');

