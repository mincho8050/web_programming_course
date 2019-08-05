-- 20190805_���ν���


--[PL/SQL �⺻����]

-- �ܼ�â ����ϱ� ���� ��ɾ�
SET SERVEROUTPUT ON;

--1)������
DECLARE
    --�������� �� ����
    a NUMBER := 3;
    b NUMBER :=5;
BEGIN
    --�ܼ�â ���
    dbms_output.put_line('*������*');
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    dbms_output.put_line(a+b);
    --���տ�����
    dbms_output.put_line(a || '+' || b || '=' || (a+b));
END;
/


--2) ���ǹ�
2) ���ǹ�-1
DECLARE
  --�������α׷�
  uname VARCHAR2(50) := '����ȭ';
  kor   NUMBER := 100;
  eng   NUMBER := 95;
  mat   NUMBER := 80;
  aver  NUMBER := (kor+eng+mat)/3; 
  grade VARCHAR2(50) := NULL;
begin
  IF aver>=90 THEN grade:='A';
  ELSIF aver>=80 THEN grade:='B';
  ELSIF aver>=70 THEN grade:='C';
  ELSIF aver>=60 THEN grade:='D';
  ELSE  grade:='F';
  END IF;

  --���
   DBMS_OUTPUT.PUT_LINE('*������*');
   DBMS_OUTPUT.PUT_LINE('�̸� : ' || uname);
   DBMS_OUTPUT.PUT_LINE('���� : ' || kor);
   DBMS_OUTPUT.PUT_LINE('���� : ' || eng);
   DBMS_OUTPUT.PUT_LINE('���� : ' || mat);
   DBMS_OUTPUT.PUT_LINE('��� : ' || aver);
   DBMS_OUTPUT.PUT_LINE('���� : ' || grade);
END;
/

--3)���ǹ�-2
DECLARE
  --�������α׷�
  uname VARCHAR2(50) := '����ȭ';
  kor   NUMBER := 100;
  eng   NUMBER := 95;
  mat   NUMBER := 80;
  aver  NUMBER := (kor+eng+mat)/3; 
  grade VARCHAR2(50) := NULL;
begin
  IF aver BETWEEN 90 AND 100 THEN grade:='A';
  ELSIF aver BETWEEN 80 AND 89 THEN grade:='B';
  ELSIF aver BETWEEN 70 AND 79 THEN grade:='C';
  ELSIF aver BETWEEN 60 AND 69 THEN grade:='D';
  ELSE  grade:='F';
  END IF;

  --���
   DBMS_OUTPUT.PUT_LINE('*������*');
   DBMS_OUTPUT.PUT_LINE('�̸� : ' || uname);
   DBMS_OUTPUT.PUT_LINE('���� : ' || kor);
   DBMS_OUTPUT.PUT_LINE('���� : ' || eng);
   DBMS_OUTPUT.PUT_LINE('���� : ' || mat);
   DBMS_OUTPUT.PUT_LINE('��� : ' || aver);
   DBMS_OUTPUT.PUT_LINE('���� : ' || grade);
END;
/


--4) �ݺ���
DECLARE 
    dan NUMBER:=4;
    i NUMBER DEFAULT 0;
BEGIN
    LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
        EXIT WHEN i=9; --i���� 9�̸� ���������⤿
    END LOOP;
END;
/


--5) �ݺ���2
DECLARE
    dan NUMBER :=4;
    i NUMBER DEFAULT 0;
BEGIN
    FOR i IN 1..9 LOOP --FOR ���� IN ����..���ᰪ
    DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
    END LOOP;
END;
/


--6) �ݺ���-3
DECLARE
    dan NUMBER:=4;
    i NUMBER DEFAULT 0;
BEGIN
    WHILE i<10 LOOP
        i:=i+1;
        EXIT WHEN i=10;
       DBMS_OUTPUT.PUT_LINE(dan || '*' || i || '=' || (dan*i));
    END LOOP;
END;
/


--[�������̺� ����]
DROP TABLE sungjuk;
DROP SEQUENCE sungjuk_seq;
CREATE SEQUENCE sungjuk_seq;

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

--sno=3�డ������
SELECT *
FROM sungjuk
WHERE sno=3;

--���ν����� �̿��ؼ� sno=3 ��������
DECLARE
    v_sno NUMBER;
    v_uname VARCHAR2(50);
    v_kor NUMBER;
    v_eng NUMBER;
    v_mat NUMBER;
    v_addr VARCHAR2(30);
    v_wdate DATE;
BEGIN
    --SQL�� �ۼ�
    SELECT sno, uname, kor, eng, mat, addr, wdate
    INTO v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
    FROM sungjuk
    WHERE sno=3;
    
    --���
   DBMS_OUTPUT.PUT_LINE('*������*');
   DBMS_OUTPUT.PUT_LINE('��ȣ : ' || v_sno);
   DBMS_OUTPUT.PUT_LINE('�̸� : ' || v_uname);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_kor);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_eng);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_mat);
   DBMS_OUTPUT.PUT_LINE('�ּ� : ' || v_addr);
   DBMS_OUTPUT.PUT_LINE('�ۼ��� : ' || v_wdate);
END;
/



--�ּҸ� �ѱ۷� ���
declare
  v_sno   number;
  v_uname varchar2(50);
  v_kor   number;
  v_eng   number;
  v_mat   number;
  v_addr  varchar2(30);
  v_wdate date;
  v_juso  varchar2(30);
