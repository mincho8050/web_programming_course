
--테이블 생성 : create table
--테이블 수정 : alter table
--테이블 삭제 : drop table

--테이블 생성

create table t_emp(
  id         number(5) not null  --사번
  ,name      varchar2(25)        --이름
  ,salary    number(7,2)         --급여
  ,phone     varchar2(15)        --전화번호
  ,dept_name varchar2(25)        --부서명
);


--행추가
insert into t_emp values(100,'손흥민',2000,'010-222-2222','개발부');
insert into t_emp values(101,'박지성',3000,'010-333-3333','총무부');
insert into t_emp values(102,'김연아',4000,'010-444-4444','영업부');

--행목록
select * from t_emp;

--테이블 이름 변경
rename t_emp to s_emp;

--테이블 목록
select * from tab;


--테이블 구조 확인
desc t_emp;

--테이블 삭제
DROP TABLE t_emp;

--바뀐 테이블명으로 목록확인
SELECT * FROM s_emp;
 
 --칼럼추가 및 삭제 > 테이블입장에서는 수정임! 
 --칼럼추가
 --alter table 변경할테이블 add (필드명 자료명);
 ALTER TABLE s_emp ADD (hire_date date);
 
 
 --행추가
 --DATE집어넣을때는 String으로 넣으면 됨
 INSERT INTO s_emp VALUES (103,'무궁화',5000,'010-555-5555','영업부','2019-07-18');
 
 --전화번호 데이터 갯수가 최대 15개인데, 초과했을때의 에러메세지 확인하기
 --ORA-12899: value too large for column "JAVA0514"."S_EMP"."PHONE" (actual: 21, maximum: 15)
  INSERT INTO s_emp VALUES (103,'무궁화',5000,'010123454343-555-5555','영업부','2019-07-18');
 
 --칼럼의 자료형 변경
 ALTER TABLE s_emp MODIFY (phone varchar2(20));
 
 --테이블 구조 확인
 DESC s_emp;

--칼럼 이름 수정
--ALTER TABLE 테이블명 RENAME COLUMN a TO b;
ALTER TABLE s_emp RENAME COLUMN id TO t_id;

--칼럼 삭제
ALTER TABLE s_emp DROP COLUMN name;


SELECT * FROM s_emp;


-----------------------------------------------------------------------------------------------------------------------------------------

--기존의 row에 있는 hire_date에 값 입력하기
--UPDATE 테이블 SET 필드=값 WHERE 조건

--문) t_id가 100인 레코드의 입사일을 오늘 날짜로 수정
--함수 쓰기 오늘날짜 SYSDATE
UPDATE s_emp SET hire_date=sysdate WHERE t_id=100;
--문) t_id가 101인 레코드를 수정하기 >  입사일 > 2019-01-01 이름 > 라일락
UPDATE s_emp SET hire_date='2019-01-01',name='라일락' WHERE t_id=101;
--문) t_id가 102인 레코드를 아래 데이터로 수정
--입사일 > 2019-03-03 / 급여> 급여*1.1
UPDATE s_emp SET hire_date='2019-03-03',salary=salary*1.1 WHERE t_id=102;


INSERT INTO s_emp(t_id,hire_date) VALUES(400,sysdate);

-- 문) t_id가 400인 레코드를 삭제
DELETE FROM s_emp
WHERE t_id=400;


--문) s_emp테이블에 대하여
--1)email을 관리하기 위한 mailid칼럼을 10byte로 추가하시오
ALTER TABLE s_emp ADD (mailid varchar2(10));
--2)mailid칼럼을 20byte로 수정하시오 
ALTER TABLE s_emp MODIFY (mailid varchar2(20));
--3)mailid칼럼명을 e_mail로 수정하시오
ALTER TAB
LE s_emp RENAME COLUMN mailid TO e_mail;
--4)s_emp 테이블명을 t_emp로 변경하시오
RENAME s_emp TO t_emp;


SELECT * FROM tab;
SELECT * FROM t_emp;



