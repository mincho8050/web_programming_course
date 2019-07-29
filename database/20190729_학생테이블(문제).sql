
SELECT * FROM tb_student;
SELECT * FROM tb_gwamok;
SELECT * FROM tb_sugang;

--������ ���̺��� ����.
SELECT su.hakno
            ,stu.uname
            ,su.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode; --INNER ��������

--���� �� ����
SELECT su.hakno
            ,stu.uname
            ,su.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
ORDER BY su.hakno;


--��) �й��� ������û������ �� ������ ��ȸ
--     g1001 ȫ�浿 5����
--     g1002 ȫ�浿 5����
--     g1003 ������ 3����
--     g1004 ȫ�浿 3����
--     g1006 ������ 3����

--���� �ѰŴ� �̸��� �����ϰԶ�
SELECT aa.hakno
            ,SUM(ghakjum)
FROM(
    SELECT su.hakno
                ,stu.uname
                ,su.gcode
                ,gw.gname
                ,gw.ghakjum
    FROM tb_sugang su INNER JOIN tb_student stu
    ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    ORDER BY su.hakno
) aa
GROUP BY aa.hakno;

--�������� �Ͻ� ���
--GROUP BY �� �ι��Ҽ� �ִ°� �������!!!
SELECT su.hakno
            ,stu.uname
            ,SUM(ghakjum)
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
GROUP BY su.hakno, stu.uname
ORDER BY hakno;

--�ٸ����
SELECT aa.hakno
            ,aa.������
            ,stu.uname
FROM(
    SELECT su.hakno
                ,SUM(gw.ghakjum) AS ������
    FROM tb_sugang su JOIN tb_gwamok gw
    ON su.gcode=gw.gcode
    GROUP BY su.hakno
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno
ORDER BY aa.hakno;



--��) ������ ������ ������� �й��� ������û������ ������ ��ȸ

SELECT stu.hakno
            ,stu.uname
            ,SUM(gw.ghakjum)
FROM tb_sugang su INNER JOIN tb_student stu
ON su.hakno=stu.hakno INNER JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode LIKE 'd%'
GROUP BY stu.hakno,stu.uname;


--�������� �Ͻ� ���
--�ɷ������� JOIN
SELECT hakno,gcode
FROM tb_sugang
WHERE gcode LIKE 'd%';
--������ JOIN
SELECT aa.hakno
            ,aa.gcode
            ,gw.ghakjum
FROM(
    SELECT hakno,gcode
    FROM tb_sugang
    WHERE gcode LIKE 'd%'
) aa JOIN tb_gwamok gw
ON aa.gcode=gw.gcode;
--���� �й����� �� ����
SELECT bb.hakno
            ,SUM(ghakjum)
FROM(
    SELECT aa.hakno
                ,aa.gcode
                ,gw.ghakjum
    FROM(
        SELECT hakno,gcode
        FROM tb_sugang
        WHERE gcode LIKE 'd%'
    ) aa JOIN tb_gwamok gw
    ON aa.gcode=gw.gcode
) bb
GROUP BY bb.hakno;
--�̸��� �ֱ� ���� �л����̺���� JOIN
SELECT cc.hakno
            ,cc.������ 
            ,stu.uname
FROM(
    SELECT bb.hakno
                ,SUM(ghakjum) ������
    FROM(
        SELECT aa.hakno
                    ,aa.gcode
                    ,gw.ghakjum
        FROM(
            SELECT hakno,gcode
            FROM tb_sugang
            WHERE gcode LIKE 'd%'
        ) aa JOIN tb_gwamok gw
        ON aa.gcode=gw.gcode
    ) bb
    GROUP BY bb.hakno
) CC JOIN tb_student stu
ON cc.hakno=stu.hakno;
--�����ϰ� �ٿ�����
SELECT su.hakno
            ,su.gcode
            ,gw.ghakjum
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE su.gcode LIKE 'd%';
--������..
SELECT bb.hakno
            ,bb.������
            ,stu.uname
FROM( 
    SELECT aa.hakno
                ,SUM(aa.ghakjum) ������
    FROM(
         SELECT su.hakno
                    ,su.gcode
                    ,gw.ghakjum
        FROM tb_sugang su JOIN tb_student stu
        ON su.hakno=stu.hakno JOIN tb_gwamok gw
        ON su.gcode=gw.gcode
        WHERE su.gcode LIKE 'd%'
     ) aa 
     GROUP BY aa.hakno
 )bb JOIN tb_student stu
 ON bb.hakno=stu.hakno;


--------------------------------------------------------------------------------------------------

--��) �����ڵ� p001�� ��û�� �л����� ����� ��ȸ
--����)
--p001 OOP g1002 ȫ�浿
--p001 OOP g1004 ȫ�浿

SELECT gw.gcode
            ,stu.hakno
            ,stu.uname
            ,gw.gname
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode='p001'
GROUP BY stu.hakno,stu.uname,gw.gname,gw.gcode;

--�������� �Ͻ� ���
SELECT gw.gcode
            ,stu.hakno
            ,stu.uname
            ,gw.gname
FROM tb_sugang su JOIN tb_student stu
ON su.hakno=stu.hakno JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE gw.gcode='p001';
--GROUP BY���ص� �ǳ�..?




---------------------------------------------------------------------------------------------------------


--��) ���α׷� �������߿��� ������ ���� ���� ������ ��û�� �л��� ����� ��ȸ

--�������� �Ͻ� ���

--�������̺��� ���α׷� ������ ã��
SELECT *
FROM tb_gwamok
WHERE gcode LIKE 'p%';
--������ ���� ������ ã��
SELECT MAX(ghakjum)
FROM tb_gwamok
WHERE gcode LIKE 'p%';
--���α׷� �������߿��� ���� ���� ������ ���� ������� ��ȸ
SELECT gcode
            ,ghakjum