begin
  --SQL�� �ۼ�
  select sno, uname, kor, eng, mat, addr, wdate
  into v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
  from sungjuk
  where sno=3;

  if    v_addr='Seoul' then v_juso:='����';
  elsif v_addr='Jeju'  then v_juso:='����';
  elsif v_addr='Suwon' then v_juso:='����';
  elsif v_addr='Busan' then v_juso:='�λ�';
  end if;

  dbms_output.put_line('*������*');
  dbms_output.put_line('��ȣ : ' || v_sno);
  dbms_output.put_line('�̸� : ' || v_uname);
  dbms_output.put_line('���� : ' || v_kor);
  dbms_output.put_line('���� : ' || v_eng);
  dbms_output.put_line('���� : ' || v_mat);
  dbms_output.put_line('�ּ� : ' || v_addr);
  dbms_output.put_line('�ּ� : ' || v_juso);
  dbms_output.put_line('�ۼ��� : ' || v_wdate);

end;
/


--[PL/SQL ��������]
--%TYPE
-->���̺��� �� �� �÷��� ������Ÿ�� �� ����� ����
-->����) ������ ���̺��.Į����%TYPE
--%ROWTYPE
--���̺��� ROWŸ�԰� ���ٴ� �ǹ�
-->����) ������ ���̺��%ROWTYPE


--1) %TYPE
DECLARE
    v_sno sungjuk.sno%TYPE;
    v_uname sungjuk.uname%TYPE;
    v_kor sungjuk.kor%TYPE;
    v_eng sungjuk.eng%TYPE;
    v_mat sungjuk.mat%TYPE;
    v_addr sungjuk.addr%TYPE;
    v_wdate sungjuk.wdate%TYPE;
BEGIN
     --SQL�� �ۼ�
    SELECT sno, uname, kor, eng, mat, addr, wdate
    INTO v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
    FROM sungjuk
    WHERE sno=3;
    
    --���
   DBMS_OUTPUT.PUT_LINE('*������*');
   DBMS_OUTPUT.PUT_LINE('��ȣ : ' || v_sno);
   DBMS_OUTPUT.PUT_LINE('�̸� : ' || v_uname);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_kor);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_eng);
   DBMS_OUTPUT.PUT_LINE('���� : ' || v_mat);
   DBMS_OUTPUT.PUT_LINE('�ּ� : ' || v_addr);
   DBMS_OUTPUT.PUT_LINE('�ۼ��� : ' || v_wdate);  
END;
/


--2) %ROWTYPE 
DECLARE
   sj sungjuk%ROWTYPE;
BEGIN
     --SQL�� �ۼ�
    SELECT *
    INTO sj
    FROM sungjuk
    WHERE sno=3;
    
    --���
   DBMS_OUTPUT.PUT_LINE('*������*');
   DBMS_OUTPUT.PUT_LINE('��ȣ : ' || sj.sno);
   DBMS_OUTPUT.PUT_LINE('�̸� : ' || sj.uname);
   DBMS_OUTPUT.PUT_LINE('���� : ' || sj.kor);
   DBMS_OUTPUT.PUT_LINE('���� : ' || sj.eng);
   DBMS_OUTPUT.PUT_LINE('���� : ' || sj.mat);
   DBMS_OUTPUT.PUT_LINE('�ּ� : ' || sj.addr);
   DBMS_OUTPUT.PUT_LINE('�ۼ��� : ' || sj.wdate);  
END;
/


--[Ŀ���� �̿��ؼ� ������ ó��]

--FETCH��
--���µ� Ŀ���κ��� �� ���� �����Ѵ�
--����) FETCH Ŀ���� INTO ������

--sno>=5 ���ڵ� ��ȸ
SELECT *
FROM sungjuk
WHERE sno>=5;
--���ν��� �̿��ϱ�
DECLARE
    v_cursor SYS_REFCURSOR;     --Ŀ���� ���  �������� �� �ڷ���
    rec sungjuk%ROWTYPE;            --�� �� ���� �� �ִ� ��������
BEGIN
    OPEN v_cursor FOR       --v_cursor�� ����Ű�� ��
    SELECT *
    FROM sungjuk
    WHERE sno>=5;
    
    LOOP
        FETCH v_cursor INTO rec; --�� �� �����ؼ� rec�� ����
        EXIT WHEN v_cursor%NOTFOUND;--�ڷᰡ ������ ��������
        DBMS_OUTPUT.PUT_LINE(rec.sno);
        DBMS_OUTPUT.PUT_LINE(rec.uname);
        DBMS_OUTPUT.PUT_LINE(rec.kor);
        DBMS_OUTPUT.PUT_LINE(rec.eng);
        DBMS_OUTPUT.PUT_LINE(rec.mat);
        DBMS_OUTPUT.PUT_LINE(rec.addr);
        DBMS_OUTPUT.PUT_LINE(rec.wdate);
        
    END LOOP;

END;
/



--[PL/SQL ����]
--�����ϴ°��� DECLARE ��� CREATE ���
--�����ϸ� �� �������ʹ� �ڵ����� ������Ʈ. ������ ������ �˾ƺ���.? �Ű澲��?
--CREATE PROCEDURE ���ν�����; -> ���ν��� ����
--DROP PROCEDURE ���ν�����;     -> ���ν��� ���� 

--test ���ν��� ����
CREATE OR REPLACE PROCEDURE test 
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('�׽�Ʈ');
END;
--�����Ҷ��� / ������� �ʾƵ� �ȴ�


--test ���ν��� ȣ��
EXECUTE test;

--test ���ν��� ����
DROP PROCEDURE test;




