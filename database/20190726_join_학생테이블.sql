--------------------------------------------------------------------------------------------------------------------------------
--[�л���� ���α׷�]

--                       �������̺�
--�л����̺�       --  ����  --          �������̺�
--    1                                                   n
--    n                                                   1
--    n                                                   m     :   �ٴ�� ���� / �������̺� �ʿ�
--ȸ�����̺�       --  ����  --          ��ȭ���̺�
--    1                                                   n
--    m                                                  1
--    n                                                   m
--ȸ�����̺�       --  ����  --          ��ǰ���̺�
--ȸ�����̺�       --  ����  --          �������̺�

--1:1 ����
--����<->�μ�
--�б�<->�л�
--�ø���ġ��<->��ġ����



------------------------------------------------------------------------------------------------------------------------------------------------------
--�л����̺�
CREATE TABLE tb_student (
    hakno CHAR(5) PRIMARY KEY
    ,uname VARCHAR(20) NOT NULL
    ,email VARCHAR(50) UNIQUE
    ,address VARCHAR(20) NOT NULL
    ,phone VARCHAR(20)
    ,regdt DATE DEFAULT SYSDATE
);


--�л����̺� �߰�
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1001','ȫ�浿','11@naver.com','����','111-2222');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1002','ȫ�浿','22@daum.net','����','331-2223');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1003','������','33@naver.com','����','111-2224');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1004','ȫ�浿','44@soldesks.com','�λ�','222-2225');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1005','���޷�','55@naver.com','����','445-2226');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1006','������','66@soldsks.com','����','331-2227');

SELECT * FROM tb_student;
--���ڵ� ����
SELECT COUNT(*) FROM tb_student;


--��) ������ �ο����� �ο��������� ��ȸ
SELECT address , COUNT(*)
FROM tb_student
GROUP BY address
ORDER BY COUNT(*);
--��) ���������� ������� ��ȸ
SELECT uname , COUNT(*) || '��'
FROM tb_student
GROUP BY uname;



---------------------------------------------------------------------------------------------------------



--�������̺� ����
CREATE TABLE tb_gwamok(
    gcode CHAR(5) PRIMARY KEY       --�����ڵ�
    ,gname VARCHAR(20) NOT NULL     --�����
    ,ghakjum NUMBER(2) DEFAULT 1    --����
    ,regdt DATE DEFAULT SYSDATE         --����� / �������ϱ����ؼ� ����
);
--�������̺� �� �߰�
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p001', 'OOP', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p002', 'Oracle', 2);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p003', 'JSP', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d001', '��ǥ��', 1);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d002', '���伥', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('d003', 'HTML', 1);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('c001', '�ǳ�����', 3);
INSERT INTO tb_gwamok (gcode, gname, ghakjum)
VALUES ('p004', 'JavaScript', 2);

SELECT * FROM tb_gwamok;
--���ڵ��� ����
SELECT COUNT(*) FROM tb_gwamok;

--��) �л����̺��� �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�
--(�ּҴ� �������� ���)
SELECT hakno 
            ,uname
            ,CASE WHEN address='����' THEN 'Seoul'
                        WHEN address='����' THEN 'Jeju'
                        WHEN address='�λ�' THEN 'Busan'
            END eng_address
FROM tb_student;

--��) �ּҺ� �ο����� 3�� �̸� ���� ��ȸ
SELECT address, COUNT(*)
FROM tb_student
GROUP BY address
HAVING COUNT(*) <3;

--��) ���α׷� ������ ��ȸ
SELECT gcode, gname, ghakjum
FROM tb_gwamok
WHERE gcode LIKE 'p%';

--��) ������ �������� 3������ ��ȸ
SELECT *
FROM(
    SELECT *
    FROM tb_gwamok
    WHERE gcode LIKE 'd%'
) 
WHERE ghakjum =3;

--�����Թ��
SELECT *
FROM tb_gwamok
WHERE gcode LIKE 'd%' AND ghakjum=3; 


--��) ���α׷� �������� ���� ��պ��� ���� ���α׷� �������� ��ȸ
SELECT AVG(ghakjum)
FROM tb_gwamok
WHERE gcode LIKE 'p%';  --�������:2.5

SELECT *
FROM tb_gwamok
WHERE ghakjum<(SELECT AVG(ghakjum)
                            FROM tb_gwamok
                             WHERE gcode LIKE 'p%') 
AND  gcode LIKE 'p%';




---------------------------------------------------------------------------------------------------------

