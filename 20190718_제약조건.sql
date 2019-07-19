--1) 제약조건(constraint)
--정의
    --테이블의 해당 칼럼에 원치않는 데이터가 입력/변경/삭제되는 것을 방지하기 위해 테이블 생성 또는 변경 시 설정하는 조건
--종류
    --primary key   : 기본키, 유일성 null값을 인정하지 않음 -> 테이블당 1개만 가능 
    --foreign key    : 외래키, 자식테이블이 부모테이블 칼럼을 참조 -> references 부모테이블(칼럼명) REFERENCES
    --unique          : 중복을 허용하지 않음 -> 테이블에 1개 이상 가능
    --check           : 특정 데이터만 입력가능
    --not null        : 빈값을 허용하지 않음
    
--예) 주민번호 -> pk / 이메일,핸드폰번호 -> unique

--2) 부서 테이블 생성 (부모테이블)
CREATE TABLE dept(
    deptno NUMBER(7)       PRIMARY KEY
    ,dname VARCHAR(20)
    ,loc    VARCHAR(10)
);

INSERT INTO dept VALUES(10,'경리팀','부산');
INSERT INTO dept VALUES(20,'연구팀','대전');
INSERT INTO dept VALUES(30,'총무팀','대구');
INSERT INTO dept VALUES(40,'전산팀','인천');

SELECT * FROM dept;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- # 제약조건을 테이블에 반영 # 

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--3) 제약조건을 반영한 테이블 생성하기
--제약조건은 중복사용가능
CREATE TABLE c_emp(
    id NUMBER(5) CONSTRAINT c_emp_id_pk PRIMARY KEY
    ,name VARCHAR2(25) CONSTRAINT c_emp_name_nn NOT NULL
    ,salary NUMBER(7,2) DEFAULT 0 --제약조건은 아닌데, 데이터가 입력되지 않으면 dafault 값에 0을 넣으라는것. /SYSDATE도 넣을 수 있음
    ,phone VARCHAR2(15) CONSTRAINT c_emp_phone_ck CHECK(phone LIKE '1234-%')       --()안에 입력데이터를 지정할 수 있음. 기본적인 sql문을 작성할 수 있음
                                                                                                                                         --앞글자가 무조건 1234가 와야한다는 조건임!
    ,dept_id NUMBER(7) CONSTRAINT c_emp_dept_id_fk REFERENCES dept(deptno)
);

SELECT * FROM tab;

--4) 제약조건 이름 검색하기
--제약조건 목록 확인(데이터사전)
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name='C_EMP';
SELECT * FROM user_constraints WHERE table_name='DEPT';


--5) 제약조건은 수정할 수 없고 삭제만 가능함
ALTER TABLE c_emp DROP CONSTRAINT c_emp_name_nn;

--6) 제약조건 추가하기
ALTER TABLE c_emp ADD CONSTRAINT c_emp_name_un unique(name);

--NOT NULL 제약조건은 ADD로 할 수 없고 MODIFY로 가능
ALTER TABLE c_emp MODIFY (name VARCHAR2(25) CONSTRAINT c_emp_name_nn NOT NULL);



----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- # 제약조건이 설정되지 않은 테이블 # 

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--1) 제약조건이 설정되지 않은 테이블 생성하기
DROP TABLE c_emp;
CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) 
    ,salary NUMBER(7,2)
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) 
);

INSERT INTO c_emp(id,name) VALUES(1,'개나리');
INSERT INTO c_emp(id,name) VALUES(1,'진달래');
INSERT INTO c_emp(id,name) VALUES(1,'라일락');

SELECT * FROM c_emp;

DELETE FROM c_emp;

--1) id 칼럼에 pk제약 조건을 추가하기
ALTER TABLE c_emp ADD CONSTRAINT c_emp_id_pk PRIMARY KEY(id);
SELECT * FROM user_constraints WHERE table_name='C_EMP';
--위에 있는 INSERT 입력하려고 하니 오류메세지
--unique constraint (JAVA0514.C_EMP_ID_PK) violated

COMMIT;


--2) salary 칼럼에 check 제약조건
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) 
    ,salary NUMBER(7,2) CONSTRAINT c_emp_ck CHECK(salary BETWEEN 100 AND 1000)
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) 
);

SELECT * FROM c_emp;

INSERT INTO c_emp(id,name,salary) 
VALUES(1,'가나다',100);
INSERT INTO c_emp(id,name,salary) 
VALUES(1,'라마바',1000);
--CHECK 제약조건에 걸렸을때의 오류 메세지
--ORA-02290: check constraint (JAVA0514.C_EMP_CK) violated
INSERT INTO c_emp(id,name,salary) 
VALUES(1,'사아자',10000);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------


--3) name칼럼에 unique 제약조건 
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) CONSTRAINT c_emp_un UNIQUE 
    ,salary NUMBER(7,2) 
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) 
);

--이름을 같게했을 경우
--오류메세지
--ORA-00001: unique constraint (JAVA0514.C_EMP_UN) violated
INSERT INTO c_emp(name) VALUES('무궁화');  --여기까지는 INSERT됨    
INSERT INTO c_emp(name) VALUES('무궁화');


INSERT INTO c_emp(id) VALUES(1);
INSERT INTO c_emp(id) VALUES(2);

SELECT * FROM c_emp;



--4) dept_id 칼럼에 foreign key 제약조건
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) 
    ,salary NUMBER(7,2) 
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) CONSTRAINT c_emp_dept_id_fk REFERENCES dept (deptno)
);

INSERT INTO c_emp(name,dept_id)
VALUES('개나리',10);
INSERT INTO c_emp(name,dept_id)
VALUES('진달래',40);
--오류메세지
--ORA-02291: integrity constraint (JAVA0514.C_EMP_DEPT_ID_FK) violated - parent key not found
--부모테이블에 없는 데이터가 들어가려고 하면 오류남.
INSERT INTO c_emp(name,dept_id)
VALUES('라일락',90); 

SELECT * FROM c_emp;

--부서테이블
SELECT * FROM dept;



-------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE c_emp;


CREATE TABLE c_emp(
    id NUMBER(5)                PRIMARY KEY
    ,name VARCHAR2(25)     NOT NULL
    ,salary NUMBER(7,2)     CHECK(salary BETWEEN 0 AND 100)
    ,phone VARCHAR2(15)    NULL
    ,dept_id NUMBER(7)      REFERENCES dept(deptno)
);

--제약조건 목록 확인(데이터사전)
SELECT * FROM user_constraints WHERE table_name='C_EMP';

























