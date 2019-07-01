package jdbc0628;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;



public class Test01_DBOpen {

	public static void main(String[] args) {
		/*
		 * MongoDB 연결하기
		 * mycustomers 데이터베이스에 있는 customers 도튜먼트 내용을 출력하시오.
		 * 참고 블로그 
		 * https://tkddlf4209.blog.me/220555179937
		 * https://blog.naver.com/sjw3193/220528838301
		 * 검색해서 찾아서 한 버전
		 */
		
		MongoClient mongoClient=null;

		try{
			
			mongoClient=new MongoClient("localhost",27017);
			System.out.println("접속 성공");
			
/*			//쓰기권한 부여
			WriteConcern w=new WriteConcern(1,2000);
			//쓰기 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
*/			
			//데이터베이스 연결
			DB db=mongoClient.getDB("mycustomers");
			//컬렉션 가져오기
			DBCollection coll=db.getCollection("customers");
			
			//customers의 모든 데이터 가져오기
			DBCursor cursor=coll.find();
			while(cursor.hasNext()){
				//있는 값을 반복문을 이용하여 모두 콘솔에 출력하기.
				System.out.println(cursor.next());

			}//

			/*
			 * 출력값
			 * -> 빨간글자로 나오는것은 부연설명
			 * 	{"_id": {"$oid": "5d156ff9e7e5402f3c308315"}, "first_name": "John", "last_name": "Doe"}
				{"_id": {"$oid": "5d15700fe7e5402f3c308316"}, "first_name": "Steven", "last_name": "Smith"}
				{"_id": {"$oid": "5d15700fe7e5402f3c308317"}, "first_name": "Joan", "last_name": "Johnson", "gender": "female"}
			 */
			
			
		}catch(Exception e){
			System.out.println(e);
			
		}
		
	}//main

}//class
