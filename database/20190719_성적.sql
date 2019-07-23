

CREATE TABLE sungjuk (
    sno NUMBER NOT NULL PRIMARY KEY
    ,uname VARCHAR(50) NOT NULL
    ,kor NUMBER(3) NOT NULL CHECK(kor BETWEEN 0 AND 100)
    ,eng NUMBER(3) NOT NULL CHECK(eng BETWEEN 0 AND 100)
    ,mat NUMBER(3) NOT NULL CHECK(mat BETWEEN 0 AND 100)
    ,tot NUMBER(3) DEFAULT 0
    ,aver NUMBER(5,2) DEFAULT 0
    ,addr VARCHAR(30) CHECK(addr IN ('Seoul','Jeju','Suwon','Busan'))
    ,wdate DATE DEFAULT SYSDATE
);

SELECT
    *
FROM tab;

SELECT * FROM sungjuk;


--�� ����
--DEFAULT ~���� �Ǿ��ִ°��� ���� �־����� ������ ~���� ���´�
--DEFAULT: Į���� �����Ͱ� �Էµ��� ���� ��� �ڵ����� �Էµȴ�
INSERT INTO sungjuk(sno,uname,kor,eng,mat,addr)
VALUES(1,'�����',77,88,99,'Seoul');

--[������ DB���� ���̺��� �ٽɱ��]
--C CREATE      -> INSERT��
--R READ         -> SELECT��
--U UPDATE     -> UPDATE��
--D DELETE      -> DELETE��

--�������� ���̵�ƼƼ�� ȭ��� ������ ��ǥ�� �ƴ϶� WHERE������ ���� ����


------------------------------------------------------------------------------------------------------------------------------------------------



--�ڵ����� �Ϸù�ȣ �ο�
--�������� ���̵�ƼƼ�� ȭ��� ������ ��ǥ�� �ƴ϶� WHERE������ ���� ����
--Oracle : ������
--MySQL : IDENTITY

--[������(sequence)]
-----------------------------------------------------------------------------------------
--1) ����
-- �������� ���ڰ��� �ڵ����� ������Ű�� ���ڸ� �߻���Ű�� ��ü

--2) ����
--create sequence �������̸�
 --[increment by ����]
 --[start with ����]
 --[maxvalue ����]
 --[minvalue ����]
 --[cycle | nocycle] --�Ϸù�ȣ ��ȯ����
 --[cache | nocache] --���� ó���� ���� �������� ���� �޸𸮿� ����(�̸� �߱��� ���� ������ ��)
                                --������ ���������� �߰��� ������ ����(cache)

--3) ������ ȣ�� �Լ�
--  ����:������ ���� �� nextval�� ȣ���ؾ� �������� �ʱⰪ�� ������)
  
-- nextval : �������� ��ȯ��. ������ȣ �߱�
--              select sungjuk_seq.nextval from dual;

-- currval : ���簪�� ��ȯ��. �ֱٹ߱޵� ��ȣ
--              select sungjuk_seq.currval from dual;

--4) ���������� �̿��� �Ϸù�ȣ �߱�
--   ���� : �������� ȥ���ؼ� ������� �ʵ��� ����


CREATE SEQUENCE sungjuk_seq;    --������ ����
                                                        --�̷����ϸ� ���۰� 1, ������ 1
DROP SEQUENCE sungjuk_seq; --������ ����

CREATE SEQUENCE sungjuk_seq --������ �̸�
INCREMENT BY 1                         --������
START WITH 103                          --���۰�
MAXVALUE 1000000000               --�ִ�
NOCACHE                                    --ĳ����뿩��
NOCYCLE;                                    --��ȯ���� / ��ȯ���θ� �ɾ���� �ʴ� �̻� �ѹ� ����� ���� ������ ����                    


--�ӽ����̺� : dual
--���������� �Ϸù�ȣ �߻�
SELECT sungjuk_seq.NEXTVAL  FROM dual;
--���� ������ ��ȣ�� Ȯ��
SELECT sungjuk_seq.CURRVAL  FROM dual;



--����) ������ ����
--c_emp ���̺� ������ �Է½� sequence�� �̿��ؼ� id�� �Է��ϵ���
--206���� �����Ͽ� 1�� �����ǰ�, �ִ밪�� 999�� �����Ͽ� �������� �����Ͻÿ�
--������ �̸� : c_emp_seq

CREATE SEQUENCE c_emp_seq
INCREMENT BY 1
START WITH 206
MAXVALUE 999;


--������ ��� ��ȸ
SELECT * FROM USER_OBJECTS
WHERE OBJECT_TYPE='SEQUENCE';

-- ���ڵ� ���� ����
DELETE FROM sungjuk;

--���������� �ְ��� ��ȸ
SELECT MAX(kor) FROM sungjuk;

--[nvl() �Լ�]
--null���� �����ϴ� �÷��� Ư���� ������ ��ȯ�ϴ� �Լ�
--���� : nvl(null���� �����ϰ� �ִ� �÷��̳� ��, ��ȯ�ϰ��� �ϴ� ��ǥ��)
--null���� ������ 0���� ��ü
SELECT NVL(MAX(kor),0) FROM sungjuk;
--���������� �̿��� �Ϸù�ȣ ���ϴ� ��
SELECT NVL(MAX(kor),0)+1 FROM sungjuk;

