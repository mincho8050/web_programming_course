--bbs.sql
--답변형 게시판(댓글)

CREATE TABLE tb_bbs(
  bbsno    NUMBER(5)       NOT NULL -- 일련번호 -99999~99999
 ,wname    VARCHAR2(20)    NOT NULL -- 작성자
 ,subject  VARCHAR2(100)   NOT NULL -- 글제목
 ,content  VARCHAR2(2000)  NOT NULL -- 글내용
 ,passwd   VARCHAR2(10)    NOT NULL -- 글비밀번호
 ,readcnt  NUMBER(5)       DEFAULT 0 NOT NULL -- 글조회수
 ,regdt    DATE            DEFAULT  SYSDATE -- 글작성일
 ,grpno    NUMBER(5)       NOT NULL  -- 글 그룹번호
 ,indent   NUMBER(5)       DEFAULT 0 -- 들여쓰기
 ,ansnum   NUMBER(5)       DEFAULT 0 -- 글순서
 ,ip       VARCHAR2(15)    NOT NULL -- 글 IP
 ,PRIMARY KEY(bbsno)                --bbsno 기본키 
);

--새글쓰기
bbsno : MAX(bbsno)+1
wname, subject, content, passwd : 사용자입력
default 값 : readcnt, regdt, indent, ansnum
grpno : MAX(bbsno+1)
ip : request 내부객체에서 사용자pc의 ip정보 가져오기


--행 추가 테스트
INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip)
VALUES(
	   (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs), 
	   '무궁화', 
	   '뭔가요?', 
	   '이건뭔가요?', 
	   '1234!', 
	   (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs), 
	   '127.0.0.1');

--웹페이지는 AND조건을 많이 사용한다
--글삭제
DELETE FROM tb_bbs
WHERE passwd=? AND bbsno=?;



--댓글의 나머지 글순서 재조정(ansnum)
UPDATE tb_bbs
SET ansnum=ansnum+1
WHERE grpno=1 AND ansnum>4;
--그룹번호가 같아야하고, 그 중에서 기준이 되는 ansnum보다 큰 번호만 +1
--WHERE grpno=? AND ansnum>?;
--?는 부모의 자료를 넣어주면 된다.
--WHERE grpno=부모grpno AND ansnum>부모ansnum;