FROM tb_gwamok
WHERE ghakjum=(SELECT MAX(ghakjum)
                FROM tb_gwamok
                WHERE gcode LIKE 'p%') 
AND gcode LIKE 'p%';

--���α׷� �������߿��� ������ ���� ���� ������ ��û�� �л��� ����� ��ȸ
SELECT aa.gcode
            ,stu.hakno
            ,stu.uname
FROM (
    SELECT gcode
                ,ghakjum
    FROM tb_gwamok
    WHERE ghakjum=(SELECT MAX(ghakjum)
                    FROM tb_gwamok
                    WHERE gcode LIKE 'p%') 
    AND gcode LIKE 'p%'
) aa JOIN tb_sugang su
ON aa.gcode=su.gcode JOIN tb_student stu
ON su.hakno=stu.hakno;

--�������� �Ͻ� ���
SELECT tb_sugang.gcode
            ,tb_sugang.hakno
FROM tb_sugang
WHERE gcode IN (SELECT gcode
                FROM tb_gwamok
                WHERE ghakjum=(SELECT MAX(ghakjum)
                                FROM tb_gwamok
                                WHERE gcode LIKE 'p%') 
                AND gcode LIKE 'p%');

--�̸����� ���

SELECT aa.gcode
            ,aa.hakno
            ,stu.uname
FROM (
    SELECT tb_sugang.gcode
                ,tb_sugang.hakno
    FROM tb_sugang
    WHERE gcode IN (SELECT gcode
                    FROM tb_gwamok
                    WHERE ghakjum=(SELECT MAX(ghakjum)
                                    FROM tb_gwamok
                                    WHERE gcode LIKE 'p%') 
                    AND gcode LIKE 'p%')
) aa JOIN tb_student stu
ON aa.hakno=stu.hakno;
   
   

------------------------------------------------------------------------------------------------------------

SELECT * FROM tb_sugang ORDER BY hakno;
SELECT * FROM tb_student ORDER BY hakno;
    
--��) ������û�� ���� ���� �л����� ��� ��ȸ


SELECT hakno
FROM tb_sugang
GROUP BY hakno;
--������û�� �� �л���
SELECT hakno
            ,uname
FROM tb_student
WHERE hakno IN (SELECT hakno
                FROM tb_sugang
                GROUP BY hakno);
--������û ���� ���� �л���
SELECT hakno
            ,uname
FROM tb_student
WHERE hakno NOT IN (SELECT hakno
                                    FROM tb_sugang
                                    GROUP BY hakno);




--1) INNER JOIN (��������)
--�� ���̺� �������� �����ϴ� Į���� �̿��ϴ� ���. ��������
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu INNER JOIN tb_sugang su
ON stu.hakno=su.hakno;
-->�˼� ���� ������ ������û�������� �ֵ��� �� �� ����( �������ΰ͸� �����ϱ�)
-->��ġ�ϴ� ������ ����



--2) LEFT OUTER JOIN
--���� ���̺��� ��� �����Ϳ� ������ ���̺��� ���� �����͸� ����
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu LEFT OUTER JOIN tb_sugang SU --OUTER ��������
ON stu.hakno=su.hakno;
-->���ʿ� �ִ°� ��ġ���� �ʴ��� �����͸� �������°�. 
-->stu.hakno�� �ִ°� �׷��ϱ� tb_student�� ���ʿ� ������ 
-->stu.hakno=su.hakno ��ġ���� �ʴ��� ������ ��������


--RIGHT OUTER JOIN
--������ ���̺��� ��� �����Ϳ� ���� ���̺��� ���� �����͸� ����
SELECT stu.hakno
            ,stu.uname
            ,stu.phone
            ,su.gcode
FROM tb_student stu RIGHT OUTER JOIN tb_sugang SU --OUTER ��������
ON stu.hakno=su.hakno;




--��) ������û ���� ���� ������� ��ȸ
SELECT *
FROM tb_sugang;
SELECT *
FROM tb_gwamok;

SELECT *
FROM tb_gwamok gw LEFT JOIN tb_sugang su
ON gw.gcode=su.gcode
ORDER BY gw.gcode;


--�������� �Ͻ� ���

--������û�� ����
SELECT gcode
FROM tb_sugang
GROUP BY gcode;

--1) ������û���� ���� ����
SELECT gcode
            ,gname
FROM tb_gwamok
WHERE gcode NOT IN (SELECT gcode
                                    FROM tb_sugang
                                    GROUP BY gcode);

--2) LEFT JOIN ���
SELECT gw.gcode
            ,gw.gname
            ,gw.ghakjum
            ,su.gcode
FROM tb_gwamok gw LEFT JOIN tb_sugang su
ON gw.gcode=su.gcode
WHERE su.gcode IS NULL;




--3) RIGHT JOIN ���
SELECT su.gcode
            ,gw.gcode
            ,gw.gname
            ,gw.ghakjum
FROM tb_sugang su RIGHT JOIN tb_gwamok gw
ON su.gcode=gw.gcode
WHERE su.gcode IS NULL;



--LEFT JOIN
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_student stu LEFT JOIN tb_sugang su
ON stu.hakno=su.hakno;
-->�ٸ����
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_student stu , tb_sugang su
WHERE stu.hakno=su.hakno(+);


--RIGHT JOIN
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_sugang su RIGHT JOIN tb_student stu
ON su.hakno=stu.hakno;
-->�ٸ����
SELECT stu.hakno
            ,stu.uname
            ,su.gcode
FROM tb_sugang su , tb_student stu
WHERE su.hakno(+)=stu.hakno;