--���� ���̺� ����
CREATE TABLE tb_sugang(
    sno NUMBER PRIMARY KEY  --�Ϸù�ȣ
     ,hakno CHAR(5) --�й� , �θ����̺�� �����ϰ�! (�л����̺��� �й�)
    ,gcode CHAR(5) --�����ڵ� , �θ����̺�� �����ϰ� (�������̺��� �����ڵ�)
    --���������� �̷��� ���� �ۼ��� ���� ����
   -- ,PRIMARY KEY(sno)
    ,FOREIGN KEY(hakno) REFERENCES tb_student(hakno) 
    ,FOREIGN KEY(gcode) REFERENCES tb_gwamok(gcode)
);

--�ɼ�
--    ON UPDATE CASCADE--�θ����̺��� ������Ʈ�� �ϸ� ���� ������Ʈ
--    ON DELETE NO ACTION --�θ����̺��� �����Ǹ� �θ����̺� ���� /CASCADE�� ���� ����

--�������̺� ������ ����
CREATE SEQUENCE sugang_seq;

--�������̺� ���߰�
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1002','p001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1004','p001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1003','d002');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1001','p004');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1001','c001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1006','d002');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1002','p004');


SELECT COUNT(*) FROM tb_sugang;
SELECT * FROM tb_sugang;


--�������̺�� �л����̺�
--1������ ���
SELECT tb_sugang.hakno
            ,tb_sugang.gcode
            ,tb_student.uname
FROM tb_sugang JOIN tb_student
ON tb_sugang.hakno=tb_student.hakno;
--ALIAS�̿�
SELECT SU.hakno
            ,SU.gcode
            ,STU.uname
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno;

--�������̺�� �������̺�
SELECT SU.hakno
            ,SU.gcode
            ,GW.gname
            ,GW.ghakjum
FROM tb_sugang SU JOIN tb_gwamok GW
ON SU.gcode=GW.gcode;


--�������̺��� �������� �л����̺�, �������̺� ����

SELECT SU.hakno
            ,SU.gcode
            ,STU.uname
            ,GW.gname
            ,GW.ghakjum
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno JOIN tb_gwamok GW
ON SU.gcode=GW.gcode;

SELECT * FROM tb_student;
SELECT * FROM tb_gwamok;
SELECT * FROM tb_sugang;

--��) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸
--�й�, �̸�, �ּ� ��ȸ
SELECT SU.hakno
            ,STU.uname
            ,STU.address
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
WHERE address='����';


--��) �������� ������û �ο��� ������ ��ȸ�Ͻÿ�
--����
--���� 5
--���� 3
--�λ� 1

SELECT address
            ,COUNT(*)
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
GROUP BY address
ORDER BY COUNT(*) DESC;

--�������� �Ͻ� ���
select SU.hakno, STU.uname, STU.address
from tb_sugang SU join tb_student STU
on SU.hakno=STU.hakno
order by STU.address;


select address, count(*)
from(
     select SU.hakno, STU.uname, STU.address
     from tb_sugang SU join tb_student STU
     on SU.hakno=STU.hakno
    )AA
group by AA.address;


select address, hakno, count(*)
from(
     select SU.hakno, STU.uname, STU.address
     from tb_sugang SU join tb_student STU
     on SU.hakno=STU.hakno
    )AA
group by AA.address, AA.hakno;



--��) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ
--����
--p001 2 OOP
--p002 1 Oracle
--p003 1 JSP
--d001 1 ��ǥ��

SELECT AA.gcode
            ,AA.cnt
            ,gname
FROM(
    SELECT gcode
                ,COUNT(gcode) AS cnt
    FROM tb_sugang
    GROUP BY gcode
) AA JOIN tb_gwamok GW
ON AA.gcode=GW.gcode
ORDER BY AA.gcode;



--����) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
--(�ߺ��Ǵ� ����� 1�� ó��)
--����(�������̶� �ٸ� �� ����)
--�λ�1
--����2
--����2

SELECT SU.hakno, STU.address
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
ORDER BY STU.address;

SELECT AA.address
            ,COUNT(*)
FROM (
    SELECT SU.hakno, STU.address
    FROM tb_sugang SU JOIN tb_student STU
    ON SU.hakno=STU.hakno
    ORDER BY STU.address
) AA
GROUP BY AA.address; --�ߺ��Ȱ͵� �׳� ī��Ʈ


--�������� �Ͻ� ��
SELECT STU.address, SU.hakno
FROM tb_sugang SU JOIN tb_student STU
ON SU.hakno=STU.hakno
GROUP BY STU.address, SU.hakno;

SELECT AA.address , COUNT(AA.address)
FROM(
    SELECT STU.address, SU.hakno
    FROM tb_sugang SU JOIN tb_student STU
    ON SU.hakno=STU.hakno
    GROUP BY STU.address, SU.hakno
) AA
GROUP BY AA.address;




