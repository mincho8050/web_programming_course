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



------------------------------------------------------------------------------------

--출력칸수 조절하기
COL subject FOR a20;

--문제1)
--부모글에 달려있는 댓글갯수 구하기

--1.
SELECT subject, grpno, indent, ansnum
FROM tb_bbs
ORDER BY grpno DESC, indent ASC;


--2. grpno가 동일한 행을 그룹화하고, 행갯수를 구한다.
SELECT grpno, COUNT(grpno) AS cnt
FROM tb_bbs
GROUP BY grpno;

--3. 2에서 나온 갯수는 부모글+자식글. 갯수-1 한다.
SELECT grpno, COUNT(grpno)-1 AS cnt
FROM tb_bbs
GROUP BY grpno;


--4. 3의 논리적 테이블에 셀프 조인해서 최초 부모글 제목 가져오기
--INNER는 생략가능
SELECT aa.grpno, aa.cnt, tb_bbs.subject, tb_bbs.indent
FROM (
	SELECT grpno, COUNT(grpno)-1 AS cnt
	FROM tb_bbs
	GROUP BY grpno
) aa INNER JOIN tb_bbs
ON aa.grpno=tb_bbs.grpno
WHERE tb_bbs.indent=0 --최초부모글
ORDER BY aa.grpno DESC;



--문제2)
--목록 중에서 위에서부터 5건 조회
--페이징 -> ROWNUM(줄번호) 활용

--1.
SELECT subject, grpno, ansnum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

--2. ROWNUM 추가
--줄번호까지 정렬됨(ROWNUM을 너무 빨리 붙임)
SELECT ROWNUM, subject, grpno, ansnum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

--3. 1의 SQL문을 셀프조인후 ROWNUM 추가
--먼저 정렬 후 나중에 ROWNUM을 붙인다.
SELECT ROWNUM, subject, grpno, ansnum
FROM(
	SELECT subject, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
) aa;

--4.줄번호(ROWNUM)1~5번까지 (1페이지)
SELECT ROWNUM, subject, grpno, ansnum
FROM(
	SELECT subject, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
) aa
WHERE ROWNUM>=1 AND ROWNUM<=5;

--5. 줄번호 6~10조회 (2페이지) -> 검색안됨
SELECT ROWNUM, subject, grpno, ansnum
FROM(
	SELECT subject, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
) aa
WHERE ROWNUM>=1 AND ROWNUM<=5;

--6. 3의 테이블을 한번 더 셀프조인한다.
--하나의 완벽한 테이블을 만든후(ROWNUM을 포함한) 조건을 건다.
--ROWNUM칼럼명을  rnum으로 변경
SELECT rnum, subject, grpno, ansnum
FROM(
	SELECT ROWNUM AS rnum, subject, grpno, ansnum
	FROM(
		SELECT subject, grpno, ansnum
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	)
)
WHERE rnum>=6 AND rnum<=10;

--7. 페이징+검색
--제목에서 '솔데스크' 검색해서 2페이지 출력
SELECT rnum, subject, grpno, ansnum
FROM(
	SELECT ROWNUM AS rnum, subject, grpno, ansnum
	FROM(
		SELECT subject, grpno, ansnum
		FROM tb_bbs
		WHERE subject LIKE '%솔데스크%'
		ORDER BY grpno DESC, ansnum ASC
	)
)
WHERE rnum>=6 AND rnum<=10;
















