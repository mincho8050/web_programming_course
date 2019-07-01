# MongoDB

- 빅데이터의 저장기술 NoSQL





### 개론

- NoSQL (Not Only SQL)
- 전통적인 관계형 데이터베이스 관리 시스템(DBMS)과는 다르게 설계된 비관계형 DBMS로 대규모 데이터를 유연하게 처리할 수 있다는 장점을 있다.
- RDBMS의 "관계형" 특징을 제거하고 만들어진 다른 모든 DBMS를 말한다



### NoSQL DB 종류

- HBase
- MongoDB
- 카산드라 DB
- CouchDB





### 쿼리

 1) MongoDB    - Set of DBs  : DB들의 모음
     DB         - Set of Collections : 콜렉션들의 모음
     Collection - Set of Documents : 도큐먼트들의 모음
     Document   - JSON-style objects {field: value, …} : 하나의 JSON-style인 데이터 라고 생각하시면됩니다.


  2) CRUD

​     C (Create) - 데이터를 생성 (명령어 : insert)
​     R (Read)   - 데이터 읽기 (명령어 : find)
​     U (Update) - 데이터 수정 (명령어 : update)
​     D (Delete) - 데이터 삭제 (명령어 : remove)


  3) MySQL과 비교

```
     ------------------------------------
     MySQL 용어   Mongo 용어 
     ------------------------------------
     database     database 
     table        collection 
     index        index
     row          BSON document
     column       BSON field
     join         embedding and linking
     -----------------------------------
```







# MongoDB 문법

- show dbs         --데이터베이스 목록 조회(새로 생성한 데이터베이스 확인 가능)
- use mycustomers  --데이터베이스 생성. 이미 만들어진 경우라면 기존의 데이터베이스를 반환한다.  mycustomers라는 이름의 db생성
- show collections    -- 컬렉션 목록
- db               --현재 사용하는 데이터베이스 조회



### INSERT

```
>db.customers.insert({first_name:"John", last_name:"Doe"});
>db.customers.find();			--값 출력하기
>db.customers.insert([{first_name:"Steven", last_name:"Smith"},{first_name:"Joan", last_name:"Johnson",gender:"female"}]);
>db.customers.find();
>db.customers.find().pretty();	--정렬해서 보여주기
```

![result](https://user-images.githubusercontent.com/49340180/60311278-72fcf980-9991-11e9-80fc-ab5a82db9998.PNG)

> "_id"  유일성 칼럼. 



### SQL과 NoSQL

![01](https://user-images.githubusercontent.com/49340180/60311597-dc313c80-9992-11e9-8f48-d317ca13c517.PNG)

