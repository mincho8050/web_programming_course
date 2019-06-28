package jdbc0628;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
public class MongoDBJDBC {

	public static void main(String[] args) {
		//mongod.exe 실행하면 27017 보임
        //로컬호스트에 있는 몽고DB 서버에 접속. 포트 27017
		/*
		 * 선생님이 하신버전
		 * 	- MongoDB 드라이버 다운
			  -> https://repo1.maven.org/maven2/org/mongodb/mongo-java-driver/
			  -> mongo-java-driver-3.2.2.jar
		 */
        MongoClient mongoClient = new MongoClient("localhost", 27017); 
        
        MongoDatabase db = mongoClient.getDatabase("mycustomers");
        System.out.println("데이터베이스명: "+db.getName());

        MongoCollection<Document> collections = db.getCollection("customers");
        
        FindIterable<Document> iterate = collections.find();
        MongoCursor<Document>  cursor = iterate.iterator();
        
        while(cursor.hasNext()) {
          Document document = cursor.next();
          String JsonResult = document.toJson();
          System.out.println(JsonResult);
        }

	}

}
