package net.mem;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MemMainTest {
	public static void main(String[] args) {
		// MyBatis-3기반 JDBC연습
		try {
			//1) DB 환경 설정 관련 파일 가져오기
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			
			//2) DB연결하기  위한 팩토리빈 생성
			//-> 기존의 DBOpen + MemberDAO 
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("DB연결 성공");
			
			//3) 쿼리문 생성
			//PreparedStatement와 비슷한 기능
			SqlSession sql=ssf.openSession(true);
			
			//4) 쿼리문 실행
			//	가)행추가
			//int cnt=sql.insert("mem.insertRow",new MemDTO("예리",21));//namespace의 mem의 insertRow를 찾아라!
			//System.out.println("행추가결과:"+cnt);
			
			//	다)행수정(순서는 목록전에-찍어보기위해서)
			//예)num=3인 데이터를 수정하기
			//int cnt=sql.update("mem.updateRow",new MemDTO(4,"배주현",28));
			//System.out.println("행수정결과:"+cnt);
			
			//	라)행삭제
			//예)num=3이하 행 삭제하기
			//int cnt=sql.delete("mem.deleteRow",3);
			//System.out.println("행수정결과:"+cnt);

			
			
			//	나)전체목록
			//List<MemDTO> list=sql.selectList("mem.selectAll");
			
			//	마)검색(이름에 "디"글자가 있는 행검색)
			List<MemDTO> list=sql.selectList("mem.search","배");
			for(int idx=0;idx<list.size();idx++) {
				MemDTO dto=list.get(idx);
				System.out.print(dto.getNum()+" ");
				System.out.print(dto.getName()+" ");
				System.out.print(dto.getAge()+" ");
				System.out.println();
			}//
			
			
			
			
		}catch (Exception e) {
			System.out.println("실패"+e);
		}//try
		
		
	}//
}//
