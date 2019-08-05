
-- CREATE / READ / UPDATE / DELETE 관련한 프로시저 생성

--1) 행추가 프로시저(Create)
CREATE OR REPLACE PROCEDURE sungjukInsert
(
    --매개변수(parameter)
    --IN 입력변수
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
--행추가
EXECUTE sungjukInsert('손흥민', 100, 100, 100, 'Seoul');
--확인
SELECT * FROM sungjuk ORDER BY sno DESC;

--2) 행수정 프로시저(Update)
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

EXECUTE sungjukUpdate('테스트', 100, 100, 100, 'Jeju', 3);

SELECT * FROM sungjuk ORDER BY sno DESC;

--3) 행 삭제 프로시저(Delete)
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



--4) 상세보기(Read)
SELECT * FROM sungjuk WHERE sno=4;

CREATE OR REPLACE PROCEDURE sungjukRead
(
    --OUT 출력매개변수
    v_cursor OUT SYS_REFCURSOR
    ,v_sno sungjuk.sno%TYPE
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT * FROM sungjuk 
    WHERE sno=v_sno;
    --CLOSE v_cursor : 커서반납
    -->이걸 여기서 하면 자바에서 못 불러옴
END;  


--5) 목록(Read)
SELECT * FROM sungjuk ORDER BY sno DESC;

CREATE OR REPLACE PROCEDURE sungjukList
(
    --OUT 출력매개변수
    v_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN v_cursor FOR
    SELECT * FROM sungjuk ORDER BY sno DESC;
    --CLOSE v_cursor : 커서반납
    -->이걸 여기서 하면 자바에서 못 불러옴
END;  


--6) 레코드 갯수 프로시저
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


--7) 검색 프로시저
--이름에 '나' 글자 있는지 검색
WHERE uname LIKE '%나%'

--이름 또는 주소에 알파벳 'o'가 있는지 검색
WHERE uname LIKE '%o%' OR addr LIKE '%o%'

--1이면 이름에서 조회
--2이면 이름 또는 주소에서 조회
--나머지는 검색하지 않음
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


--8) 페이징 프로시저

SELECT sno, uname, addr, ROWNUM
FROM sungjuk;

SELECT sno, uname, addr, ROWNUM
FROM sungjuk
WHERE ROWNUM>=1 AND ROWNUM<=5;

SELECT sno, uname, addr, ROWNUM
FROM sungjuk
WHERE ROWNUM>=6 AND ROWNUM<=10; --조회안됨
--이렇게 한번 더 해야함
SELECT aa.sno
            ,aa.uname
            ,aa.addr
            ,aa.rnum
FROM (
    SELECT sno, uname, addr, ROWNUM AS rnum
    FROM sungjuk
) aa
WHERE aa.rnum>=6 AND aa.rnum<=10; --6이랑 10을 변수처리해야함



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




