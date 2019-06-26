package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test09_Delete {
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
            
            
            //sno가 4~6인 행을 삭제
            //원래 1~3행 삭제인데 연습하면서 먼저 삭제시킴 ㅎㅎ..
            
            int start=4;
            int end=6;
            
            
            StringBuilder sql=new StringBuilder();
            sql.append(" DELETE FROM sungjuk ");
            sql.append(" WHERE sno BETWEEN ? AND ?");

            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1,start);
            pstmt.setInt(2,end);
            
            int count=pstmt.executeUpdate();
            if(count==0){
                System.out.println("행삭제 실패!!");
            }else{
                System.out.println("행삭제 성공~~");
            }//if end
            

            
            
            
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
