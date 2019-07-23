

CREATE TABLE sungjuk (
    sno NUMBER NOT NULL PRIMARY KEY
    ,uname VARCHAR(50) NOT NULL
    ,kor NUMBER(3) NOT NULL CHECK(kor BETWEEN 0 AND 100)
    ,eng NUMBER(3) NOT NULL CHECK(eng BETWEEN 0 AND 100)
    ,mat NUMBER(3) NOT NULL CHECK(mat BETWEEN 0 AND 100)
    ,tot NUMBER(3) DEFAULT 0
    ,aver NUMBER(5,2) DEFAULT 0
    ,addr VARCHAR(30) CHECK(addr IN ('Seoul','Jeju','Suwon','Busan'))
    ,wdate DATE DEFAULT SYSDATE
);

SELECT
    *
FROM tab;

SELECT * FROM sungjuk;


--행 삽입
--DEFAULT ~으로 되어있는것은 값을 넣어주지 않으면 ~으로 나온다
--DEFAULT: 칼럼에 데이터가 입력되지 않은 경우 자동으로 입력된다
INSERT INTO sungjuk(sno,uname,kor,eng,mat,addr)
VALUES(1,'손흥민',77,88,99,'Seoul');

--[관계형 DB에서 테이블의 핵심기능]
--C CREATE      -> INSERT문
--R READ         -> SELECT문
--U UPDATE     -> UPDATE문
--D DELETE      -> DELETE문

--시퀀스나 아이덴티티는 화면상 노출이 목표가 아니라 WHERE조건을 쓰기 위함


------------------------------------------------------------------------------------------------------------------------------------------------



--자동으로 일련번호 부여
--시퀀스나 아이덴티티는 화면상 노출이 목표가 아니라 WHERE조건을 쓰기 위함
--Oracle : 시퀀스
--MySQL : IDENTITY

--[시퀀스(sequence)]
-----------------------------------------------------------------------------------------
--1) 정의
-- 연속적인 숫자값을 자동으로 증가시키는 숫자를 발생시키는 객체

--2) 생성
--create sequence 시퀀스이름
 --[increment by 숫자]
 --[start with 숫자]
 --[maxvalue 숫자]
 --[minvalue 숫자]
 --[cycle | nocycle] --일련번호 순환여부
 --[cache | nocache] --빠른 처리를 위해 시퀀스의 값을 메모리에 저장(미리 발급해 놓고 나누어 줌)
                                --서버가 껐다켜지면 중간에 공백이 생김(cache)

--3) 시퀀스 호출 함수
--  주의:시퀀스 생성 후 nextval을 호출해야 시퀀스에 초기값이 설정됨)
  
-- nextval : 다음값을 반환함. 다음번호 발급
--              select sungjuk_seq.nextval from dual;

-- currval : 현재값을 반환함. 최근발급된 번호
--              select sungjuk_seq.currval from dual;

--4) 서브쿼리를 이용한 일련번호 발급
--   주의 : 시퀀스와 혼합해서 사용하지 않도록 주의


CREATE SEQUENCE sungjuk_seq;    --시퀀스 생성
                                                        --이렇게하면 시작값 1, 증가값 1
DROP SEQUENCE sungjuk_seq; --시퀀스 삭제

CREATE SEQUENCE sungjuk_seq --시퀀스 이름
INCREMENT BY 1                         --증가값
START WITH 103                          --시작값
MAXVALUE 1000000000               --최댓값
NOCACHE                                    --캐쉬사용여부
NOCYCLE;                                    --순환여부 / 순환여부를 걸어놓지 않는 이상 한번 사용한 값은 나오지 않음                    


--임시테이블 : dual
--시퀀스에서 일련번호 발생
SELECT sungjuk_seq.NEXTVAL  FROM dual;
--현재 시퀀스 번호를 확인
SELECT sungjuk_seq.CURRVAL  FROM dual;



--문제) 시퀀스 문제
--c_emp 테이블에 데이터 입력시 sequence를 이용해서 id를 입력하도록
--206에서 시작하여 1씩 증가되고, 최대값은 999로 설정하여 시퀀스를 생성하시오
--시퀀스 이름 : c_emp_seq

CREATE SEQUENCE c_emp_seq
INCREMENT BY 1
START WITH 206
MAXVALUE 999;


--시퀀스 목록 조회
SELECT * FROM USER_OBJECTS
WHERE OBJECT_TYPE='SEQUENCE';

-- 레코드 전부 삭제
DELETE FROM sungjuk;

--국어점수의 최고점 조회
SELECT MAX(kor) FROM sungjuk;

--[nvl() 함수]
--null값을 포함하는 컬럼을 특정한 값으로 전환하는 함수
--형식 : nvl(null값을 포함하고 있는 컬럼이나 식, 전환하고자 하는 목표값)
--null값이 나오면 0으로 대체
SELECT NVL(MAX(kor),0) FROM sungjuk;
--서브쿼리를 이용한 일련번호 구하는 식
SELECT NVL(MAX(kor),0)+1 FROM sungjuk;

