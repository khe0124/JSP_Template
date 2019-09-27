package net.comment;
import java.sql.*;
import java.util.*;
import DBPKG.DBOpen;

public class CommentDAO {

	//1) Data Insert
	public int insert(CommentDTO cdto) {
		int cnt = 0;
		try {
			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Insert SQL문 작성
			sql.append(" INSERT INTO tb_comment ( conum, cname, cocontent, codate, cobbsno ) "); 
			sql.append(" VALUES( ");
			sql.append(" (select ifnull(max(conum),0)+1 from tb_comment as TBCO ) ,? ,? ,now(), ? ) ");			
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. Value값 불러오기
			pstmt.setString(1, cdto.getCname());
			pstmt.setString(2, cdto.getCocontent());
			pstmt.setInt(3, cdto.getCobbsno());
						
			//5. 실행
			cnt = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("덧글추가실패: "+e);
		}
		return cnt;
	}
	
	//3) Data Read
	public ArrayList<CommentDTO> list(CommentDTO cdto) {
		ArrayList<CommentDTO> list = null; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT conum, cname, cocontent, codate ");
			sql.append(" FROM tb_comment ");
			sql.append(" WHERE cobbsno = ? ");
			sql.append(" ORDER BY conum DESC ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, cdto.getCobbsno()); // ?순서와 ?에 들어갈 자료형 주의
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				
				//6. list에 ArrayList<SungjukDTO>로 차곡차곡 저장
				list = new ArrayList<CommentDTO>(); //전체 저장하기				
				do {
					CommentDTO dto = new CommentDTO(); //한 줄씩 저장하기
					dto.setConum(rs.getInt("conum"));
					dto.setCname(rs.getString("cname"));
					dto.setCocontent(rs.getString("cocontent"));
					dto.setCodate(rs.getString("codate"));					
					list.add(dto);
				} while (rs.next()); 				
			} else{
				list = null; 				
			}// if end
			
			
		} catch (Exception e) {
			System.out.println("목록 불러오기 실패!" + e );
		}
		return list;
	}
	
	public int countco(int cobbsno) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT Count(*) AS cnt ");
			sql.append(" FROM tb_comment ");
			sql.append(" WHERE cobbsno=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, cobbsno); // ?순서와 ?에 들어갈 자료형 주의
			
			//4. 결과를 rs에 저장
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt("cnt");
			}// if end					
			
		}catch (Exception e){
			System.out.println("상세보기실패:" +e);
		}
		return cnt;
	} 
	
}
