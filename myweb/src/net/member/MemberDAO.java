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
	
	public int duplicateID (MemberDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT COUNT( id ) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				cnt  = rs.getInt("cnt");
			}// if end
			
			
		} catch (Exception e) {
			System.out.println("아이디 중복확인 실패!: "+e);
		}
		
		return cnt;
	}
	
	public int duplicateEmail (MemberDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT COUNT( email ) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEmail());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				cnt  = rs.getInt("cnt");
			}// if end
			
			
		} catch (Exception e) {
			System.out.println("아이디 중복확인 실패!: "+e);
		}
		
		return cnt;
	}
	
	
	//3) 회원가입 insert
	public int insertMem (MemberDTO dto) {
		int cnt = 0;
		try {
			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Insert SQL문 작성
			sql.append(" INSERT INTO member "); 
			sql.append(" (id ,passwd ,mname ,tel ,email ,zipcode ,address1 ,address2 ,job, mlevel ,mdate ) "); 
			sql.append(" VALUES( ");
			sql.append(" ?,?,?,?,?,?,?,?,?,'D1',SYSDATE ) ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. Value값 불러오기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
						
			//5. 실행
			cnt = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("행추가일때: "+e);
		}
		return cnt;
	}

}
