
SELECT * FROM emp;


--��)
--emp ���̺��� ������ ���� ���� �޴� ���������� ��ȸ�Ͻÿ�
SELECT MAX(sal) FROM emp; --500

SELECT *
FROM emp
WHERE sal=(SELECT MAX(sal) FROM emp);

--��)
--��� �޿����� ���� �޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�
SELECT AVG(sal) FROM emp; --328

SELECT ename,deptno,sal
FROM emp
WHERE sal>(SELECT AVG(sal) FROM emp);

--��) �μ��ڵ� 10�� �ְ�޿����� �� ���� �޿��� �޴� ��������� ��ȸ�Ͻÿ�
SELECT MAX(sal) 
FROM emp 
WHERE deptno=10; --225

SELECT *
FROM emp
WHERE sal>(
                SELECT MAX(sal) 
                FROM emp 
                WHERE deptno=10
                );


--��) ����ΰ� ���� �Ի��Ͽ� �Ի��� ������߿���
--���������� �޿��� ���� �޴� ����� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�

SELECT hiredate
FROM emp
WHERE ename='�����'; --02/01/11 
SELECT sal
FROM emp
WHERE ename='������'; --325

SELECT *
FROM emp
WHERE 
    hiredate=(
    SELECT hiredate
    FROM emp
    WHERE ename='�����'
) AND 
    sal<(
    SELECT sal
    FROM emp
    WHERE ename='������'
);








