

--[트랜잭션 Transaction]
--> 동시에 다수의 작업을 독립적으로 안전하게 처리하기 위한
--상호작용 단위이다
--> 일 처리 단위
--> 분할할 수 없는 최소단위
--> 목적 : 안전한 거래를 보장


--[트랜잭션의 특징]
--> 원자성 : 트랜잭션은 한꺼번에 완료되거나 한꺼번에 취소 되어야 함
--> 일관성
--> 고립성
--> 지속성



--[TCL 명령어]
--> COMMIT : 거래 내역을 확정함
--> ROLLBACK : 거래 내역을 취소함
--> CHECKPOINT : ROLLBACK할 위치를 지정함


--[실습]
--> sqlplus에서 테스트
--> 시작->명령프롬프트->sqlplus 아이디/비번

--[cmd에서 실습]

--테이블 생성
CREATE TABLE dep(
    id  VARCHAR2(20)    PRIMARY KEY
    ,name   VARCHAR2(15)    NOT NULL
    ,location   VARCHAR2(50)
);
--테이블 구조 확인
DESC dep;
--행추가
INSERT INTO dep VALUES('10','영업부','서울 강남구');
INSERT INTO dep VALUES('20','개발부','부산 동래구');
INSERT INTO dep VALUES('30','회계부','인천 계양구');
--행갯수
SELECT COUNT(*) FROM dep; -->3

--명렁어 한꺼번에 모두 다 취소
ROLLBACK;
-->행갯수 카운트 해보면 0이됨 > SELECT COUNT(*) FROM dep;
-->방금전에 했던, 15분 이전까지 했던 모든 작업들을 취소하는것
-->명령어 한꺼번에 취소


--COMMIT 하지 않고 그냥 cmd창을 빠져나오면 다시 행갯수가 0이 된다!!!
--이클립스나 외부 프로그램을 연결해서 쓸때는 자동커밋이 되는데. 이렇게 직접 할 때는 자동 저장되지 않는다.
--명령어 완료 및 확정
COMMIT;
--sqlplus에서 그냥 창닫기 하면 자동 ROLLBACK되므로 주의

--CHECKPOINT : 롤백시점 지정
INSERT INTO dep VALUES('40','영업부','서울 종로구');

SAVEPOINT a; --ROLLBACK TO a;  하면 여기 이후부터 취소

INSERT INTO dep VALUES('50','개발부','서울 중구');

SAVEPOINT b;

INSERT INTO dep VALUES('60','관리부','서울 마포구');
-->여기까지하면 카운트 6개

--롤백 취소
ROLLBACK TO a; -->4개

------------------------------------------------------------------------------------------------------------------------


--[커밋한 자료의 복구 방법]

--예쁘게 출력
SQL>COL NAME FOR a20;
COL TYPE FOR a10;
COL VALUE FOR a10;

SQL> SHOW PARAMETER UNDO;
--undo_retention
--delete , update후에 커밋을 했을 경우
--속성값의 시간(초)까지는 오라클에서 임시로 저장한
--데이터로 복구할 수 있다.
--default 속성값은 900초(15분정도->변경가능 ->commit을 했을 경우 15분간만 값을 저장해줌)
--시간을 1500초(25분)으로 늘릴려면
ALTER SYSTEM SET undo_retention=1500;

--undo_retention기능을 이용한 데이터 복구 방법

--15분 이내에 dep테이블에서 커밋된 데이터 출력
SELECT *
FROM dep
AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '15' minute);
-->일시적이고 실시간적임

--커밋데이터 확인
DELETE FROM dep; --행 모두 삭제
COMMIT;--완료

--삭제하고 커밋한지 15분 안의 데이터를 복구
INSERT INTO dep SELECT * FROM dep
                            AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '15' minute);
COMMIT;
-->행 카운트 하면 다시 3개




