# MySQL



### MySQL 다운로드 경로

www.mysql.com > downloads > MySQL Community Server 페이지 하단 > Looking for previous GA versions? > Select Version: 5.6.44 > mysql-5.6.44-winx64.zip



### MySQL DB 연결 드라이버

www.mysql.com > downloads >  MySQL Community Server 페이지 하단 > MySQL Connectors 왼쪽 > Connector/J > Looking for previous GA versions? > mysql-connector-java-5.1.47.zip 


### MySQL 개발툴

- Heidi



### MySQL 일련번호 부여

- 테이블 설정.

> auto_increment : 일련번호부여
>
> primary key : 유일성
>
> 이렇게 설정해야 한글이 깨지지 않음.

```
create table sungjuk (
  sno   int not null auto_increment primary key,
  uname varchar(20) not null,
  kor   tinyint     not null,
  eng   tinyint     not null,
  mat   tinyint     not null,
  tot   int         null default 0,
  aver  int         null default 0,
  regdt datetime    not null
)ENGINE=MyISAM DEFAULT CHARSET="euckr";
```

- 행추가

> sno은 auto_increment가 있어서 번호가 알아서 들어감

```
insert into sungjuk(uname,kor,eng,mat,regdt)
values('홍길동',70,80,95,now());
```

> 결과

![0626](https://user-images.githubusercontent.com/49340180/60166988-1b4d7980-983d-11e9-9d41-17c730fb9cf9.PNG)
