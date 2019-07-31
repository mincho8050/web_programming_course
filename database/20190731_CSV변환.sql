
--공공데이터 
--data.go.kr
--[우편테이블]
-->우정사업본부 : http://www.koreapost.go.kr/

--실습)
--post.csv 파일 가져와서 zipcode테이블에 저장하기


--우편번호 테이블 생성
CREATE TABLE zipcode(
    zipcode CHAR(7) NOT NULL    --우편번호(A열)
    ,sido VARCHAR(30) NOT NULL  --시,도(B열)
    ,gugun VARCHAR(50)      --구,군(C열)
    ,dong VARCHAR(50)       --동(D열)
    ,li VARCHAR(50)             --리(E열)
    ,bunji VARCHAR(255)     --번지(F열)
    ,etc VARCHAR(255)       --기타(G열)
);
-->임포트툴사용
-->접속 -> myOracle11g -> 테이블 (우클릭) -> 데이터임포트
SELECT COUNT(*) FROM zipcode; --52852

--문) 시도의 갯수를 구하시오
SELECT sido
            ,COUNT(sido)
FROM zipcode
GROUP BY sido
ORDER BY COUNT(sido);
--3000개 이상만 출력
SELECT sido
            ,COUNT(sido)
FROM zipcode
GROUP BY sido
HAVING COUNT(sido)>=3000
ORDER BY COUNT(sido);

--문) 서울지역의 구의 갯수를 구하시오
-->아니 문제가 애매하자나.. 나만 그렇게 느끼나..?(모든 구의 갯수 구하는줄)

--선생님 방법
--1)이건 서울특별시 구의 동 갯수(구은 25개 나옴)
SELECT gugun  
            ,COUNT(gugun) 
FROM zipcode 
WHERE sido='서울특별시'
GROUP BY gugun;
--구의 갯수(25)
SELECT COUNT(*)
FROM(
SELECT gugun  
            ,COUNT(gugun) 
FROM zipcode 
WHERE sido='서울특별시'
GROUP BY gugun
);

--문) 각 시도별, 구군별 동의 갯수를 구하시오
SELECT sido
            ,gugun
            ,COUNT(dong)
FROM zipcode
GROUP BY sido,gugun
ORDER BY sido;


------------------------------------------------------------------------------------------


--자료를 텍스트로 받을 때는 엑셀에서 열고, 구분기호 잘 분리해서 엑셀파일로 만든 뒤 csv파일로 만든다

--툴로 만들었던 우편번호 테이블 삭제
DROP TABLE zipcode;

--우편번호 테이블 생성
CREATE TABLE zipcode(
    zipcode CHAR(7) NOT NULL    --우편번호(A열)
    ,sido VARCHAR(30) NOT NULL  --시,도(B열)
    ,gugun VARCHAR(50)      --구,군(C열)
    ,dong VARCHAR(50)       --동(D열)
    ,li VARCHAR(50)             --리(E열)
    ,bunji VARCHAR(255)     --번지(F열)
    ,etc VARCHAR(255)       --기타(G열)
);

--zipcode.ctl 파일생성
----------------작업하고 있는 공간이D:\java0514\database 여기에 저장하기
--LOAD DATA INFILE 'post.csv'
--INSERT
--INTO TABLE zipcode
--FIELDS TERMINATED BY ','
--TRAILING NULLCOLS
--(zipcode,sido,gugun,dong,bunji,etc)
--cmd에서 실행..일단 메모장에 저장.
--post.csv 경로도 작업하기 편하게 zipcode.ctl와 같은 경로로 해준다
--cmd > 경로를 저장한 경로로 이동(D:\java0514\database) -> dir(파일확인)
-- ->sqlldr java0514/1234 control="zipcode.ctl" 
--sqlldr(컨트롤파일 실행할때 명령어) 아이디/비번 control="파일명.확장자"
------------------------------------------------------------------------------------------------

SELECT COUNT(*)
FROM zipcode; --52852

------------------------------------------------------------------------------------------------------

DROP TABLE streetcode;

--과제1) 도로명 주소를 DB에 저장하기

CREATE TABLE streetcode(
    scode VARCHAR2(80)
    ,sname  VARCHAR2(80)
    ,sname_e VARCHAR2(80)
    ,serial VARCHAR2(80)
    ,sido VARCHAR2(80)
    ,sido_e VARCHAR2(80)
    ,gugun VARCHAR2(80)
    ,gugun_e VARCHAR2(80)
    ,dong VARCHAR2(80)
    ,dong_e VARCHAR2(80)
    ,dong_sort VARCHAR2(80)
    ,dong_code VARCHAR2(80)
    ,scheck VARCHAR2(80)
    ,PRIMARY KEY(scode, serial)
);
--카운트
SELECT COUNT(*) FROM streetcode; --358154
--서울특별시 보기
SELECT *
FROM streetcode
WHERE sido='서울특별시';

DESC streetcode;
-------------------------------------------------------------------------------------------------------------------------------------------------


--과제2) 관심있는 주제를 선정하여 DB에 저장하기!
--data.go.kr 참조


--서울특별시중구_식품접객업소현황_20190315
SELECT COUNT(*) FROM food_junggu;--8768
SELECT * FROM food_junggu;


DESC food_junggu; --테이블구조확인

--커피숍 카운트 하기
SELECT fname
FROM food_junggu
WHERE fcategory='커피숍'; --803

--신당동 식당들 조회
SELECT *
FROM food_junggu
WHERE faddress LIKE '%신당%'
ORDER BY fname;













