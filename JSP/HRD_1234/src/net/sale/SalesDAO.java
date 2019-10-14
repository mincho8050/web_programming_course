package net.sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.sale.*;
import DBPKG.DBOpen;

public class SalesDAO {
	
	public ArrayList<SalesDTO> list() {
		ArrayList<SalesDTO> list=null;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT AA.custno, custname, grade, SUM(price) sum ");
			sql.append(" FROM member_tbl_02 AA JOIN money_tbl_02 BB ");
			sql.append(" ON AA.custno=BB.custno ");
			sql.append(" GROUP BY AA.custno, custname, grade ");
			sql.append(" ORDER BY sum DESC ");
			/*sql.append(" SELECT AA.custno, MEM.custname, MEM.grade, AA.hap ");
			sql.append(" FROM( ");
			sql.append(" 	SELECT custno, SUM(price) AS hap ");
			sql.append(" 	FROM money_tbl_02 ");
			sql.append(" 	GROUP BY custno ");
			sql.append(" ) AA JOIN member_tbl_02 MEM ");
			sql.append(" ON AA.custno=MEM.custno ");
			sql.append(" ORDER BY AA.hap DESC ");*/
			
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<SalesDTO>();
				do{
					SalesDTO dto=new SalesDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setGrade(rs.getString("grade"));
					dto.setHap(rs.getInt("sum"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}
		}catch(Exception e){
			System.out.println("회원매출조회수정실패 : "+e);
		}//try
		return list;
	}//list
	
	
}//
