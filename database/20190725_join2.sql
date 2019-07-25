

--���̺� ����

--���̺� 2�� ����
SELECT t1.*, t2.*
FROM t1 JOIN t2
ON t1.x=t2.x;

--���̺� 3�� ����
SELECT t1.*, t2.*, t3.*
FROM t1 JOIN t2
ON t1.x=t2.x JOIN t3
ON t1.y=t3.y;

--���̺� 4�� ����
SELECT t1.x , t2.y , t3.z, t4.* 
FROM t1 JOIN t2
ON t1.x=t2.x JOIN t3
ON t1.y=t3.y JOIN t4
ON t1.z=t4.z;

---------------------------------------------------------------------------------


--�μ����̺�
SELECT * FROM dept;
--���� ���̺�
SELECT * FROM emp;

--��) �Ʒ��� ���ǰ� ���� Ŀ�̼��� ���Ͻÿ�
-- ��� : �޿�*0.03 / ���� : �޿�*0.02 / ���� : �޿�*0.01
UPDATE emp 
SET comm=sal*0.03
WHERE job='���';
UPDATE emp 
SET comm=sal*0.02
WHERE job='����';
UPDATE emp 
SET comm=sal*0.01
WHERE job='����';

--�������̺� �μ����� ����ϱ�

--emp, dept���̺��� ��� Į�� ���
SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
--emp, dept���̺��� ��� Į�� ���
SELECT emp.* , dept.*
FROM emp JOIN dept
ON emp.deptno = dept.deptno;
--���̺��.Į���� ��ȸ
SELECT emp.empno 
            ,emp.ename
            ,emp.deptno
            ,dept.deptno
            ,dept.dname
FROM emp JOIN dept
ON emp.deptno = dept.deptno;
--2�� ���̺� �ߺ����� ���� Į������ ��������
--SELECT empno
--            ,ename
--            ,deptno --column ambiguously defined ����
--            ,dname
--            ,loc
--FROM emp JOIN dept
--ON emp.deptno = dept.deptno;
--2�� ���̺� �ߺ��Ǵ� Į������ ���̺���� ����ؾ���!
SELECT empno
            ,ename
            ,dept.deptno --�������� ����ű� ������ emp ���̺��̵�, dept���̺��̵� �̷������� ����ؾ��Ѵ�!
            ,dname
            ,loc
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

--���̺� ��Ī ALIAS
SELECT em.* , de.*
FROM emp em, dept de
WHERE em.deptno=de.deptno;

SELECT em.* , de.*
FROM emp em JOIN dept de
ON em.deptno=de.deptno;

SELECT empno
            ,ename
            ,em.deptno
            ,dname
            ,loc
FROM emp em JOIN dept de
ON em.deptno=de.deptno;

--���� ���̺��� aa��Ī�� ���� ���ο� ���̺�� ������ �� �ִ�
--ALIAS�� ������� ���
SELECT aa.*
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;
--�̷��Ե� �ۼ� ����
SELECT aa.empno
            ,aa.ename
            ,aa.deptno
            ,aa.dname
            ,aa.loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;
--��ȸ���̺�Ī aa ��������
SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
ORDER BY aa.ename;

SELECT empno
            ,ename
            ,deptno
            ,dname
            ,loc --2)
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa --1)
ORDER BY aa.ename; --3)




---------------------------------------------------------------------------------





--��) �� �μ��� �ο����� �ο��������� �Ʒ��� ���� ��ȸ�Ͻÿ�
-- ������ 5�� , �ѹ��� 4��, �渮�� 2��
SELECT dname,COUNT(*) || '��' cnt
FROM (
    SELECT empno
                ,ename
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY dname
ORDER BY COUNT(*) DESC;


--��) �� �μ��� �޿�, Ŀ�̼��� �հ踦 ���� ��
--�޿��հ������ �Ʒ��� ���� ��ȸ�Ͻÿ�
--�ѹ��� 1655 413
--������ 1535 307
-- �渮�� 425 212
SELECT *
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT dname
            ,SUM(sal)
            ,SUM(NVL(comm,0))
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY dname
ORDER BY SUM(sal) DESC; 

--�����Թ��1
--���� �� �հ�
SELECT EM.sal
            ,EM.comm
            ,EM.deptno
            ,DE.dname
FROM emp EM JOIN dept DE
ON EM.deptno=DE.deptno;

SELECT AA.dname 
            ,SUM(sal)   �޿��հ�
            ,SUM(NVL(comm,0)) Ŀ�̼��հ�
FROM(
    SELECT EM.sal
                ,EM.comm
                ,EM.deptno
                ,DE.dname
    FROM emp EM JOIN dept DE
    ON EM.deptno=DE.deptno
) AA
GROUP BY AA.dname
ORDER BY SUM(sal) DESC;

--�����Թ��2
--�հ� �� ����
SELECT deptno
            ,SUM(sal)
            ,SUM(NVL(comm,0))
FROM emp
GROUP BY deptno;

SELECT AA.*
            ,DE.dname
FROM(
    SELECT deptno
            ,SUM(sal) hap1
            ,SUM(NVL(comm,0)) hap2
    FROM emp
    GROUP BY deptno
) AA JOIN dept DE
ON AA.deptno=DE.deptno
ORDER BY hap1 DESC;

----------------------------------------------------------------------------------------------------------------------------------




--��) �� ������ Ŀ�̼��հ踦 ���� �� �� Ŀ�̼� �հ谡 20���� ������
--���������� �Ʒ��� ���� ��ȸ�Ͻÿ�
--�뱸 15
--���� 13
SELECT *
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa;

SELECT loc
            ,TRUNC(SUM(comm)) 
FROM (
    SELECT ename
                ,sal
                ,comm
                ,em.deptno
                ,dname
                ,loc
    FROM emp em JOIN dept de
    ON em.deptno=de.deptno
) aa
GROUP BY loc
HAVING TRUNC(SUM(comm))<=20
ORDER BY SUM(AA.comm) DESC;


--������ ���
SELECT dept.loc
            ,emp.comm
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

SELECT AA.loc
            ,ROUND(SUM(NVL(AA.comm,0)),0)
FROM(
    SELECT dept.loc
                ,emp.comm
    FROM emp JOIN dept
    ON emp.deptno=dept.deptno
) AA
GROUP BY AA.loc
HAVING SUM(AA.comm)<=20
ORDER BY AA.loc;




