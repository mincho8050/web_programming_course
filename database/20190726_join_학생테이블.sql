--------------------------------------------------------------------------------------------------------------------------------
--[학사관리 프로그램]

--                       교차테이블
--학생테이블       --  수강  --          과목테이블
--    1                                                   n
--    n                                                   1
--    n                                                   m     :   다대다 관계 / 교차테이블 필요
--회원테이블       --  예매  --          영화테이블
--    1                                                   n
--    m                                                  1
--    n                                                   m
--회원테이블       --  구매  --          상품테이블
--회원테이블       --  구매  --          도서테이블

--1:1 관계
--직원<->부서
--학교<->학생
--시립유치원<->유치원생



------------------------------------------------------------------------------------------------------------------------------------------------------
--학생테이블
CREATE TABLE tb_student (
    hakno CHAR(5) PRIMARY KEY
    ,uname VARCHAR(20) NOT NULL
    ,email VARCHAR(50) UNIQUE
    ,address VARCHAR(20) NOT NULL
    ,phone VARCHAR(20)
    ,regdt DATE DEFAULT SYSDATE
);


--학생테이블 추가
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1001','홍길동','11@naver.com','서울','111-2222');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1002','홍길동','22@daum.net','제주','331-2223');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1003','개나리','33@naver.com','서울','111-2224');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1004','홍길동','44@soldesks.com','부산','222-2225');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1005','진달래','55@naver.com','서울','445-2226');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1006','개나리','66@soldsks.com','제주','331-2227');

SELECT * FROM tb_student;
--레코드 갯수
SELECT COUNT(*) FROM tb_student;


--문) 지역별 인원수를 인원수순으로 조회
SELECT address , COUNT(*)
FROM tb_student
GROUP BY address
ORDER BY COUNT(*);
--문) 동명이인이 몇명인지 조회
SELECT uname , COUNT(*) || '명'
FROM tb_student
GROUP BY uname;



---------------------------------------------------------------------------------------------------------



--과목테이블 생성
CREATE TABLE tb_gwamok(
    gcode CHAR(5) PRIMARY KEY       --과목코드
    ,gname VARCHAR(20) NOT NULL     --과목명
    ,ghakjum NUMBER(2) DEFAULT 1    --학점
    ,regdt DATE DEFAULT SYSDATE         --등록일 / 역추적하기위해서 넣음
);
--과목테이블 행 추가
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p001', 'OOP', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p002', 'Oracle', 2);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p003', 'JSP', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d001', '웹표준', 1);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d002', '포토샵', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d003', 'HTML', 1);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('c001', '실내건축', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p004', 'JavaScript', 2);

SELECT * FROM tb_gwamok;
--레코드의 갯수
SELECT COUNT(*) FROM tb_gwamok;

--문) 학생테이블의 학번, 이름, 주소를 조회하시오
--(주소는 영문으로 출력)
SELECT hakno 
            ,uname
            ,CASE WHEN address='서울' THEN 'Seoul'
                        WHEN address='제주' THEN 'Jeju'
                        WHEN address='부산' THEN 'Busan'
            END eng_address
FROM tb_student;

--문) 주소별 인원수가 3명 미만 행을 조회
SELECT address, COUNT(*)
FROM tb_student
GROUP BY address
HAVING COUNT(*) <3;

--문) 프로그램 교과목만 조회
SELECT gcode, gname, ghakjum
FROM tb_gwamok
WHERE gcode LIKE 'p%';

--문) 디자인 교과목중 3학점만 조회
SELECT *
FROM(
    SELECT *
    FROM tb_gwamok
    WHERE gcode LIKE 'd%'
) 
WHERE ghakjum =3;

--선생님방식
SELECT *
FROM tb_gwamok
WHERE gcode LIKE 'd%' AND ghakjum=3; 


--문) 프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목을 조회
SELECT AVG(ghakjum)
FROM tb_gwamok
WHERE gcode LIKE 'p%';  --학점평균:2.5

SELECT *
FROM tb_gwamok
WHERE ghakjum<(SELECT AVG(ghakjum)
                            FROM tb_gwamok
                             WHERE gcode LIKE 'p%') 
AND  gcode LIKE 'p%';




---------------------------------------------------------------------------------------------------------

