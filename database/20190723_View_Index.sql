--������ ���̺� : ����ڰ� CREATE�� ���� ������ ���� �����ϴ� ���̺�
--���� ���̺� : ����ڰ� SQL���� ���� ������ ���̺�

--��(View) 
--1) ����
--���̺� ���� ������ ���̺�ν� ���̺�ó�� ���� �����͸� �������� �ʰ�
--�˻��ÿ� �̿��� �� �ֵ��� ������ ��� �ִ� ��ü
--���̺� ������ �κ�����
--2) ��� ����
--���̺� ���� ���� ����� �����ؾ� �ϴ� ���
--�����ϸ� ���� ����ϴ� ���� SQL���� ���� ���� �����ϰ� ����ؾ� �ϴ� ���

--3) �� ���� ���� �ο�
--cmd ���� > sqlplus / as sysdba �Է�
--SQL>grant create view to java0514;

--4) �� ���� ����
CREATE OR REPLACE VIEW ���̸�
AS
    [SQL��]
-> REPLACE : �̹� �����ϴ� ���� ������ ������

--5) �� �����ϱ�
--CREATE VIEW ���̸�
CREATE VIEW test_view
AS
    SELECT * FROM emp;

--6) �� �����ϱ�
--DROP VIEW ���̸�
DROP VIEW test_view;


SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno;


--���̺�,�� ��� Ȯ��
SELECT * FROM tab;

--�����(�ι�°���ʹ� ����)
--CREATE OR REPLACE VIEW ���̸�
--AS �����ν�����SQL��ɾ�
CREATE OR REPLACE VIEW test_view
AS
    SELECT empno,ename,job,sal,deptno
    FROM emp;
--�信 ��ϵ� SQL�� ����   
--������ ��� ���̺�ó�� ��밡��
SELECT * 
FROM test_view;

SELECT * FROM emp;

--���� ���� ���� Ȯ��(�����ͻ���)
SELECT * FROM user_views;

--AS��ɾ� (alias��Ī)
SELECT ename AS �̸�
            ,sal �޿�
            ,hiredate �Ի���
FROM emp;
        
--emp���̺� �̸��� AA�� �ٲ㼭 ���
SELECT *
FROM emp AA;

SELECT *
FROM emp AA
ORDER BY AA.ename; --AA���̺� �ִ� ename �̶�� �ǹ�

SELECT *
FROM emp
ORDER BY emp.ename; --emp���̺� �ִ� ename�̶�� �ǹ�


SELECT * FROM emp;  --�������̺�
SELECT * FROM dept; --�μ����̺�

--JOIN ���
SELECT emp.ename,emp.deptno,dept.*
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
--AS���ΰ�
SELECT AA.ename,AA.deptno,BB.*
FROM emp AA JOIN dept BB
ON AA.deptno=BB.deptno;

CREATE OR REPLACE VIEW test2_view
AS
    SELECT AA.ename,AA.deptno,BB.dname,bb.loc --BB.* > �ߺ�Į���̶�� ������. > �ڱ� �Ҽ���ġ�� ������� �˷������!
    FROM emp AA JOIN dept BB
    ON AA.deptno=BB.deptno;
    
SELECT * FROM test2_view;

SELECT emp.ename,emp.deptno,dept.dname
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT ename,deptno, dname
FROM (
    SELECT emp.ename,emp.deptno,dept.dname
    FROM emp JOIN dept
    ON emp.deptno=dept.deptno
) AA
WHERE AA.deptno=10;





