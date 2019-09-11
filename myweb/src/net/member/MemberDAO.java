package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import net.member.MemberDTO;
import DBPKG.DBOpen;

public class MemberDAO {
	
	//1) Login 
	public String loginProc(MemberDTO dto) {
		String mlevel = null;
		
		try {
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel IN ('A1','B1','C1','D1') ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				mlevel = rs.getString("mlevel"); 				
			} else{
				mlevel = null;
			}// if end
			
			
		} catch (Exception e) {
			System.out.println("로그인 실패!: "+e);
		}
		
		return mlevel;
	}
	

}
