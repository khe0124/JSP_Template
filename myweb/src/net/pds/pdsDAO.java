package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.pds.*;
import DBPKG.DBOpen;

public class pdsDAO {
			
	//1) INSERT
	public boolean insert(pdsDTO dto) {
		boolean flag = false;
		try {
			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Insert SQL문 작성
			sql.append(" INSERT INTO tb_pds (pdsno, wname, passwd, subject, content, filename, filesize, regdate) "); 
			sql.append(" VALUES((select nvl(max(pdsno),0)+1 from tb_pds), ");
			sql.append(" ?, ?, ?, ?, ?, ?, SYSDATE) ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. Value값 불러오기
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFilename());
			pstmt.setLong(6, dto.getFilesize());			
						
			//5. 실행
			if(pstmt.executeUpdate() != 0){
				flag = true;
			}		
			
		} catch(Exception e) {
			System.out.println("행추가일때: "+e);
		}
		return flag;
	}
	//2) LIST
	public synchronized ArrayList<pdsDTO> list() {
		ArrayList<pdsDTO> list = null; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT pdsno, wname, subject, filename, readcnt, regdate");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				
				//6. list에 ArrayList로 차곡차곡 저장
				list = new ArrayList<pdsDTO>(); //전체 저장하기				
				do {
					pdsDTO dto = new pdsDTO(); //한 줄씩 저장하기					
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setFilename(rs.getString("filename"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdate(rs.getString("regdate"));
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
	//3) READ

}
