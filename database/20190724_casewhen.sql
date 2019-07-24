

--CASE WHEN ~ THEN END ����
--����)
--CASE WHEN ����1 THEN ���Ǹ����� ��1
--        WHEN ����2 THEN ���Ǹ����� ��2
--        WHEN ����3 THEN ���Ǹ����� ��3
--        ...
--        ELSE ��
--END ���Į����

SELECT * FROM sungjuk;

--��) ���������� ���� A , B, C , D, F������ ���Ͻÿ�
SELECT uname
            ,kor
            ,CASE WHEN kor>=90 THEN 'A����'
                       WHEN kor>=80 THEN 'B����'
                       WHEN kor>=70 THEN 'C����'
                        WHEN kor>=60 THEN 'D����'
                       ELSE 'F����'
            END AS grade
FROM sungjuk;  
    

--��) addr Į���� �ּҸ� �ѱ۷� ��ȸ�Ͻÿ�


SELECT uname
            ,addr
            ,CASE   WHEN addr='Seoul' THEN '����'
                        WHEN addr='Jeju' THEN '����'
                        WHEN addr='Busan' THEN '�λ�'
                        ELSE '����'
                        --WHEN addr='Suwon' THEN '����' �̷��� �ۼ��ص���
            END AS kor_name
FROM sungjuk;


SELECT * FROM emp;

--��) �μ��ڵ� 10 �渮��, 20 ������, 30 �ѹ���, 40 ������
SELECT ename
            ,deptno
            ,CASE   WHEN deptno=10 THEN '�渮��'
                        WHEN deptno=20 THEN '������'
                        WHEN deptno=30 THEN '�ѹ���'
                        WHEN deptno=40 THEN '������'
            END AS deptno_name
FROM emp;

--��) Ŀ�̼� 5�̻� '5%' , 4�̻� '4%' 3�̻� '3%' , 2�̻� '2%' ������ '����'
SELECT ename
            ,comm
            ,CASE   WHEN NVL(comm,0)>=5 THEN '5%'
                        WHEN NVL(comm,0)>=4 THEN '4%'
                        WHEN NVL(comm,0)>=3 THEN '3%'
                        WHEN NVL(comm,0)>=2 THEN '2%'
                        ELSE '����'
            END AS bonus
FROM emp;

--DECODE() �Լ�
--���� ���Ͽ� �ش��ϴ� ���� �����ִ� �Լ�. 
--��, �񱳽ÿ� ��Ȯ�� ���� ��(=)�� �񱳰� ������
--DECODE(A, B, �������� ��, �ٸ����� ��)
SELECT ename
            ,deptno
            ,DECODE(
                deptno, 10,'�渮��'
                            ,20,'������'
                            ,30,'�ѹ���'
            ) �μ�
FROM emp;

SELECT uname, (kor+eng+mat)/3 AS aver
FROM sungjuk;

SELECT uname, ((kor+eng+mat)/3)/10 AS aver
FROM sungjuk;

SELECT uname, TRUNC(((kor+eng+mat)/3)/10) AS aver
FROM sungjuk;

SELECT uname
            ,TRUNC(((kor+eng+mat)/3)/10)
            ,DECODE(
                TRUNC(((kor+eng+mat)/3)/10),  10, 'A'
                                                                ,9, 'A'
                                                               ,8, 'B'
                                                               ,7, 'C'
                                                               ,6, 'D'
                                                               ,'F'
            ) grade
FROM sungjuk;



