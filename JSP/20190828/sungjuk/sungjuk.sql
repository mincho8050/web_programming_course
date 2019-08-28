--성적테이블 삭제
DROP TABLE sungjuk;

--성적테이블 생성
CREATE TABLE sungjuk (
    sno NUMBER NOT NULL 
    ,uname VARCHAR(20)
    ,kor INT NOT NULL 
    ,eng INT NOT NULL 
    ,mat INT NOT NULL 
    ,aver INT
    ,addr VARCHAR(50)
    ,wdate DATE 
);

--모든 행 삭제
DELETE FROM sungjuk;

--행 갯수
SELECT COUNT(*) FROM sungjuk;

--사용자에게 입력받을만한 칼럼은 uname,kor,eng,mat,addr정도이다.
--입력폼은 5개 필요하다.


--상세보기
SELECT *
FROM sungjuk
WHERE sno=2;


--행수정
--내가 입력한것만 수정되도록
UPDATE sungjuk
SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?
WHERE sno=?;
















