--1) ��������(constraint)
--����
    --���̺��� �ش� Į���� ��ġ�ʴ� �����Ͱ� �Է�/����/�����Ǵ� ���� �����ϱ� ���� ���̺� ���� �Ǵ� ���� �� �����ϴ� ����
--����
    --primary key   : �⺻Ű, ���ϼ� null���� �������� ���� -> ���̺�� 1���� ���� 
    --foreign key    : �ܷ�Ű, �ڽ����̺��� �θ����̺� Į���� ���� -> references �θ����̺�(Į����) REFERENCES
    --unique          : �ߺ��� ������� ���� -> ���̺� 1�� �̻� ����
    --check           : Ư�� �����͸� �Է°���
    --not null        : ���� ������� ����
    
--��) �ֹι�ȣ -> pk / �̸���,�ڵ�����ȣ -> unique

--2) �μ� ���̺� ���� (�θ����̺�)
CREATE TABLE dept(
    deptno NUMBER(7)       PRIMARY KEY
    ,dname VARCHAR(20)
    ,loc    VARCHAR(10)
);

INSERT INTO dept VALUES(10,'�渮��','�λ�');
INSERT INTO dept VALUES(20,'������','����');
INSERT INTO dept VALUES(30,'�ѹ���','�뱸');
INSERT INTO dept VALUES(40,'������','��õ');

SELECT * FROM dept;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- # ���������� ���̺� �ݿ� # 

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--3) ���������� �ݿ��� ���̺� �����ϱ�
--���������� �ߺ���밡��
CREATE TABLE c_emp(
    id NUMBER(5) CONSTRAINT c_emp_id_pk PRIMARY KEY
    ,name VARCHAR2(25) CONSTRAINT c_emp_name_nn NOT NULL
    ,salary NUMBER(7,2) DEFAULT 0 --���������� �ƴѵ�, �����Ͱ� �Էµ��� ������ dafault ���� 0�� ������°�. /SYSDATE�� ���� �� ����
    ,phone VARCHAR2(15) CONSTRAINT c_emp_phone_ck CHECK(phone LIKE '1234-%')       --()�ȿ� �Էµ����͸� ������ �� ����. �⺻���� sql���� �ۼ��� �� ����
                                                                                                                                         --�ձ��ڰ� ������ 1234�� �;��Ѵٴ� ������!
    ,dept_id NUMBER(7) CONSTRAINT c_emp_dept_id_fk REFERENCES dept(deptno)
);

SELECT * FROM tab;

--4) �������� �̸� �˻��ϱ�
--�������� ��� Ȯ��(�����ͻ���)
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name='C_EMP';
SELECT * FROM user_constraints WHERE table_name='DEPT';


--5) ���������� ������ �� ���� ������ ������
ALTER TABLE c_emp DROP CONSTRAINT c_emp_name_nn;

--6) �������� �߰��ϱ�
ALTER TABLE c_emp ADD CONSTRAINT c_emp_name_un unique(name);

--NOT NULL ���������� ADD�� �� �� ���� MODIFY�� ����
ALTER TABLE c_emp MODIFY (name VARCHAR2(25) CONSTRAINT c_emp_name_nn NOT NULL);



----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- # ���������� �������� ���� ���̺� # 

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--1) ���������� �������� ���� ���̺� �����ϱ�
DROP TABLE c_emp;
CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) 
    ,salary NUMBER(7,2)
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) 
);

INSERT INTO c_emp(id,name) VALUES(1,'������');
INSERT INTO c_emp(id,name) VALUES(1,'���޷�');
INSERT INTO c_emp(id,name) VALUES(1,'���϶�');

SELECT * FROM c_emp;

DELETE FROM c_emp;

--1) id Į���� pk���� ������ �߰��ϱ�
ALTER TABLE c_emp ADD CONSTRAINT c_emp_id_pk PRIMARY KEY(id);
SELECT * FROM user_constraints WHERE table_name='C_EMP';
--���� �ִ� INSERT �Է��Ϸ��� �ϴ� �����޼���
--unique constraint (JAVA0514.C_EMP_ID_PK) violated

COMMIT;


--2) salary Į���� check ��������
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
VALUES(1,'������',100);
INSERT INTO c_emp(id,name,salary) 
VALUES(1,'�󸶹�',1000);
--CHECK �������ǿ� �ɷ������� ���� �޼���
--ORA-02290: check constraint (JAVA0514.C_EMP_CK) violated
INSERT INTO c_emp(id,name,salary) 
VALUES(1,'�����',10000);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------


--3) nameĮ���� unique �������� 
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) CONSTRAINT c_emp_un UNIQUE 
    ,salary NUMBER(7,2) 
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) 
);

--�̸��� �������� ���
--�����޼���
--ORA-00001: unique constraint (JAVA0514.C_EMP_UN) violated
INSERT INTO c_emp(name) VALUES('����ȭ');  --��������� INSERT��    
INSERT INTO c_emp(name) VALUES('����ȭ');


INSERT INTO c_emp(id) VALUES(1);
INSERT INTO c_emp(id) VALUES(2);

SELECT * FROM c_emp;



--4) dept_id Į���� foreign key ��������
DROP TABLE c_emp;

CREATE TABLE c_emp(
    id NUMBER(5) 
    ,name VARCHAR2(25) 
    ,salary NUMBER(7,2) 
    ,phone VARCHAR2(15) 
    ,dept_id NUMBER(7) CONSTRAINT c_emp_dept_id_fk REFERENCES dept (deptno)
);

INSERT INTO c_emp(name,dept_id)
VALUES('������',10);
INSERT INTO c_emp(name,dept_id)
VALUES('���޷�',40);
--�����޼���
--ORA-02291: integrity constraint (JAVA0514.C_EMP_DEPT_ID_FK) violated - parent key not found
--�θ����̺� ���� �����Ͱ� ������ �ϸ� ������.
INSERT INTO c_emp(name,dept_id)
VALUES('���϶�',90); 

SELECT * FROM c_emp;

--�μ����̺�
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

--�������� ��� Ȯ��(�����ͻ���)
SELECT * FROM user_constraints WHERE table_name='C_EMP';

























