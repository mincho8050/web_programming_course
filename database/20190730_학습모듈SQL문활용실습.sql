

-직원테이블
CREATE TABLE employees(
    eid INT PRIMARY KEY     --사원번호
    ,name VARCHAR2(50) NOT NULL --사원이름
    ,password VARCHAR2(50) NOT NULL--비밀번호
    ,workplace VARCHAR2(50) NOT NULL--직급
    ,address VARCHAR2(255) NOT NULL--주소
    ,birthday DATE NOT NULL     --생일
    ,joinday DATE NOT NULL      --입사일
    ,weddingday DATE --결혼기념일
);

--급여 테이블 생성
CREATE TABLE salaries(
    emp_no INT NOT NULL
    ,salary INT NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE
    ,FOREIGN KEY (emp_no) REFERENCES employees (eid) ON DELETE CASCADE
    ,PRIMARY KEY (emp_no, from_date)
);
--단일 레코드 행추가
INSERT INTO salaries (emp_no,salary,from_date)
VALUES(1002,4000000,'2017-07-01');
--복수레코드 행추가
INSERT INTO salaries (emp_no,salary,from_date)
VALUES(1002,2000000,'2013-06-30'),
VALUES(1002,3000000,'2014-06-30'),
VALUES(1002,4000000,'2015-06-30');

--서브쿼리
SELECT * FROM salaries
WHERE from_date=(SELECT MAX(from_date) FROM salaries);

--맨위 1건 조회
SELECT * FROM salaries
ORDER BY from_date DESC LIMIT 1;

















































