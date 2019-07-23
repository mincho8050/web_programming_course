

SELECT ename,deptno
FROM emp;

--GROUP BY �� �����Լ��� ���� ���
--�����Լ�
-- : SUM() , AVG() , MAX() , MIN() , COUNT()

--��) �μ��ڵ庰�� �޿����� ��ȸ�ϱ�
SELECT deptno
FROM emp
GROUP BY deptno;

SELECT deptno
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT deptno,ename --����
FROM emp
GROUP BY deptno
ORDER BY deptno;


SELECT deptno   AS �μ��ڵ�
            ,SUM(sal)
            ,ROUND(AVG(sal))
            ,MAX(sal)
            ,MIN(sal)
            ,COUNT(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;


--�μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno;

--HAVING ������
--GROUP BY�� ����ϴ� ����!!

--�μ��ڵ庰 �޿��հ踦 ���ؼ�
--�� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�
SELECT deptno,SUM(sal) AS �޿��հ�
FROM emp
GROUP BY deptno
HAVING SUM(sal)>=1500;

--���� 
--��������� ����
SELECT deptno,SUM(sal) AS �޿��հ�  --������� 4��
FROM emp                --������� 1��
GROUP BY deptno     --������� 2��
HAVING �޿��հ�>=1500;--������� 3��

--�޿��� 300�̻� �������߿���
--�μ��ڵ庰 �޿������ ���ؼ� �޿������� ��ȸ�Ͻÿ�
SELECT AVG(sal) , COUNT(sal) --11
FROM emp;   --328 > ��ü�� ���

SELECT AVG(sal)  , COUNT(sal) --7
FROM emp
WHERE sal>=300; --398 > WHERE �������� ����� �Ϻκи� ����

--�μ��� �޿������ 300�̻� ��ȸ
SELECT AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=300;

--�޿��� 300�̻� �������߿��� 
--�μ��ڵ庰 �޿������ ���ؼ� �޿������� ����
SELECT deptno , AVG(sal)
FROM emp
WHERE sal>=300
GROUP BY deptno
ORDER BY AVG(sal);  --378,413


--�޿��� 300�̻� �������߿���
--�μ��ڵ庰 �޿������ 400 �̻���
--�޿������� ��ȸ�Ͻÿ�
SELECT deptno,AVG(sal)     --5��°
FROM emp  --1��°
WHERE sal>=300--2��°
GROUP BY deptno--3��°
HAVING AVG(sal)>=400    --4��°
ORDER BY AVG(sal); --413 ,6��°

--��) �μ��� �޿��Ѿ�(�޿�+Ŀ�̼�)�� ���� ���� �޿��Ѿװ� ���� ���� �޿��Ѿ�,
--�޿��Ѿ��� ��ձݾ��� �ݿø��ؼ� �Ҽ��� 1�ڸ����� ����Ͻÿ�
SELECT sal+NVL(comm,0) --null���� ����ϸ� null�� ����
FROM emp;
--MySQL �� IFNULL�̶� �Լ��� �ִ�(NVL ���-Oracle�Լ���)
SELECT deptno
            ,MAX(sal+NVL(comm,0)) 
            ,MIN(sal+NVL(comm,0))
            ,ROUND(AVG(sal+NVL(comm,0)),1)
FROM emp
GROUP BY deptno
ORDER BY deptno;




SELECT hiredate FROM emp;

--��) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
--TO_CHAR(��¥,'�������)
--��¥�ڷ����� �����͸� ���ں�ȯ �Լ�
SELECT TO_CHAR(hiredate,'mm')
FROM emp;

SELECT TO_CHAR(hiredate,'mm') || '��'
FROM emp;

SELECT TO_CHAR(hiredate,'mm'),COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate,'mm')
ORDER BY TO_CHAR(hiredate,'mm');

