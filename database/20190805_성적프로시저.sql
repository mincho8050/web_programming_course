
-- CREATE / READ / UPDATE / DELETE ������ ���ν��� ����

--1) ���߰� ���ν���(Create)
CREATE OR REPLACE PROCEDURE sungjukInsert
(
    --�Ű�����(parameter)
    --IN �Էº���
    v_uname IN sungjuk.uname%TYPE
    ,v_kor IN sungjuk.kor%TYPE
    ,v_eng IN sungjuk.eng%TYPE
    ,v_mat IN sungjuk.mat%TYPE
    ,v_addr IN sungjuk.addr%TYPE
)
IS
BEGIN
    INSERT INTO sungjuk(sno,uname,kor,eng,mat,aver,addr)
    VALUES(sungjuk_seq.NEXTVAL
                ,v_uname
                ,v_kor
                ,v_eng
                ,v_mat
                ,(v_kor+v_eng+v_mat)/3
                ,v_addr);
    COMMIT;
END;
--���߰�
EXECUTE sungjukInsert('�����', 100, 100, 100, 'Seoul');
--Ȯ��
SELECT * FROM sungjuk ORDER BY sno DESC;

--2) ����� ���ν���(Update)
UPDATE sungjuk
SET uname=? ,kor=? ,eng=? ,mat=? ,aver=? ,addr=?
WHERE sno=?


CREATE OR REPLACE PROCEDURE sungjukUpdate
(
    v_uname IN sungjuk.uname%TYPE
    ,v_kor IN sungjuk.kor%TYPE
    ,v_eng IN sungjuk.eng%TYPE
    ,v_mat IN sungjuk.mat%TYPE
    ,v_addr IN sungjuk.addr%TYPE
    ,v_sno IN sungjuk.sno%TYPE
)
IS
BEGIN
    UPDATE sungjuk
    SET uname=v_uname 
    ,kor=v_kor ,eng=v_eng ,mat=v_mat ,aver=(v_kor+v_eng+v_mat)/3 
    ,addr=v_addr
    WHERE sno=v_sno;
    COMMIT;
END;

EXECUTE sungjukUpdate('�׽�Ʈ', 100, 100, 100, 'Jeju', 3);

SELECT * FROM sungjuk ORDER BY sno DESC;

--3) �� ���� ���ν���(Delete)
DELETE FROM sungjuk WHERE sno=3;

CREATE OR REPLACE PROCEDURE sungjukDelete
(
    v_sno IN sungjuk.sno%TYPE
)
IS
BEGIN
    DELETE FROM sungjuk WHERE sno=v_sno;
    COMMIT;
END;

EXECUTE sungjukDelete(3);

SELECT * FROM sungjuk;



--4) �󼼺���(Read)
SELECT * FROM sungjuk WHERE sno=4;

CREATE OR REPLACE PROCEDURE sungjukRead
(
    --OUT ��¸Ű�����
    v_cursor OUT SYS_REFCURSOR
    ,v_sno sungjuk.sno%TYPE
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT * FROM sungjuk 
    WHERE sno=v_sno;
    --CLOSE v_cursor : Ŀ���ݳ�
    -->�̰� ���⼭ �ϸ� �ڹٿ��� �� �ҷ���
END;  


--5) ���(Read)
SELECT * FROM sungjuk ORDER BY sno DESC;

CREATE OR REPLACE PROCEDURE sungjukList
(
    --OUT ��¸Ű�����
    v_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT * FROM sungjuk ORDER BY sno DESC;
    --CLOSE v_cursor : Ŀ���ݳ�
    -->�̰� ���⼭ �ϸ� �ڹٿ��� �� �ҷ���
END;  


--6) ���ڵ� ���� ���ν���
SELECT COUNT(*) FROM sungjuk;

CREATE OR REPLACE PROCEDURE sungjukCount
(
    v_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT NVL(COUNT(*),0) cnt FROM sungjuk;
    COMMIT;
END;


--7) �˻� ���ν���
--�̸��� '��' ���� �ִ��� �˻�
WHERE uname LIKE '%��%'

--�̸� �Ǵ� �ּҿ� ���ĺ� 'o'�� �ִ��� �˻�
WHERE uname LIKE '%o%' OR addr LIKE '%o%'

--1�̸� �̸����� ��ȸ
--2�̸� �̸� �Ǵ� �ּҿ��� ��ȸ
--�������� �˻����� ����
CREATE OR REPLACE PROCEDURE sungjukSearch
(
    v_cursor OUT SYS_REFCURSOR
    ,v_code NUMBER
    ,v_keyword VARCHAR2
)
IS
BEGIN
    IF v_code=1 THEN
        OPEN v_cursor FOR
        SELECT * FROM sungjuk
        WHERE uname LIKE '%' || v_keyword || '%'
        ORDER BY sno DESC;
        
    ELSIF v_code=2 THEN
        OPEN v_cursor FOR
        SELECT * FROM sungjuk
        WHERE uname LIKE '%' || v_keyword || '%'
        OR addr LIKE '%' || v_keyword || '%'
        ORDER BY sno DESC;
        
    ELSE 
        OPEN v_cursor FOR
        SELECT * FROM sungjuk 
        ORDER BY sno DESC;
    END IF;
END;


--8) ����¡ ���ν���

SELECT sno, uname, addr, ROWNUM
FROM sungjuk;

SELECT sno, uname, addr, ROWNUM
FROM sungjuk
WHERE ROWNUM>=1 AND ROWNUM<=5;

SELECT sno, uname, addr, ROWNUM
FROM sungjuk
WHERE ROWNUM>=6 AND ROWNUM<=10; --��ȸ�ȵ�
--�̷��� �ѹ� �� �ؾ���
SELECT aa.sno
            ,aa.uname
            ,aa.addr
            ,aa.rnum
FROM (
    SELECT sno, uname, addr, ROWNUM AS rnum
    FROM sungjuk
) aa
WHERE aa.rnum>=6 AND aa.rnum<=10; --6�̶� 10�� ����ó���ؾ���



CREATE OR REPLACE PROCEDURE sungjukPaging
(
    v_cursor OUT SYS_REFCURSOR
    ,start_num NUMBER
    ,end_num NUMBER
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT aa.sno
                ,aa.uname
                ,aa.addr
                ,aa.rnum
    FROM (
        SELECT sno, uname, addr, ROWNUM AS rnum
        FROM sungjuk
    ) aa
    WHERE aa.rnum>=start_num AND aa.rnum<=end_num;
    COMMIT;
END;




