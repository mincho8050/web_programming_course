

--ROWNUM : 행번호
--ROWID : 행의 주소값

--줄번호
SELECT ROWID
            ,ROWNUM
            ,hakno
            ,uname
FROM tb_student;

--정렬 후 줄번호
SELECT ROWID
            ,ROWNUM
            ,hakno
            ,uname
FROM tb_student
ORDER BY hakno;


--에러
SELECT address
            ,ROWNUM
FROM tb_student
GROUP BY address;

--줄 번호 1~3사이 조회
SELECT ROWNUM
            ,hakno
            ,uname
FROM tb_student
WHERE ROWNUM>=1 AND ROWNUM<=3;

--줄번호 4~6사이 조회(조회안됨)
SELECT ROWNUM
            ,hakno
            ,uname
FROM tb_student
WHERE ROWNUM>=4 AND ROWNUM<=6;


--셀프조인후 행번호 추가
SELECT addr
            ,ROWNUM
FROM(SELECT address AS addr
            FROM tb_student
            GROUP BY address);

--줄번호 4~6 조회
SELECT hakno
            ,uname
            ,address
FROM tb_student
ORDER BY hakno;

SELECT ROWNUM rnum
            ,hakno
            ,uname
            ,address
FROM (
    SELECT hakno
                ,uname
                ,address
    FROM tb_student
    ORDER BY hakno
);
--모조칼럼 ROWNUM을 실제칼럼으로 인식시킨 후 
--다른 명령어와 병행해서 사용한다(셀프조인 후 사용할 것)
SELECT rnum
            ,hakno
            ,uname
            ,address
FROM(
    SELECT ROWNUM rnum
                ,hakno
                ,uname
                ,address
    FROM (
        SELECT hakno
                    ,uname
                    ,address
        FROM tb_student
        ORDER BY hakno
    )
)
WHERE rnum>=4 AND rnum<=6;


----------------------------------------------------------------------------------------


--문) 학번별 수강신청 총 학점을 구하고
--총 학점 순으로 정렬 후 위에서 부터 3건만 조회하기
--(학번, 이름, 총학점)

--과목 코드별 학점 가져오기
SELECT su.hakno
            ,su.gcode
            ,gw.ghakjum
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode;

--학번별로 총학점 구하기
SELECT su.hakno
            ,SUM(gw.ghakjum) AS 총학점
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno;

--총학점순으로 정렬하기
SELECT su.hakno
            ,SUM(gw.ghakjum) AS 총학점
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno
ORDER BY SUM(gw.ghakjum) DESC;

--학생이름 가져오고 , 행번호 출력하기
SELECT aa.hakno
            ,aa.총학점
            ,stu.uname
            ,ROWNUM
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS 총학점
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
    ORDER BY SUM(gw.ghakjum) DESC
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
ORDER BY aa.hakno;

--위에서부터 3건 출력하기
SELECT aa.hakno
            ,aa.총학점
            ,stu.uname
            ,ROWNUM
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS 총학점
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
    ORDER BY SUM(gw.ghakjum) DESC
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
WHERE ROWNUM>=1 AND ROWNUM<=3;


--행번호 4~6 출력하기

--데이터 추가
SELECT *
FROM tb_sugang;
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1005','c001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1005','d003');
--학생테이블도 추가하자..
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1007','박지성','77@naver.com','서울','445-4521');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1008','김연이','88@soldsks.com','부산','754-1235');

--ROWNUM은 모조 칼럼이기 때문에 조건절에 직접 사용하지 말고
--실제 칼럼으로 인식한 후 사용할 것을 추천
SELECT hakno
            ,총학점
            ,uname
            ,rnum
FROM (
    SELECT aa.hakno
                ,aa.총학점
                ,stu.uname
                ,ROWNUM AS rnum
    FROM(
        SELECT su.hakno
                    ,SUM(gw.ghakjum) AS 총학점
        FROM tb_sugang su JOIN tb_gwamok gw
        ON su.gcode=gw.gcode
        GROUP BY su.hakno
        ORDER BY SUM(gw.ghakjum) DESC
    ) aa JOIN tb_student stu
    ON aa.hakno=stu.hakno
) bb 
WHERE bb.rnum>=4 AND bb.rnum<=6;



------------------------------------------------------------------------------------------------------------------------


--문) 학번별 수강신청한 총학점을 조회하시오
--(단, 수강신청하지 않은 학생의 총학점도 0으로 표시)
--예시)>구조만확인 실제값은 다름.
--g1001 홍길동 8
--g1002 무궁화 6
--g1003 진달래 0


SELECT *
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode;

--RIGHT JOIN 사용
SELECT stu.hakno
            ,stu.uname
            ,SUM(NVL(aa.ghakjum,0)) AS 총학점
FROM (
    SELECT *
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
) aa RIGHT JOIN tb_student stu
ON aa.hakno=stu.hakno
GROUP BY stu.hakno , stu.uname
ORDER BY stu.hakno;





--문) 학생테이블에서 학번순으로 정렬 후 행번호를 아래와 같이 붙여서 조회하시오
--예시)> 실제값은 이거와 동일하지 않음 구조만 확인
--    8  g1001	홍길동	hong1@naver.com	  서울	111-5588	19/07/26
--    7  g1002	홍길동	hong2@soldesk.com 제주	331-2223	19/07/26
--    6  g1003	개나리	user1@daum.net	  서울	111-2224	19/07/26
--    5  g1004	홍길동	hong3@naver.com	  부산	222-2255	19/07/26
--    4  g1005	진달래	user2@soldesk.com 서울	445-2277	19/07/26
--    3  g1006	개나리	user3@naver.com	  제주	578-5588	19/07/26
--    2  g1007	김연아	user7@naver.com	  제주	578-5588	19/07/30
--    1 g1008	박지성	user8@naver.com	제주	578-5588	19/07/30

SELECT *
FROM tb_student
ORDER BY hakno;


SELECT ROWNUM  AS rnum
            ,hakno
            ,uname
            ,email
            ,address
            ,phone
            ,regdt
FROM tb_student
ORDER BY rnum DESC;


SELECT ROW_NUMBER() OVER ( ORDER BY hakno DESC) AS rnum
            ,hakno
            ,uname
            ,email
            ,address 
            ,phone
            ,regdt
FROM tb_student
ORDER BY rnum DESC;


--선생님이 하신 방법
SELECT hakno
            ,uname
            ,ROWNUM AS rnum
FROM (
    SELECT hakno
                ,uname
    FROM tb_student
    ORDER BY hakno DESC
)
ORDER BY rnum DESC;
--ROWNUM 모조칼럼을 실제칼럼으로 추가
SELECT hakno
            ,uname
            ,rnum
FROM (
    SELECT hakno
                ,uname
                ,ROWNUM AS rnum
    FROM (
        SELECT hakno
                    ,uname
        FROM tb_student
        ORDER BY hakno DESC
    )
)
ORDER BY rnum DESC;


