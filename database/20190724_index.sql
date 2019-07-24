
SELECT * FROM c_emp;
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id  NUMBER(5)
    ,name VARCHAR2(25)
    ,salary NUMBER(7,2)
    ,phone VARCHAR2(15)
    ,dept_id NUMBER(7)
);

INSERT INTO c_emp(id,name) VALUES (10,'kim');
INSERT INTO c_emp(id,name) VALUES (20,'park');
INSERT INTO c_emp(id,name) VALUES (30,'hong');

--�ε��� ���� ��
SELECT * 
FROM c_emp
WHERE name='hong';
--F10 �����ȹ ���� (Ŀ����ġ �߿�)
-- >  full scan cost 3

--Primary key , Unique ���������� ����� �ش� �ε��� �������� �ڵ����� �����ȴ�

--�ε��� ���� �� 
--CREATE INDEX �ε����� ON ���̺��(Į����);
CREATE INDEX c_emp_name_idx
ON c_emp(name);
--�����ȹ���� F10 (�ε��� ���� ��)
--SELECT * 
--FROM c_emp
--WHERE name='hong';
-->range scan, cost 1

--�ε��� ����
DROP INDEX c_emp_name_idx;


--PK�� �ε����� �ڵ����� �����Ǹ鼭 ���ĵȴ�
CREATE TABLE emp4(
    no NUMBER PRIMARY KEY
    ,name VARCHAR2(10)
    ,sal NUMBER
);

--�ε��� ��� ����
SELECT * FROM user_indexes;

--�����ȹ���� F10
SELECT * 
FROM emp4
WHERE no=3;
--unique scan, cost 1



--��) �׽�Ʈ�� ���ڵ� 100���� �Է�
--PL/SQL (Procedural Language) ���ν���
-- > ����ô�� �����ͺ��̽� ���α׷��� ���

CREATE TABLE emp3(
    no      NUMBER
    ,name VARCHAR2(10)
    ,sal       NUMBER
);



--�⺻���
DECLARE --���ν��� ����
    --�ʿ��� ���� ����
    i NUMBER := 1; -- i ������ 1 ����(���Կ����� :=)
    name VARCHAR(20) :='kim';
    sal NUMBER :=0;
BEGIN
    -- T-SQL�� (���-���ǹ�,�ݺ��� ��)
    WHILE i<=1000000 LOOP 
        IF i MOD 2 = 0 THEN --(MOD : ������������ , ���ٿ����� = �ϳ���!)
            name := 'kim' || TO_CHAR (i);
            sal := 300;
        ELSIF i MOD 3 = 0 THEN --ELSE IF�� �̷��� �ۼ�
            name :='park' || TO_CHAR(i);
            sal := 400;
        ELSIF i MOD 5 = 0 THEN 
            name :='hong' || TO_CHAR(i);
            sal := 500;
        ELSE
            name :='shin' || TO_CHAR(i);
            sal := 250;
        END IF; --IF�� �ݴ� �±�
        
        INSERT INTO emp3(no,name,sal)
        VALUES (i ,name ,sal);
        i := i+1;        
    END LOOP; --LOOP ~ END LOOP ��ġ ����ϰ��� ����
END;
/ -- / ������..

--���ν��� ������ 0 ���
SELECT COUNT(*) FROM emp3;
--���ν��� �Ŀ��� 1000000

--����Į��
--ROWID : ���� �ּҰ� / ROWNUM : ���ȣ
SELECT * 
FROM emp3
WHERE ROWNUM >=1 AND ROWNUM<=10;

--�ε����� ������� ���� ���
SELECT *
FROM emp3
WHERE name='kim466';
--�����ȹ F10 > full scan , cost 894


--��) name Į���� �������� �ε��� ���� ��
--name Į������ ��ȸ�ϰ� F10 ��ȹ ��� Ȯ���ϱ�
CREATE INDEX emp3_name_index
ON emp3(name);

--�ε��� ����� ���
SELECT *
FROM emp3
WHERE name='kim466';
--�����ȹ F10 > range scan , cost 3

SELECT * FROM user_indexes; --�ε��� ���

SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM user_indexes
WHERE TABLE_NAME IN ('EMP3','EMP4'); --���̺� �̸� ���⼭�� �빮�ڷ� ! '' �ȿ�!!
--�����
--EMP3_NAME_INDEX	EMP3	NONUNIQUE   > �ߺ��ɼ� ����
--SYS_C007084	EMP4	UNIQUE                      > PRIMARY KEY �� �������� �׷��� UNIQUE

--name �ε��� ���� �� �׽�Ʈ
DROP INDEX emp3_name_index;

--�̸��� �޿��� �������� �ε��� ����
CREATE INDEX emp3_name_sal_index
ON emp3(name,sal);

--full scan , cost 894
SELECT * 
FROM emp3
WHERE no=466;
--range scan , cost 17
SELECT * 
FROM emp3
WHERE name='kim466';
--full scan , cost 895
SELECT * 
FROM emp3
WHERE sal > 200;
--range scan , cost 3
SELECT *
FROM emp3
WHERE name='kim466' AND sal>200;
















