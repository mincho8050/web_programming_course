


--함수(Function)
-->값을 계산하고 결과값을 반환하기 위해서 사용
-->저장프로시저와의 차이점
--    >입력 매개변수만 사용할 수 있고 리턴 타입을 반드시 지정해야 함(필수)
-->형식)
--    CREATE OR REPLACE FUNCTION 함수이름
--        매개변수
--    RETURN 리턴자료형
--    IS
--        변수 선언
--    BEGIN
--        문장
--    END;
--    /


--문) sungjuk테이블에서 국어점수의 평균을 구하시오
SELECT AVG(kor) FROM sungjuk;   --70

--행추가
INSERT INTO sungjuk (sno, uname, kor, eng, mat, addr)
VALUES (sungjuk_seq.NEXTVAL, '이순신', 40, 60, 75, 'Busan');
--행추가 후 국어점수 평균 : 67.5 / sno : 25

--행수정
UPDATE sungjuk SET kor=95 WHERE sno=25;
--행수정 후 국어점수 평균:72.08

--행삭제
DELETE FROM sungjuk WHERE sno=25;
--행삭제 후 국어점수 평균:70

--다시 이순신 행추가. sno=26

--sno=26의 국어점수(40점)를 50점 추가하는 함수 생성
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
    
    RETURN v_kor; --인상된 국어점수(90)
    
END;
/
--> sqlplus에서 테스트하기(cmd)
-->SQL>VAR korea NUMBER;
-->SQL>EXECUTE :korea := fn_update_kor(26);
-->SQL>PRINT korea;


--------------------------------------------------------------------------------------------------------------------------------------

--[트리거 Trigger]
--방아쇠, 데이터베이스에서의 연쇄적인 동작을 정의함
--INSERT, UPDATE, DELETE문이 실행될 때 묵시적으로 수행되는 프로시저
--형식)
--CREATE OR REPLACE TRIGGER 트리거이름
--BEFORE 또는 AFTER 
--    트리거이벤트 ON 테이블명
--DECLARE
--    변수선언;
--BEGIN
--    실행할 명령어;
--END;

--문) sungjuk테이블에서 국어점수의 평균을 구하시오
SELECT AVG(kor) FROM sungjuk;   --67.5

--행추가
INSERT INTO sungjuk (sno, uname, kor, eng, mat, addr)
VALUES (sungjuk_seq.NEXTVAL, '이순신', 40, 60, 75, 'Busan');

select * from sungjuk;

--행수정
UPDATE sungjuk SET kor=95 WHERE sno=28;


--행삭제
DELETE FROM sungjuk WHERE sno=28;

--국어점수 추가, 수정, 삭제가 되면 국어평균도 달라진다
CREATE OR REPLACE TRIGGER kor_trigger
AFTER 
    INSERT OR UPDATE OR DELETE ON sungjuk
DECLARE
    avg_kor NUMBER;
BEGIN
    SELECT AVG(kor) INTO avg_kor FROM sungjuk;
    DBMS_OUTPUT.PUT_LINE('국어평균:' || avg_kor);
END;
--콘솔창 출력 DBMS_OUTPUT.PUT_LINE를 사용하려면
SET SERVEROUTPUT ON;