INSERT INTO sungjuk(sno,uname,kor,eng,mat,addr)
VALUES((SELECT
    nvl(MAX(kor), 0) + 1
FROM
    sungjuk)
    ,'손흥민'
    ,99
    ,88
    ,77
    ,'Seoul');
    
SELECT * FROM sungjuk;

DELETE FROM sungjuk WHERE uname='손흥민';

--[성적데이터 입력]
insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon');

SELECT * FROM sungjuk;


-----------------------------------------------------------------------------------------------------------------------------------------------------------


--동일한 데이터
--DISTINCT
--GROUP BY절 (중요!)


--distinct : 칼럼에 중복내용이 있으면 대표값 1개만 출력
--형식) distinct (칼럼명)

SELECT  addr FROM sungjuk;
SELECT  DISTINCT(addr) FROM sungjuk;

SELECT DISTINCT(addr)
FROM sungjuk
ORDER BY addr; --오름차순

SELECT DISTINCT(addr)
FROM sungjuk
ORDER BY addr DESC; --내림차순


--GROUP BY 절
--칼럼에 동일 내용끼리 그룹화 시킴
--형식) GROUP BY 칼럼명1, 칼럼명2, ~~
--대표값 1개만 출력
SELECT addr
FROM sungjuk
GROUP BY addr;

--이렇게 하면 오류
--ORA-00979: not a GROUP BY expression
--GROUP BY에 의한 결과값이 오로지 1개만 존재하는 값만 조회할 수 있다.
--집계함수와 많이 사용한다.
SELECT addr
FROM sungjuk
GROUP BY addr;

--집계함수
SELECT
    COUNT(*)    --레코드 갯수
    ,SUM(kor)   --국어점수 합계
    ,AVG(eng)   --영어점수 평균
    ,MAX(mat)   --수학점수 최고점
    ,MIN(tot)       --총점 최저점
FROM sungjuk;

--문) 각 주소별 인원수를 구하시오
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr;

SELECT addr,COUNT(*) AS cnt
FROM sungjuk
GROUP BY addr;

SELECT addr,COUNT(*) 갯수     --AS 생략가능
FROM sungjuk
GROUP BY addr;

--주소별 인원수를 구한 후 주소순으로 정렬하시오
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
ORDER BY addr;

--주소별 인원수를 구한 후 인원수 순으로 내림차순 정렬하시오
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
ORDER BY COUNT(*) DESC;

--주소별 국어점수 평균을 구한 후 국어점수 평균순으로 내림차순 정렬하시오

SELECT addr,ROUND(AVG(kor),2)
FROM sungjuk
GROUP BY addr
ORDER BY AVG(kor) DESC;


--문) 지역별 국,영,수 최고점을 지역별 순으로 정렬해서 조회하시오
SELECT addr,MAX(kor),MAX(eng),Max(mat)
FROM sungjuk
GROUP BY addr
ORDER BY addr;

SELECT addr,mat
FROM sungjuk
ORDER BY addr;


--1차 값이 동일하다면 그 그룹내에서 2차 그룹이 가능하다.

--지역별로 그룹핑을 하고, 만일 지역이 같다면 2차 그룹으로 수학 점수별로 그룹핑을 하시오
SELECT addr,mat,COUNT(*)
FROM sungjuk
GROUP BY addr , mat;

--문) aver 칼럼값을 구한 후
--      aver칼럼값이 50인 이상 레코드 대상으로
--      지역별 국영수 평균을 반올림 소수점 1자리까지 구한 후 조회하시오

--평균구하기
UPDATE sungjuk
SET aver=(kor+eng+mat)/3;

SELECT * FROM sungjuk;

--전체 aver칼럼 조회
SELECT aver
FROM sungjuk;

--aver칼럼 50이상 조회
SELECT addr,aver
FROM sungjuk
WHERE aver>=50;

SELECT addr
            ,ROUND(AVG(kor),1) AS a_kor
            ,ROUND(AVG(eng),1) AS a_eng
            ,ROUND(AVG(mat),1) AS a_mat
FROM sungjuk
WHERE aver>=50
GROUP BY addr
ORDER BY addr;


SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr;


--[조건절]
--WHERE 조건절
--HAVING 조건절 -> GROUP BY 와 함께 사용
--ON 조건절 -> 테이블 조인할 때 사용


SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
HAVING COUNT(*)=3;


--문) 지역별 국어점수 평균을 구한 후 그 평균이 80점 이상인 지역만 조회

SELECT addr,ROUND(AVG(kor),0)
FROM sungjuk
GROUP BY addr
HAVING avg(kor)>=80;

--국어평균 60~79사이만 조회
SELECT addr,ROUND(AVG(kor),0)
FROM sungjuk
GROUP BY addr
HAVING AVG(kor) BETWEEN 60 AND 79;

























