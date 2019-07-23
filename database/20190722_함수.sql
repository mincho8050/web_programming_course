

--[����Ŭ �Լ�]

--ASCII���ں�ȯ
SELECT CHR(65) FROM dual;   --A
SELECT CHR(97) FROM dual;   --a

--|| ���տ�����
--A || B -> A�� B�� �����Ŵ
SELECT ename || '�� ������ ' ||  job || '�Դϴ�'
FROM emp;

--CONCAT(Į����,'���ڿ�')
--Į���� �ش��ϴ� ���ڿ��� ����
SELECT CONCAT(ename,'�� ������'),job
FROM emp;
SELECT CONCAT('�ι̿���',' �ٸ���')
FROM dual;

--SYSDATE
--�ý����� ���� ��¥/�ð��� �����ϴ� �Լ�
SELECT SYSDATE FROM dual;
SELECT SYSDATE+100 FROM dual;
SELECT SYSDATE-100 FROM dual;


--ROWNUM : ��(���ڵ�) ��ȣ
--ROWID : ��(���ڵ�)�� �ּҰ�
--�ǻ�Į��(����Į��)
SELECT empno,ename FROM emp;
SELECT ROWNUM,empno,ename FROM emp;
SELECT ROWID,empno,ename FROM emp;
SELECT ROWNUM,ROWID,empno,ename FROM emp;

--�� ��¥ ������ ���� �� ��� �Լ�
SELECT MONTHS_BETWEEN('2019-09-01','2019-07-05') 
FROM dual; --1.87096774193548387096774193548387096774
SELECT ROUND(MONTHS_BETWEEN('2019-09-01','2019-07-05'),1)
FROM dual; --1.9

--TO_DATE('��¥���ڿ�')
--���ڿ��� ��¥������ ��ȯ
SELECT TO_DATE('2019-05-20')
FROM dual;
SELECT TO_DATE('2019-05-20')-TO_DATE('2019-05-05')
FROM dual;  --15

--TO_CHAR(��¥,'�������')
--��¥�ڷ����� �����͸� ���ں�ȯ �Լ�
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH:MI:SS DAY')
FROM dual;  --2019-07-22 ���� 04:26:09 ������
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH24:MI:SS DAY')
FROM dual; --2019-07-22 ���� 16:26:23 ������ ->24�ð� ����

--���ں�ȯ �Լ�
--TO_NUMBER('���� ������ ���ڿ�')
--���������� TO_NUMBER()�� ȣ���
SELECT 100+10, 100-10,100*10,100/10
FROM dual;
SELECT '100'+1 FROM dual;   --101

--�����Լ�
--TRUNC(����1,�ڸ���)
--����, ����1�� �Ҽ��� �ڸ������� �߻�
--ROUND(����1,�ڸ���)
--����1�� �Ҽ��� �ڸ������� �ݿø�
--CEIL(����1)
--�ø�

--�޿����, �޿��հ�, �ְ�޿�, �����޿�, ����
SELECT
    AVG(sal),
    SUM(sal),
    MAX(sal),
    MIN(sal),
    COUNT(sal) --NULL�� ī��Ʈ ����
FROM
    emp;

SELECT ROUND(AVG(sal),2)    --�Ҽ� ��° �ڸ����� �ݿø�
            ,CEIL(AVG(sal))           --�ø�
            ,TRUNC(AVG(sal),1)      --�Ҽ� ù°�ڸ����� ����
FROM emp;

--��) �� �����鿡 ���ؼ� ������ �̸��� �ټӿ����� ���Ͻÿ�
--��, �ټӿ����� �������� �����Ͽ� ��Ÿ���ÿ�
SELECT ename
            ,TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12,0) AS �ټӿ���
FROM emp;

SELECT ename
            ,TRUNC(
                (SYSDATE-hiredate)/365
             )   --(����1,0)�̶�� ���ص� ����!
FROM emp;            


--DECODE(A,B,A==B�� ���� ��, A<>B�� ���� ��)
--A<>B�� ���� ���� �����ϸ� NULL�� ó����
--DECODE�Լ��� �Ű������� ������ �������ǿ� ���� �þ �� ����

--��)�ֹι�ȣ�� �̿��� �������
--SQL�� index�� 1���� ����(java�� 0���� ����!! ��������)
SELECT SUBSTR('8912303',7,1) FROM dual; --3
SELECT DECODE(SUBSTR('8912303' ,7 ,1) ,3 ,'����' ,'����')
FROM dual;


--��) �� ������ �̸�, ����, �޿��� ��Ÿ���� �� �޿���
--5�ڸ��� ��Ÿ���� ������ �ڸ����� '*'�� ǥ���Ѵ�
--������ 300�̻��� ������ ��Ÿ���ÿ�
SELECT ename, job, LPAD(sal, 5, '*')
FROM emp
WHERE sal>=300;

--��) �� �����鿡 ���ؼ� ������ �̸��� �ٹ��������� ��Ÿ���µ�
--�ٹ��������� 100���� �̻��� ������ ��Ÿ���ÿ�
--�ٹ��������� �Ҽ� �κ��� ������ ���� �κи� ��Ÿ���ÿ�
SELECT
    ename,
    trunc(months_between(SYSDATE, hiredate))
FROM
    emp
WHERE
    trunc(months_between(SYSDATE, hiredate)) >= 100;



--��) ��ü ������ ���Ͽ� ������ �̸��� ����, �� �ٹ���(week)���� ���Ͻÿ�
--��, �ٹ��ּ��� ���� �������� ��Ÿ����, �ٹ��ּ��� ������ �̸��� ���Ͽ� �������� �����Ͻÿ�
SELECT
    ename,
    job,
    trunc((SYSDATE - hiredate) / 7)
FROM
    emp
ORDER BY
    trunc((SYSDATE - hiredate) /7) DESC,
    ename ASC;



