--수강 테이블 생성
CREATE TABLE tb_sugang(
    sno NUMBER PRIMARY KEY  --일련번호
     ,hakno CHAR(5) --학번 , 부모테이블과 동일하게! (학생테이블의 학번)
    ,gcode CHAR(5) --과목코드 , 부모테이블과 동일하게 (과목테이블의 과목코드)
    --제약조건을 이렇게 따로 작성할 수도 있음
   -- ,PRIMARY KEY(sno)
    ,FOREIGN KEY(hakno) REFERENCES tb_student(hakno) 
    ,FOREIGN KEY(gcode) REFERENCES tb_gwamok(gcode)
);

--옵션
--    ON UPDATE CASCADE--부모테이블이 업데이트를 하면 같이 업데이트
--    ON DELETE NO ACTION --부모테이블이 삭제되면 부모테이블만 삭제 /CASCADE는 같이 삭제

--수강테이블 시퀀스 생성
CREATE SEQUENCE sugang_seq;

--수강테이블 행추가
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1002','p001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1004','p001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1003','d002');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1001','p004');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1001','c001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1006','d002');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1002','p004');


SELECT COUNT(*) FROM tb_sugang;
SELECT * FROM tb_sugang;


--수강테이블과 학생테이블
--1차적인 방식
SELECT tb_sugang.hakno
            ,tb_sugang.gcode
            ,tb_student.uname
FROM tb_sugang JOIN tb_student
ON tb_sugang.hakno=tb_student.hakno;
--ALIAS이용
SELECT SU.hakno
            ,SU.gcode
            ,STU.uname
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno;

--수강테이블과 과목테이블
SELECT SU.hakno
            ,SU.gcode
            ,GW.gname
            ,GW.ghakjum
FROM tb_sugang SU JOIN tb_gwamok GW
ON SU.gcode=GW.gcode;


--수강테이블을 기준으로 학생테이블, 과목테이블 조인

SELECT SU.hakno
            ,SU.gcode
            ,STU.uname
            ,GW.gname
            ,GW.ghakjum
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno JOIN tb_gwamok GW
ON SU.gcode=GW.gcode;

SELECT * FROM tb_student;
SELECT * FROM tb_gwamok;
SELECT * FROM tb_sugang;

--문) 수강신청을 한 학생들 중에서 '제주'에 사는 학생들만
--학번, 이름, 주소 조회
SELECT SU.hakno
            ,STU.uname
            ,STU.address
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
WHERE address='제주';


--문) 지역별로 수강신청 인원수 지역을 조회하시오
--예시
--서울 5
--제주 3
--부산 1

SELECT address
            ,COUNT(*)
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
GROUP BY address
ORDER BY COUNT(*) DESC;

--선생님이 하신 방법
select SU.hakno, STU.uname, STU.address
from tb_sugang SU join tb_student STU
on SU.hakno=STU.hakno
order by STU.address;


select address, count(*)
from(
     select SU.hakno, STU.uname, STU.address
     from tb_sugang SU join tb_student STU
     on SU.hakno=STU.hakno
    )AA
group by AA.address;


select address, hakno, count(*)
from(
     select SU.hakno, STU.uname, STU.address
     from tb_sugang SU join tb_student STU
     on SU.hakno=STU.hakno
    )AA
group by AA.address, AA.hakno;



--문) 과목별 수강 신청 인원수, 과목코드, 과목명 조회
--예시
--p001 2 OOP
--p002 1 Oracle
--p003 1 JSP
--d001 1 웹표준

SELECT AA.gcode
            ,AA.cnt
            ,gname
FROM(
    SELECT gcode
                ,COUNT(gcode) AS cnt
    FROM tb_sugang
    GROUP BY gcode
) AA JOIN tb_gwamok GW
ON AA.gcode=GW.gcode
ORDER BY AA.gcode;



--문제) 지역별로 수강신청 인원수, 지역을 조회하시오
--(중복되는 사람은 1로 처리)
--예시(실제값이랑 다를 수 있음)
--부산1
--제주2
--서울2

SELECT SU.hakno, STU.address
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
ORDER BY STU.address;

SELECT AA.address
            ,COUNT(*)
FROM (
    SELECT SU.hakno, STU.address
    FROM tb_sugang SU JOIN tb_student STU
    ON SU.hakno=STU.hakno
    ORDER BY STU.address
) AA
GROUP BY AA.address; --중복된것도 그냥 카운트


--선생님이 하신 것
SELECT STU.address, SU.hakno
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
GROUP BY STU.address, SU.hakno;

SELECT AA.address , COUNT(AA.address)
FROM(
    SELECT STU.address, SU.hakno
    FROM tb_sugang SU JOIN tb_student STU
    ON SU.hakno=STU.hakno
    GROUP BY STU.address, SU.hakno
) AA
GROUP BY AA.address;




