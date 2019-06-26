package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_Update {
    public static void main(String[] args) {
        // 행수정 연습
    
        String url     ="jdbc:oracle:thin:@localhost:1521:xe";
        String user    ="java0514";
        String password="1234";
        String driver  ="oracle.jdbc.driver.OracleDriver";

        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url, user, password);
            System.out.println("오라클 DB 서버 연결 성공!!");
            
            
            //주소가 영문 Seoul이면 한글 서울로 변경
            /*
             * 	UPDATE sungjuk
				SET addr='서울'
				WHERE addr='Seoul'
             */
            String addr="서울";
            
            StringBuilder sql=new StringBuilder();
            sql.append(" UPDATE sungjuk ");
            sql.append(" SET addr=?");
            sql.append(" WHERE addr='Seoul'");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, addr);
            
            int count=pstmt.executeUpdate();
            if(count==0){
                System.out.println("행수정 실패!!");
            }else{
                System.out.println("행수정 성공~~");
            }//if end
            
            //오라클DB를 켜놓고 있으면 무한반복이 되기 때문에 exit하고 런해보기.
            
            
            
        }catch(Exception e){
            System.out.println("실패!!"+e);
        }finally{
            //자원반납(순서주의!!)
            try {
                if(rs!=null) {rs.close();}
            }catch (Exception e) {}

            try {
                if(pstmt!=null) {pstmt.close();}
            }catch (Exception e) {}
              
            try {
                if(con!=null) {con.close();}
            }catch (Exception e) {}
        }//try end

    }//main() end
}//class end
