
SELECT * FROM tb_student;
SELECT * FROM tb_gwamok;
SELECT * FROM tb_sugang;

--세개의 테이블을 조인.
SELECT su.hakno
            ,stu.uname
            ,su.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode; --INNER 생략가능

--조인 후 정렬
SELECT su.hakno
            ,stu.uname
            ,su.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
ORDER BY su.hakno;


--문) 학번별 수강신청과목의 총 학점을 조회
--     g1001 홍길동 5학점
--     g1002 홍길동 5학점
--     g1003 개나리 3학점
--     g1004 홍길동 3학점
--     g1006 개나리 3학점

--내가 한거는 이름을 못구하게땅
SELECT aa.hakno
            ,SUM(ghakjum)
FROM(
    SELECT su.hakno
                ,stu.uname
                ,su.gcode
                ,gw.gname
                ,gw.ghakjum
    FROM tb_sugang su INNER JOIN tb_student stu
    ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    ORDER BY su.hakno
) aa
GROUP BY aa.hakno;

--선생님이 하신 방법
--GROUP BY 를 두번할수 있는걸 기억하자!!!
SELECT su.hakno
            ,stu.uname
            ,SUM(ghakjum)
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno, stu.uname
ORDER BY hakno;

--다른방법
SELECT aa.hakno
            ,aa.총학점
            ,stu.uname
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS 총학점
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
ORDER BY aa.hakno;



--문) 디자인 교과목 대상으로 학번별 수강신청과목의 총학점 조회

SELECT stu.hakno
            ,stu.uname
            ,SUM(gw.ghakjum)
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode LIKE 'd%'
GROUP BY stu.hakno,stu.uname;


--선생님이 하신 방법
--걸러낸다음 JOIN
SELECT hakno,gcode
FROM tb_sugang
WHERE gcode LIKE 'd%';
--학점을 JOIN
SELECT aa.hakno
            ,aa.gcode
            ,gw.ghakjum
FROM(
    SELECT hakno,gcode
    FROM tb_sugang
    WHERE gcode LIKE 'd%'
) aa JOIN tb_gwamok gw
ON aa.gcode=gw.gcode;
--같은 학번끼리 총 학점
SELECT bb.hakno
            ,SUM(ghakjum)
FROM(
    SELECT aa.hakno
                ,aa.gcode
                ,gw.ghakjum
    FROM(
        SELECT hakno,gcode
        FROM tb_sugang
        WHERE gcode LIKE 'd%'
    ) aa JOIN tb_gwamok gw
    ON aa.gcode=gw.gcode
) bb
GROUP BY bb.hakno;
--이름을 넣기 위해 학생테이블과의 JOIN
SELECT cc.hakno
            ,cc.총학점 
            ,stu.uname
FROM(
    SELECT bb.hakno
                ,SUM(ghakjum) 총학점
    FROM(
        SELECT aa.hakno
                    ,aa.gcode
                    ,gw.ghakjum
        FROM(
            SELECT hakno,gcode
            FROM tb_sugang
            WHERE gcode LIKE 'd%'
        ) aa JOIN tb_gwamok gw
        ON aa.gcode=gw.gcode
    ) bb
    GROUP BY bb.hakno
) CC JOIN tb_student stu
ON cc.hakno=stu.hakno;
--간단하게 줄여보기
SELECT su.hakno
            ,su.gcode
            ,gw.ghakjum
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE su.gcode LIKE 'd%';
--마지막..
SELECT bb.hakno
            ,bb.총학점
            ,stu.uname
FROM( 
    SELECT aa.hakno
                ,SUM(aa.ghakjum) 총학점
    FROM(
         SELECT su.hakno
                    ,su.gcode
                    ,gw.ghakjum
        FROM tb_sugang su JOIN tb_student stu
        ON su.hakno=stu.hakno JOIN tb_gwamok gw
        ON su.gcode=gw.gcode
        WHERE su.gcode LIKE 'd%'
     ) aa 
     GROUP BY aa.hakno
 )bb JOIN tb_student stu
 ON bb.hakno=stu.hakno;


--------------------------------------------------------------------------------------------------

--문) 과목코드 p001을 신청한 학생들의 명단을 조회
--예시)
--p001 OOP g1002 홍길동
--p001 OOP g1004 홍길동

SELECT gw.gcode
            ,stu.hakno
            ,stu.uname
            ,gw.gname
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode='p001'
GROUP BY stu.hakno,stu.uname,gw.gname,gw.gcode;

--선생님이 하신 방법
SELECT gw.gcode
            ,stu.hakno
            ,stu.uname
            ,gw.gname
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode='p001';
--GROUP BY안해도 되넹..?




---------------------------------------------------------------------------------------------------------


--문) 프로그램 교과목중에서 학점이 제일 많은 과목을 신청한 학생들 명단을 조회

--선생님이 하신 방법

--과목테이블에서 프로그램 교과목 찾기
SELECT *
FROM tb_gwamok
WHERE gcode LIKE 'p%';
--학점이 제일 높은거 찾기
SELECT MAX(ghakjum)
FROM tb_gwamok
WHERE gcode LIKE 'p%';
--프로그램 교과목중에서 가장 많은 학점을 가진 교과목들 조회
SELECT gcode
            ,ghakjum
