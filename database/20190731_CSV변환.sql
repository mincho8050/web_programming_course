
--���������� 
--data.go.kr
--[�������̺�]
-->����������� : http://www.koreapost.go.kr/

--�ǽ�)
--post.csv ���� �����ͼ� zipcode���̺� �����ϱ�


--�����ȣ ���̺� ����
CREATE TABLE zipcode(
    zipcode CHAR(7) NOT NULL    --�����ȣ(A��)
    ,sido VARCHAR(30) NOT NULL  --��,��(B��)
    ,gugun VARCHAR(50)      --��,��(C��)
    ,dong VARCHAR(50)       --��(D��)
    ,li VARCHAR(50)             --��(E��)
    ,bunji VARCHAR(255)     --����(F��)
    ,etc VARCHAR(255)       --��Ÿ(G��)
);
-->����Ʈ�����
-->���� -> myOracle11g -> ���̺� (��Ŭ��) -> ����������Ʈ
SELECT COUNT(*) FROM zipcode; --52852

--��) �õ��� ������ ���Ͻÿ�
SELECT sido
            ,COUNT(sido)
FROM zipcode
GROUP BY sido
ORDER BY COUNT(sido);
--3000�� �̻� ���
SELECT sido
            ,COUNT(sido)
FROM zipcode
GROUP BY sido
HAVING COUNT(sido)>=3000
ORDER BY COUNT(sido);

--��) ���������� ���� ������ ���Ͻÿ�
-->�ƴ� ������ �ָ����ڳ�.. ���� �׷��� ������..?(��� ���� ���� ���ϴ���)

--������ ���
--1)�̰� ����Ư���� ���� �� ����(���� 25�� ����)
SELECT gugun  
            ,COUNT(gugun) 
FROM zipcode 
WHERE sido='����Ư����'
GROUP BY gugun;
--���� ����(25)
SELECT COUNT(*)
FROM(
SELECT gugun  
            ,COUNT(gugun) 
FROM zipcode 
WHERE sido='����Ư����'
GROUP BY gugun
);

--��) �� �õ���, ������ ���� ������ ���Ͻÿ�
SELECT sido
            ,gugun
            ,COUNT(dong)
FROM zipcode
GROUP BY sido,gugun
ORDER BY sido;


------------------------------------------------------------------------------------------


--�ڷḦ �ؽ�Ʈ�� ���� ���� �������� ����, ���б�ȣ �� �и��ؼ� �������Ϸ� ���� �� csv���Ϸ� �����

--���� ������� �����ȣ ���̺� ����
DROP TABLE zipcode;

--�����ȣ ���̺� ����
CREATE TABLE zipcode(
    zipcode CHAR(7) NOT NULL    --�����ȣ(A��)
    ,sido VARCHAR(30) NOT NULL  --��,��(B��)
    ,gugun VARCHAR(50)      --��,��(C��)
    ,dong VARCHAR(50)       --��(D��)
    ,li VARCHAR(50)             --��(E��)
    ,bunji VARCHAR(255)     --����(F��)
    ,etc VARCHAR(255)       --��Ÿ(G��)
);

--zipcode.ctl ���ϻ���
----------------�۾��ϰ� �ִ� ������D:\java0514\database ���⿡ �����ϱ�
--LOAD DATA INFILE 'post.csv'
--INSERT
--INTO TABLE zipcode
--FIELDS TERMINATED BY ','
--TRAILING NULLCOLS
--(zipcode,sido,gugun,dong,bunji,etc)
--cmd���� ����..�ϴ� �޸��忡 ����.
--post.csv ��ε� �۾��ϱ� ���ϰ� zipcode.ctl�� ���� ��η� ���ش�
--cmd > ��θ� ������ ��η� �̵�(D:\java0514\database) -> dir(����Ȯ��)
-- ->sqlldr java0514/1234 control="zipcode.ctl" 
--sqlldr(��Ʈ������ �����Ҷ� ��ɾ�) ���̵�/��� control="���ϸ�.Ȯ����"
------------------------------------------------------------------------------------------------

SELECT COUNT(*)
FROM zipcode; --52852

------------------------------------------------------------------------------------------------------

DROP TABLE streetcode;

--����1) ���θ� �ּҸ� DB�� �����ϱ�

CREATE TABLE streetcode(
    scode VARCHAR2(80)
    ,sname  VARCHAR2(80)
    ,sname_e VARCHAR2(80)
    ,serial VARCHAR2(80)
    ,sido VARCHAR2(80)
    ,sido_e VARCHAR2(80)
    ,gugun VARCHAR2(80)
    ,gugun_e VARCHAR2(80)
    ,dong VARCHAR2(80)
    ,dong_e VARCHAR2(80)
    ,dong_sort VARCHAR2(80)
    ,dong_code VARCHAR2(80)
    ,scheck VARCHAR2(80)
    ,PRIMARY KEY(scode, serial)
);
--ī��Ʈ
SELECT COUNT(*) FROM streetcode; --358154
--����Ư���� ����
SELECT *
FROM streetcode
WHERE sido='����Ư����';

DESC streetcode;
-------------------------------------------------------------------------------------------------------------------------------------------------


--����2) �����ִ� ������ �����Ͽ� DB�� �����ϱ�!
--data.go.kr ����


--����Ư�����߱�_��ǰ����������Ȳ_20190315
SELECT COUNT(*) FROM food_junggu;--8768
SELECT * FROM food_junggu;


DESC food_junggu; --���̺���Ȯ��

--Ŀ�Ǽ� ī��Ʈ �ϱ�
SELECT fname
FROM food_junggu
WHERE fcategory='Ŀ�Ǽ�'; --803

--�Ŵ絿 �Ĵ�� ��ȸ
SELECT *
FROM food_junggu
WHERE faddress LIKE '%�Ŵ�%'
ORDER BY fname;













