

--CASE WHEN ~ THEN END 구문
--형식)
--CASE WHEN 조건1 THEN 조건만족시 값1
--        WHEN 조건2 THEN 조건만족시 값2
--        WHEN 조건3 THEN 조건만족시 값3
--        ...
--        ELSE 값
--END 결과칼럼명

SELECT * FROM sungjuk;

--문) 국어점수에 따라 A , B, C , D, F학점을 구하시오
SELECT uname
            ,kor
            ,CASE WHEN kor>=90 THEN 'A학점'
                       WHEN kor>=80 THEN 'B학점'
                       WHEN kor>=70 THEN 'C학점'
                        WHEN kor>=60 THEN 'D학점'
                       ELSE 'F학점'
            END AS grade
FROM sungjuk;  
    

--문) addr 칼럼의 주소를 한글로 조회하시오


SELECT uname
            ,addr
            ,CASE   WHEN addr='Seoul' THEN '서울'
                        WHEN addr='Jeju' THEN '제주'
                        WHEN addr='Busan' THEN '부산'
                        ELSE '수원'
                        --WHEN addr='Suwon' THEN '수원' 이렇게 작성해도됨
            END AS kor_name
FROM sungjuk;


SELECT * FROM emp;

--문) 부서코드 10 경리팀, 20 연구팀, 30 총무팀, 40 전산팀
SELECT ename
            ,deptno
            ,CASE   WHEN deptno=10 THEN '경리팀'
                        WHEN deptno=20 THEN '연구팀'
                        WHEN deptno=30 THEN '총무팀'
                        WHEN deptno=40 THEN '전산팀'
            END AS deptno_name
FROM emp;

--문) 커미션 5이상 '5%' , 4이상 '4%' 3이상 '3%' , 2이상 '2%' 나머지 '없음'
SELECT ename
            ,comm
            ,CASE   WHEN NVL(comm,0)>=5 THEN '5%'
                        WHEN NVL(comm,0)>=4 THEN '4%'
                        WHEN NVL(comm,0)>=3 THEN '3%'
                        WHEN NVL(comm,0)>=2 THEN '2%'
                        ELSE '없음'
            END AS bonus
FROM emp;

--DECODE() 함수
--값을 비교하여 해당하는 값을 돌려주는 함수. 
--단, 비교시에 정확히 같은 값(=)만 비교가 가능함
--DECODE(A, B, 같을때의 값, 다를때의 값)
SELECT ename
            ,deptno
            ,DECODE(
                deptno, 10,'경리팀'
                            ,20,'연구팀'
                            ,30,'총무팀'
            ) 부서
FROM emp;

SELECT uname, (kor+eng+mat)/3 AS aver
FROM sungjuk;

SELECT uname, ((kor+eng+mat)/3)/10 AS aver
FROM sungjuk;

SELECT uname, TRUNC(((kor+eng+mat)/3)/10) AS aver
FROM sungjuk;

SELECT uname
            ,TRUNC(((kor+eng+mat)/3)/10)
            ,DECODE(
                TRUNC(((kor+eng+mat)/3)/10),  10, 'A'
                                                                ,9, 'A'
                                                               ,8, 'B'
                                                               ,7, 'C'
                                                               ,6, 'D'
                                                               ,'F'
            ) grade
FROM sungjuk;



