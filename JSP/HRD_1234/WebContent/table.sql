--회원정보명세서
CREATE TABLE member_tbl_02 (
	custno	NUMBER(6)	NOT NULL PRIMARY KEY
	,custname	VARCHAR2(20)
	,phone	VARCHAR2(13)
	,address	VARCHAR2(60)
	,joindate	DATE
	,grade	CHAR(1)
	,city	CHAR(2)
);
--테스트
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES(100001,'김행복','010-1111-2222','서울 동대문구 휘경1동',SYSDATE,'A','01');


--회원매출정보 명세서
CREATE TABLE money_tbl_02 (
	custno	NUMBER(6)	NOT NULL
	,selenol	NUMBER(8)	NOT NULL
	,pcost	NUMBER(8)
	,amount	NUMBER(4)
	,price	NUMBER(8)
	,pcode	VARCHAR2(4)
	,sdate	DATE
	,PRIMARY KEY(custno, selenol)
);
--테스트
INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100001, 20160001,500,5,2500,'A001','20160101');
INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100002, 20160004,2000,1,2000,'A004','20160101');
INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100002, 20160005,500,1,500,'A001','20160101');

INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100003, 20160006,400,8,3200,'A005','20160101');
INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100004, 20160007,500,10,5000,'A002','20160101');
INSERT INTO money_tbl_02 (custno,selenol,pcost,amount,price,pcode,sdate)
VALUES(100004, 20160008,2000,3,6000,'A003','20160101');

select * from money_tbl_02;

--회원매출조회 메뉴 (매출이 높은순)
SELECT AA.custno, custname, grade, SUM(price) sum
FROM member_tbl_02 AA JOIN money_tbl_02 BB
ON AA.custno=BB.custno
GROUP BY AA.custno, custname, grade
ORDER BY sum DESC;

--다른방법
SELECT custno, SUM(price) AS hap
FROM money_tbl_02
GROUP BY custno;

SELECT AA.custno, MEM.custname, MEM.grade, AA.hap
FROM(
	SELECT custno, SUM(price) AS hap
	FROM money_tbl_02
	GROUP BY custno
) AA JOIN member_tbl_02 MEM
ON AA.custno=MEM.custno
ORDER BY AA.hap DESC;

--목록 업데이트
UPDATE member_tbl_02
SET custname=?, phone=?, address=?, joindate=?, grade=?, city=?
WHERE custno=?
















