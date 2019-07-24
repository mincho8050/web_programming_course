
--[���� JOIN]
--�� �� �̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
--�� ���̺��� ���밪�� �̿��Ͽ� Į���� �����ϴ� ����

--ǥ��(ANSI) SQL�� -����
--�� DB���� SQL��

--���� : ANSI SQL�� )
--        SELECT Į����
--        FROM ���̺�1 JOIN ���̺�2
--        ON ������;
--left ���̺��� ����(���̺�1)

--���� : Oracle SQL�� )
--            SELECT Į����
--            FROM ���̺�1 , ���̺�2
--            WHERE ������;


DROP TABLE emp;
DROP TABLE dept;

--�μ����̺� (�θ�)
CREATE TABLE dept (
    deptno  NUMBER(7) PRIMARY KEY
    ,dname VARCHAR(20)
    ,loc VARCHAR(10)
);

--Į���߰�
INSERT INTO dept VALUES(10,'�渮��','�λ�');
INSERT INTO dept VALUES(20,'������','����');
INSERT INTO dept VALUES(30,'�ѹ���','�뱸');
INSERT INTO dept VALUES(40,'������','��õ');


--�������̺� (�ڽ�)
CREATE TABLE emp(
    empno   NUMBER(4)  PRIMARY KEY
    ,ename VARCHAR2(10) 
    ,job    VARCHAR2(9)
    ,mgr    NUMBER(4)   
    ,hiredate   DATE    
    ,sal NUMBER(7,2)  
    ,comm NUMBER(7,2) 
    ,deptno NUMBER(7)   REFERENCES dept(deptno)
);

--Į���߰�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);


SELECT * FROM emp;
SELECT * FROM dept;


SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT *
FROM emp , dept
WHERE emp.deptno=dept.deptno;

























