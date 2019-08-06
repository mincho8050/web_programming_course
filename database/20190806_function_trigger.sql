


--�Լ�(Function)
-->���� ����ϰ� ������� ��ȯ�ϱ� ���ؼ� ���
-->�������ν������� ������
--    >�Է� �Ű������� ����� �� �ְ� ���� Ÿ���� �ݵ�� �����ؾ� ��(�ʼ�)
-->����)
--    CREATE OR REPLACE FUNCTION �Լ��̸�
--        �Ű�����
--    RETURN �����ڷ���
--    IS
--        ���� ����
--    BEGIN
--        ����
--    END;
--    /


--��) sungjuk���̺��� ���������� ����� ���Ͻÿ�
SELECT AVG(kor) FROM sungjuk;   --70

--���߰�
INSERT INTO sungjuk (sno, uname, kor, eng, mat, addr)
VALUES (sungjuk_seq.NEXTVAL, '�̼���', 40, 60, 75, 'Busan');
--���߰� �� �������� ��� : 67.5 / sno : 25

--�����
UPDATE sungjuk SET kor=95 WHERE sno=25;
--����� �� �������� ���:72.08

--�����
DELETE FROM sungjuk WHERE sno=25;
--����� �� �������� ���:70

--�ٽ� �̼��� ���߰�. sno=26

--sno=26�� ��������(40��)�� 50�� �߰��ϴ� �Լ� ����
CREATE OR REPLACE FUNCTION fn_update_kor
(
 v_sno NUMBER
)
RETURN NUMBER

IS
   v_kor NUMBER; 
BEGIN

    UPDATE sungjuk 
    SET kor=kor+50 
    WHERE sno=26;
    
    SELECT kor INTO v_kor
    FROM sungjuk
    WHERE sno=v_sno;
    
    RETURN v_kor; --�λ�� ��������(90)
    
END;
/
--> sqlplus���� �׽�Ʈ�ϱ�(cmd)
-->SQL>VAR korea NUMBER;
-->SQL>EXECUTE :korea := fn_update_kor(26);
-->SQL>PRINT korea;


--------------------------------------------------------------------------------------------------------------------------------------

--[Ʈ���� Trigger]
--��Ƽ�, �����ͺ��̽������� �������� ������ ������
--INSERT, UPDATE, DELETE���� ����� �� ���������� ����Ǵ� ���ν���
--����)
--CREATE OR REPLACE TRIGGER Ʈ�����̸�
--BEFORE �Ǵ� AFTER 
--    Ʈ�����̺�Ʈ ON ���̺��
--DECLARE
--    ��������;
--BEGIN
--    ������ ��ɾ�;
--END;

--��) sungjuk���̺��� ���������� ����� ���Ͻÿ�
SELECT AVG(kor) FROM sungjuk;   --67.5

--���߰�
INSERT INTO sungjuk (sno, uname, kor, eng, mat, addr)
VALUES (sungjuk_seq.NEXTVAL, '�̼���', 40, 60, 75, 'Busan');

select * from sungjuk;

--�����
UPDATE sungjuk SET kor=95 WHERE sno=28;


--�����
DELETE FROM sungjuk WHERE sno=28;

--�������� �߰�, ����, ������ �Ǹ� ������յ� �޶�����
CREATE OR REPLACE TRIGGER kor_trigger
AFTER 
    INSERT OR UPDATE OR DELETE ON sungjuk
DECLARE
    avg_kor NUMBER;
BEGIN
    SELECT AVG(kor) INTO avg_kor FROM sungjuk;
    DBMS_OUTPUT.PUT_LINE('�������:' || avg_kor);
END;
--�ܼ�â ��� DBMS_OUTPUT.PUT_LINE�� ����Ϸ���
SET SERVEROUTPUT ON;