FROM tb_gwamok
WHERE ghakjum=(SELECT MAX(ghakjum)
                FROM tb_gwamok
                WHERE gcode LIKE 'p%') 
AND gcode LIKE 'p%';

--프로그램 교과목중에서 학점이 제일 많은 과목을 신청한 학생들 명단을 조회
SELECT aa.gcode
            ,stu.hakno
            ,stu.uname
FROM (
    SELECT gcode
                ,ghakjum
    FROM tb_gwamok
    WHERE ghakjum=(SELECT MAX(ghakjum)
                    FROM tb_gwamok
                    WHERE gcode LIKE 'p%') 
    AND gcode LIKE 'p%'
) aa JOIN tb_sugang su
ON aa.gcode=su.gcode JOIN tb_student stu
ON su.hakno=stu.hakno;

--선생님이 하신 방법
SELECT tb_sugang.gcode
            ,tb_sugang.hakno
FROM tb_sugang
WHERE gcode IN (SELECT gcode
                FROM tb_gwamok
                WHERE ghakjum=(SELECT MAX(ghakjum)
                                FROM tb_gwamok
                                WHERE gcode LIKE 'p%') 
                AND gcode LIKE 'p%');

--이름까지 출력

SELECT aa.gcode
            ,aa.hakno
            ,stu.uname
FROM (
    SELECT tb_sugang.gcode
                ,tb_sugang.hakno
    FROM tb_sugang
    WHERE gcode IN (SELECT gcode
                    FROM tb_gwamok
                    WHERE ghakjum=(SELECT MAX(ghakjum)
                                    FROM tb_gwamok
                                    WHERE gcode LIKE 'p%') 
                    AND gcode LIKE 'p%')
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno;
   
   

------------------------------------------------------------------------------------------------------------

SELECT * FROM tb_sugang ORDER BY hakno;
SELECT * FROM tb_student ORDER BY hakno;
    
--문) 수강신청을 하지 않은 학생들의 명단 조회


SELECT hakno
FROM tb_sugang
GROUP BY hakno;
--수강신청을 한 학생들
SELECT hakno
            ,uname
FROM tb_student
WHERE hakno IN (SELECT hakno
                FROM tb_sugang
                GROUP BY hakno);
--수강신청 하지 않은 학생들
SELECT hakno
            ,uname
FROM tb_student
WHERE hakno NOT IN (SELECT hakno
                                    FROM tb_sugang
                                    GROUP BY hakno);




--1) INNER JOIN (내부조인)
--두 테이블에 공통으로 존재하는 칼럼을 이용하는 방식. 생략가능
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu INNER JOIN tb_sugang su
ON stu.hakno=su.hakno;
-->알수 없는 정보는 수강신청하지않은 애들은 알 수 없음( 공통적인것만 나오니까)
-->일치하는 정보만 보임



--2) LEFT OUTER JOIN
--왼쪽 테이블의 모든 데이터와 오른쪽 테이블의 동일 데이터를 추출
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu LEFT OUTER JOIN tb_sugang SU --OUTER 생략가능
ON stu.hakno=su.hakno;
-->왼쪽에 있는건 일치하지 않더라도 데이터를 가져오는거. 
-->stu.hakno에 있는건 그러니까 tb_student는 왼쪽에 있으니 
-->stu.hakno=su.hakno 일치하지 않더라도 무조건 가져오기


--RIGHT OUTER JOIN
--오른쪽 테이블의 모든 데이터와 왼쪽 테이블의 동일 데이터를 추출
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu RIGHT OUTER JOIN tb_sugang SU --OUTER 생략가능
ON stu.hakno=su.hakno;




--문) 수강신청 하지 않은 과목들을 조회
SELECT *
FROM tb_sugang;
SELECT *
FROM tb_gwamok;

SELECT *
FROM tb_gwamok gw LEFT JOIN tb_sugang su
ON gw.gcode=su.gcode
ORDER BY gw.gcode;


--선생님이 하신 방법

--수강신청한 과목
SELECT gcode
FROM tb_sugang
GROUP BY gcode;

--1) 수강신청하지 않은 과목
SELECT gcode
            ,gname
FROM tb_gwamok
WHERE gcode NOT IN (SELECT gcode
                                    FROM tb_sugang
                                    GROUP BY gcode);

--2) LEFT JOIN 사용
SELECT gw.gcode
            ,gw.gname
            ,gw.ghakjum
            ,su.gcode
FROM tb_gwamok gw LEFT JOIN tb_sugang su
ON gw.gcode=su.gcode
WHERE su.gcode IS NULL;




--3) RIGHT JOIN 사용
SELECT su.gcode
            ,gw.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su RIGHT JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE su.gcode IS NULL;



--LEFT JOIN
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_student stu LEFT JOIN tb_sugang su
ON stu.hakno=su.hakno;
-->다른방법
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_student stu , tb_sugang su
WHERE stu.hakno=su.hakno(+);


--RIGHT JOIN
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_sugang su RIGHT JOIN tb_student stu
ON su.hakno=stu.hakno;
-->다른방법
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_sugang su , tb_student stu
WHERE su.hakno(+)=stu.hakno;















