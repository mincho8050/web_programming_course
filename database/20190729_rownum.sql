

--ROWNUM : ���ȣ
--ROWID : ���� �ּҰ�

--�ٹ�ȣ
SELECT ROWID
            ,ROWNUM
            ,hakno
            ,uname
FROM tb_student;

--���� �� �ٹ�ȣ
SELECT ROWID
            ,ROWNUM
            ,hakno
            ,uname
FROM tb_student
ORDER BY hakno;


--����
SELECT address
            ,ROWNUM
FROM tb_student
GROUP BY address;

--�� ��ȣ 1~3���� ��ȸ
SELECT ROWNUM
            ,hakno
            ,uname
FROM tb_student
WHERE ROWNUM>=1 AND ROWNUM<=3;

--�ٹ�ȣ 4~6���� ��ȸ(��ȸ�ȵ�)
SELECT ROWNUM
            ,hakno
            ,uname
FROM tb_student
WHERE ROWNUM>=4 AND ROWNUM<=6;


--���������� ���ȣ �߰�
SELECT addr
            ,ROWNUM
FROM(SELECT address AS addr
            FROM tb_student
            GROUP BY address);

--�ٹ�ȣ 4~6 ��ȸ
SELECT hakno
            ,uname
            ,address
FROM tb_student
ORDER BY hakno;

SELECT ROWNUM rnum
            ,hakno
            ,uname
            ,address
FROM (
    SELECT hakno
                ,uname
                ,address
    FROM tb_student
    ORDER BY hakno
);
--����Į�� ROWNUM�� ����Į������ �νĽ�Ų �� 
--�ٸ� ��ɾ�� �����ؼ� ����Ѵ�(�������� �� ����� ��)
SELECT rnum
            ,hakno
            ,uname
            ,address
FROM(
    SELECT ROWNUM rnum
                ,hakno
                ,uname
                ,address
    FROM (
        SELECT hakno
                    ,uname
                    ,address
        FROM tb_student
        ORDER BY hakno
    )
)
WHERE rnum>=4 AND rnum<=6;


----------------------------------------------------------------------------------------


--��) �й��� ������û �� ������ ���ϰ�
--�� ���� ������ ���� �� ������ ���� 3�Ǹ� ��ȸ�ϱ�
--(�й�, �̸�, ������)

--���� �ڵ庰 ���� ��������
SELECT su.hakno
            ,su.gcode
            ,gw.ghakjum
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode;

--�й����� ������ ���ϱ�
SELECT su.hakno
            ,SUM(gw.ghakjum) AS ������
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno;

--������������ �����ϱ�
SELECT su.hakno
            ,SUM(gw.ghakjum) AS ������
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno
ORDER BY SUM(gw.ghakjum) DESC;

--�л��̸� �������� , ���ȣ ����ϱ�
SELECT aa.hakno
            ,aa.������
            ,stu.uname
            ,ROWNUM
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS ������
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
    ORDER BY SUM(gw.ghakjum) DESC
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
ORDER BY aa.hakno;

--���������� 3�� ����ϱ�
SELECT aa.hakno
            ,aa.������
            ,stu.uname
            ,ROWNUM
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS ������
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
    ORDER BY SUM(gw.ghakjum) DESC
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
WHERE ROWNUM>=1 AND ROWNUM<=3;


--���ȣ 4~6 ����ϱ�

--������ �߰�
SELECT *
FROM tb_sugang;
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1005','c001');
INSERT INTO tb_sugang(sno, hakno, gcode)
VALUES(sugang_seq.NEXTVAL ,'g1005','d003');
--�л����̺� �߰�����..
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1007','������','77@naver.com','����','445-4521');
INSERT INTO tb_student (hakno , uname, email, address, phone)
VALUES ('g1008','�迬��','88@soldsks.com','�λ�','754-1235');

--ROWNUM�� ���� Į���̱� ������ �������� ���� ������� ����
--���� Į������ �ν��� �� ����� ���� ��õ
SELECT hakno
            ,������
            ,uname
            ,rnum
FROM (
    SELECT aa.hakno
                ,aa.������
                ,stu.uname
                ,ROWNUM AS rnum
    FROM(
        SELECT su.hakno
                    ,SUM(gw.ghakjum) AS ������
        FROM tb_sugang su JOIN tb_gwamok gw
        ON su.gcode=gw.gcode
        GROUP BY su.hakno
        ORDER BY SUM(gw.ghakjum) DESC
    ) aa JOIN tb_student stu
    ON aa.hakno=stu.hakno
) bb 
WHERE bb.rnum>=4 AND bb.rnum<=6;



------------------------------------------------------------------------------------------------------------------------


--��) �й��� ������û�� �������� ��ȸ�Ͻÿ�
--(��, ������û���� ���� �л��� �������� 0���� ǥ��)
--����)>������Ȯ�� �������� �ٸ�.
--g1001 ȫ�浿 8
--g1002 ����ȭ 6
--g1003 ���޷� 0


SELECT *
FROM tb_sugang su JOIN tb_gwamok gw
ON su.gcode=gw.gcode;

--RIGHT JOIN ���
SELECT stu.hakno
            ,stu.uname
            ,SUM(NVL(aa.ghakjum,0)) AS ������
FROM (
    SELECT *
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
) aa RIGHT JOIN tb_student stu
ON aa.hakno=stu.hakno
GROUP BY stu.hakno , stu.uname
ORDER BY stu.hakno;





--��) �л����̺��� �й������� ���� �� ���ȣ�� �Ʒ��� ���� �ٿ��� ��ȸ�Ͻÿ�
--����)> �������� �̰ſ� �������� ���� ������ Ȯ��
--    8  g1001	ȫ�浿	hong1@naver.com	  ����	111-5588	19/07/26
--    7  g1002	ȫ�浿	hong2@soldesk.com ����	331-2223	19/07/26
--    6  g1003	������	user1@daum.net	  ����	111-2224	19/07/26
--    5  g1004	ȫ�浿	hong3@naver.com	  �λ�	222-2255	19/07/26
--    4  g1005	���޷�	user2@soldesk.com ����	445-2277	19/07/26
--    3  g1006	������	user3@naver.com	  ����	578-5588	19/07/26
--    2  g1007	�迬��	user7@naver.com	  ����	578-5588	19/07/30
--    1 g1008	������	user8@naver.com	����	578-5588	19/07/30

SELECT *
FROM tb_student
ORDER BY hakno;


SELECT ROWNUM  AS rnum
            ,hakno
            ,uname
            ,email
            ,address
            ,phone
            ,regdt
FROM tb_student
ORDER BY rnum DESC;


SELECT ROW_NUMBER() OVER ( ORDER BY hakno DESC) AS rnum
            ,hakno
            ,uname
            ,email
            ,address 
            ,phone
            ,regdt
FROM tb_student
ORDER BY rnum DESC;


--�������� �Ͻ� ���
SELECT hakno
            ,uname
            ,ROWNUM AS rnum
FROM (
    SELECT hakno
                ,uname
    FROM tb_student
    ORDER BY hakno DESC
)
ORDER BY rnum DESC;
--ROWNUM ����Į���� ����Į������ �߰�
SELECT hakno
            ,uname
            ,rnum
FROM (
    SELECT hakno
                ,uname
                ,ROWNUM AS rnum
    FROM (
        SELECT hakno
                    ,uname
        FROM tb_student
        ORDER BY hakno DESC
    )
)
ORDER BY rnum DESC;