INSERT INTO sungjuk(sno,uname,kor,eng,mat,addr)
VALUES((SELECT
    nvl(MAX(kor), 0) + 1
FROM
    sungjuk)
    ,'�����'
    ,99
    ,88
    ,77
    ,'Seoul');
    
SELECT * FROM sungjuk;

DELETE FROM sungjuk WHERE uname='�����';

--[���������� �Է�]
insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon');

insert into sungjuk(sno,uname,kor,eng,mat,addr)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon');

SELECT * FROM sungjuk;


-----------------------------------------------------------------------------------------------------------------------------------------------------------


--������ ������
--DISTINCT
--GROUP BY�� (�߿�!)


--distinct : Į���� �ߺ������� ������ ��ǥ�� 1���� ���
--����) distinct (Į����)

SELECT  addr FROM sungjuk;
SELECT  DISTINCT(addr) FROM sungjuk;

SELECT DISTINCT(addr)
FROM sungjuk
ORDER BY addr; --��������

SELECT DISTINCT(addr)
FROM sungjuk
ORDER BY addr DESC; --��������


--GROUP BY ��
--Į���� ���� ���볢�� �׷�ȭ ��Ŵ
--����) GROUP BY Į����1, Į����2, ~~
--��ǥ�� 1���� ���
SELECT addr
FROM sungjuk
GROUP BY addr;

--�̷��� �ϸ� ����
--ORA-00979: not a GROUP BY expression
--GROUP BY�� ���� ������� ������ 1���� �����ϴ� ���� ��ȸ�� �� �ִ�.
--�����Լ��� ���� ����Ѵ�.
SELECT addr
FROM sungjuk
GROUP BY addr;

--�����Լ�
SELECT
    COUNT(*)    --���ڵ� ����
    ,SUM(kor)   --�������� �հ�
    ,AVG(eng)   --�������� ���
    ,MAX(mat)   --�������� �ְ���
    ,MIN(tot)       --���� ������
FROM sungjuk;

--��) �� �ּҺ� �ο����� ���Ͻÿ�
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr;

SELECT addr,COUNT(*) AS cnt
FROM sungjuk
GROUP BY addr;

SELECT addr,COUNT(*) ����     --AS ��������
FROM sungjuk
GROUP BY addr;

--�ּҺ� �ο����� ���� �� �ּҼ����� �����Ͻÿ�
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
ORDER BY addr;

--�ּҺ� �ο����� ���� �� �ο��� ������ �������� �����Ͻÿ�
SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
ORDER BY COUNT(*) DESC;

--�ּҺ� �������� ����� ���� �� �������� ��ռ����� �������� �����Ͻÿ�

SELECT addr,ROUND(AVG(kor),2)
FROM sungjuk
GROUP BY addr
ORDER BY AVG(kor) DESC;


--��) ������ ��,��,�� �ְ����� ������ ������ �����ؼ� ��ȸ�Ͻÿ�
SELECT addr,MAX(kor),MAX(eng),Max(mat)
FROM sungjuk
GROUP BY addr
ORDER BY addr;

SELECT addr,mat
FROM sungjuk
ORDER BY addr;


--1�� ���� �����ϴٸ� �� �׷쳻���� 2�� �׷��� �����ϴ�.

--�������� �׷����� �ϰ�, ���� ������ ���ٸ� 2�� �׷����� ���� �������� �׷����� �Ͻÿ�
SELECT addr,mat,COUNT(*)
FROM sungjuk
GROUP BY addr , mat;

--��) aver Į������ ���� ��
--      averĮ������ 50�� �̻� ���ڵ� �������
--      ������ ������ ����� �ݿø� �Ҽ��� 1�ڸ����� ���� �� ��ȸ�Ͻÿ�

--��ձ��ϱ�
UPDATE sungjuk
SET aver=(kor+eng+mat)/3;

SELECT * FROM sungjuk;

--��ü averĮ�� ��ȸ
SELECT aver
FROM sungjuk;

--averĮ�� 50�̻� ��ȸ
SELECT addr,aver
FROM sungjuk
WHERE aver>=50;

SELECT addr
            ,ROUND(AVG(kor),1) AS a_kor
            ,ROUND(AVG(eng),1) AS a_eng
            ,ROUND(AVG(mat),1) AS a_mat
FROM sungjuk
WHERE aver>=50
GROUP BY addr
ORDER BY addr;


SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr;


--[������]
--WHERE ������
--HAVING ������ -> GROUP BY �� �Բ� ���
--ON ������ -> ���̺� ������ �� ���


SELECT addr,COUNT(*)
FROM sungjuk
GROUP BY addr
HAVING COUNT(*)=3;


--��) ������ �������� ����� ���� �� �� ����� 80�� �̻��� ������ ��ȸ

SELECT addr,ROUND(AVG(kor),0)
FROM sungjuk
GROUP BY addr
HAVING avg(kor)>=80;

--������� 60~79���̸� ��ȸ
SELECT addr,ROUND(AVG(kor),0)
FROM sungjuk
GROUP BY addr
HAVING AVG(kor) BETWEEN 60 AND 79;

























