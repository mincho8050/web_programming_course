

--[오라클 함수]

--ASCII문자변환
SELECT CHR(65) FROM dual;   --A
SELECT CHR(97) FROM dual;   --a

--|| 결합연산자
--A || B -> A와 B를 연결시킴
SELECT ename || '의 직급은 ' ||  job || '입니다'
FROM emp;

--CONCAT(칼럼명,'문자열')
--칼럼에 해당하는 문자열을 붙임
SELECT CONCAT(ename,'의 직급은'),job
FROM emp;
SELECT CONCAT('로미오와',' 줄리엣')
FROM dual;

--SYSDATE
--시스템의 현재 날짜/시간을 리턴하는 함수
SELECT SYSDATE FROM dual;
SELECT SYSDATE+100 FROM dual;
SELECT SYSDATE-100 FROM dual;


--ROWNUM : 행(레코드) 번호
--ROWID : 행(레코드)의 주소값
--의사칼럼(모조칼럼)
SELECT empno,ename FROM emp;
SELECT ROWNUM,empno,ename FROM emp;
SELECT ROWID,empno,ename FROM emp;
SELECT ROWNUM,ROWID,empno,ename FROM emp;

--두 날짜 사이의 개월 수 계산 함수
SELECT MONTHS_BETWEEN('2019-09-01','2019-07-05') 
FROM dual; --1.87096774193548387096774193548387096774
SELECT ROUND(MONTHS_BETWEEN('2019-09-01','2019-07-05'),1)
FROM dual; --1.9

--TO_DATE('날짜문자열')
--문자열을 날짜형으로 변환
SELECT TO_DATE('2019-05-20')
FROM dual;
SELECT TO_DATE('2019-05-20')-TO_DATE('2019-05-05')
FROM dual;  --15

--TO_CHAR(날짜,'출력형식')
--날짜자료형의 데이터를 문자변환 함수
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH:MI:SS DAY')
FROM dual;  --2019-07-22 오후 04:26:09 월요일
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH24:MI:SS DAY')
FROM dual; --2019-07-22 오후 16:26:23 월요일 ->24시간 기준

--숫자변환 함수
--TO_NUMBER('숫자 형태의 문자열')
--내부적으로 TO_NUMBER()가 호출됨
SELECT 100+10, 100-10,100*10,100/10
FROM dual;
SELECT '100'+1 FROM dual;   --101

--숫자함수
--TRUNC(숫자1,자리수)
--버림, 숫자1을 소수점 자리수에서 잘사
--ROUND(숫자1,자리수)
--숫자1을 소수점 자리수에서 반올림
--CEIL(숫자1)
--올림

--급여평균, 급여합계, 최고급여, 최저급여, 갯수
SELECT
    AVG(sal),
    SUM(sal),
    MAX(sal),
    MIN(sal),
    COUNT(sal) --NULL은 카운트 안함
FROM
    emp;

SELECT ROUND(AVG(sal),2)    --소수 둘째 자리에서 반올림
            ,CEIL(AVG(sal))           --올림
            ,TRUNC(AVG(sal),1)      --소수 첫째자리에서 버림
FROM emp;

--문) 각 직원들에 대해서 직원의 이름과 근속연수를 구하시오
--단, 근속연수는 연단위를 버림하여 나타내시오
SELECT ename
            ,TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12,0) AS 근속연수
FROM emp;

SELECT ename
            ,TRUNC(
                (SYSDATE-hiredate)/365
             )   --(숫자1,0)이라고 안해도 나옴!
FROM emp;            


--DECODE(A,B,A==B일 때의 값, A<>B일 때의 값)
--A<>B일 때의 값을 생략하면 NULL로 처리됨
--DECODE함수의 매개변수의 갯수는 다중조건에 의해 늘어날 수 있음

--예)주민번호를 이용해 성별출력
--SQL문 index는 1부터 시작(java는 0부터 시작!! 주의하자)
SELECT SUBSTR('8912303',7,1) FROM dual; --3
SELECT DECODE(SUBSTR('8912303' ,7 ,1) ,3 ,'남자' ,'여자')
FROM dual;


--문) 각 직원의 이름, 직급, 급여를 나타내되 단 급여는
--5자리로 나타내며 부족한 자리수는 '*'로 표시한다
--월급이 300이상인 직원만 나타내시오
SELECT ename, job, LPAD(sal, 5, '*')
FROM emp
WHERE sal>=300;

--문) 각 직원들에 대해서 직원의 이름과 근무개월수를 나타내는데
--근무개월수가 100개월 이상인 직원만 나타내시오
--근무개월수는 소수 부분을 제외한 정수 부분만 나타내시오
SELECT
    ename,
    trunc(months_between(SYSDATE, hiredate))
FROM
    emp
WHERE
    trunc(months_between(SYSDATE, hiredate)) >= 100;



--문) 전체 직원에 대하여 직원의 이름과 직급, 총 근무주(week)수를 구하시오
--단, 근무주수가 많은 직원부터 나타내고, 근무주수가 같으면 이름에 대하여 오름차순 정렬하시오
SELECT
    ename,
    job,
    trunc((SYSDATE - hiredate) / 7)
FROM
    emp
ORDER BY
    trunc((SYSDATE - hiredate) /7) DESC,
    ename ASC;



















