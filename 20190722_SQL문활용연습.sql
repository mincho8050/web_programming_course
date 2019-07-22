CREATE TABLE emp(
    empno   NUMBER(4)   --���
    ,ename VARCHAR2(10) --�̸�
    ,job    VARCHAR2(9) --����
    ,mgr    NUMBER(4)   --�Ŵ�������
    ,hiredate   DATE    --�Ի���
    ,sal NUMBER(7,2)    --�޿�
    ,comm NUMBER(7,2) --Ŀ�̼�(���ʽ�)
    ,deptno NUMBER(2)   --�μ��ڵ�
);

SELECT * FROM tab;

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'������','���',7902,'2000-12-17',200,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'���޷�','����',7698,'2001-12-15',360,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'���϶�','����',7698,'2001-02-17',355,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'�����','����',7839,'2002-01-11',400,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'������','����',7698,'2000-07-12',325,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'�迬��','���',7698,'2001-12-17',225,10);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'����ȭ','���',7839,'2005-11-14',200,10);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'ȫ�浿','����',7566,'2006-06-17',450,20);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'�۰�ȣ','����',7566,'2018-09-17',400,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'���켺','��ǥ',7839,'2004-09-09',500,30);

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(7369,'������','���',7902,'2001-12-03',200,20);

SELECT * FROM emp;

--��) ���̺��� �ʵ� ����� Ȯ���Ͻÿ�
SELECT * FROM emp;

--��) ����̸���(��������) �����Ͻÿ�
SELECT * FROM emp
ORDER BY ename;

--��) ����̸���(��������) �����Ͻÿ�
SELECT * FROM emp
ORDER BY ename DESC;

--��) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�

SELECT ename,sal,deptno
FROM emp
ORDER BY sal DESC;

--��) �μ��ڵ� ��������, �޿� ������������
--����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
SELECT ename,sal,deptno
FROM emp
ORDER BY deptno,sal DESC;

--��)�̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)�� 
--�μ��ڵ� ��������, �Ի�����(hiredate)������������ ��ȸ�Ͻÿ�
SELECT ename,hiredate,deptno
FROM emp
ORDER BY deptno,hiredate;

--��)����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
SELECT DISTINCT(job)
FROM emp;

--��)emp���̺��� job ��������, sal ������������ �����ؼ�
--ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
SELECT ename AS �̸�,job AS ����,sal AS �޿�
FROM emp
ORDER BY job ASC,sal DESC;

--��)�޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
SELECT *
FROM emp
WHERE sal>100 AND sal<400
ORDER BY sal DESC;

--��)�޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
SELECT *
FROM emp
WHERE sal<=100 OR sal>=400
ORDER BY sal DESC;

SELECT *
FROM emp
WHERE NOT(sal>100 AND sal<400)  --NOT ���
ORDER BY sal DESC;

--��)����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE job IN('����','����')
ORDER BY ename;

--��)�μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE deptno=30;

--��)�ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
SELECT DISTINCT(deptno)
FROM emp;

--��)�μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
--(or,in������ ���� Ȱ���ؼ� ��ȸ)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

--��)�޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
--(AND,BETWEEN������ ���� Ȱ���ؼ� ��ȸ)
SELECT *
FROM emp
WHERE sal BETWEEN 300 AND 500
ORDER BY sal;

SELECT *
FROM emp
WHERE sal>=300 AND sal<=500
ORDER BY sal;

--��)�̸��� ����ȭ ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE ename='����ȭ';

--��)�达���� ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE ename LIKE'��%';

--��)�̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
SELECT *
FROM emp
WHERE ename LIKE '%ȭ%';

--��) �μ��ڵ尡 20�� ���ڵ忡 ���ؼ� �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
UPDATE emp
SET comm=sal*0.01
WHERE deptno=20;


--��)������ �Ʒ��� ���� ���� �� �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
--�������ϴ� ��: �޿�(sal)*12����+���ʽ�(comm)
SELECT 
    ename
    ,sal
    ,comm
    ,sal*12+comm AS a_income
FROM emp;


--��)Ŀ�̼��� null�̸� 0���� �ٲ� �� ������ �ٽ� ����ؼ�
--�̸�,�޿�,Ŀ�̼�,������ ��ȸ�Ͻÿ�
SELECT
    ename
    ,sal
    ,comm
    ,sal*12+NVL(comm,0) AS a_income
FROM emp;

--��)�� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
--(|| ���տ�����) > �ڹٿ����� +�����ڶ�� �����ϸ��
--���� ������
--SELECT �� ���ο� || �����ٸ� ����ؼ� ǥ���Ѵ�.
--������ Į������ ���ڿ��� �߰��ϰ��� �� �� ����Ѵ�
SELECT ename || '�� �޿��� ' || sal || ' �Դϴ�.' 
FROM emp;


--��) ������ SQL���� �м��Ͻÿ�
--SELECT empno,sal
--FROM emp
--WHERE NOT(sal>200 AND sal<300)
--ORDER BY sal;
emp���̺���
�޿��� (200 �ʰ��̸鼭 300 �̸�)�ƴ�
> ����� 200 ���� �Ǵ� 300 �̻���
������ �̸��� �޿��� �޿� ������������ ��ȸ

--��)������ SQL���� �м��Ͻÿ�
--SELECT empno,sal
--FROM emp
--WHERE not sal>200 AND sal<300
--ORDER BY sal;
emp���̺��� 
�޿��� 200 �ʰ��� �ƴϸ鼭(NOT�� sal>200�� ����), �޿��� 300 �̸��� 
������ �̸��� �޿��� �޿� ������������ 
��ȸ�Ѵ�.

--������ �켱����
--() ��ȣ : ������ �켱�������� �켱��
--1 ���� : �񱳿�����, SQL������, ���������
--2 ���� : NOT
--3 ���� : AND
--4 ���� : OR
--5 ���� : ���տ�����

--��)emp���̺��� �Ի���(hiredate)�� 2005��1��1�� ������ ����� ����
--����� �̸�(ename),�Ի���,�μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
SELECT ename,hiredate,deptno
FROM emp
WHERE hiredate<TO_DATE('20050101','YYYY-MM-DD');
--TO_DATE('20050101');�ص� �ǰ�
--TO_DATE('2005-01-01'); �ص��ȴ�

SELECT ename,hiredate,deptno
FROM emp
WHERE hiredate<'20050101'
ORDER BY hiredate;

--��)emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
--����鿡 ���Ͽ� �̸�, �����ڵ�(job),�μ���ȣ�� �̸������� ��ȸ�Ͻÿ� 
--(or,in������ ���� Ȱ���ؼ� ��� ��ȸ)
SELECT ename,job,deptno
FROM emp
WHERE deptno IN(20,30)
ORDER BY ename;

SELECT ename,job,deptno
FROM emp
WHERE deptno=10 OR deptno=20
ORDER BY ename;


