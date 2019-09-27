package net.pds;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.member.MemberDTO;
import net.pds.*;
import net.utility.Utility;
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
			sql.append(" VALUES((select ifnull(max(pdsno),0)+1 from tb_pds as TBPD ), ");
			sql.append(" ?, ?, ?, ?, ?, ?, now()) ");
			
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
			System.out.println("행추가실패: "+e);
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
	public pdsDTO read(int pdsno) {
		pdsDTO dto = null;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT pdsno, wname, subject, content, filename, filesize, readcnt, regdate ");
			sql.append(" FROM tb_pds ");
			sql.append(" WHERE pdsno=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno); // ?순서와 ?에 들어갈 자료형 주의
			
			//4. 결과를 rs에 저장
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				do {
					dto = new pdsDTO(); //한 줄씩 저장하기
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));					
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdate(rs.getString("regdate"));
				} while (rs.next()); 
				
			} else{
				dto = null;	
			}// if end					
			
		}catch (Exception e){
			System.out.println("상세보기실패:" +e);
		}
		return dto;
	} 
	
	// 4) Read Count 
	public int incrementCnt (int pdsno) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Update SQL문 작성
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET readcnt= readcnt+1 ");
			sql.append(" WHERE pdsno =? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. dto로 데이터 받아오기				
			pstmt.setInt(1, pdsno );
			
			//5. 실행횟수를 cnt에 담기
			cnt = pstmt.executeUpdate();	
			
		} catch(Exception e) {
			System.out.println("게시물 수정실패!: "+e);
		}
		return cnt;
	}

	// 5) Delete
		public int delete(int pdsno, String passwd, String saveDir) {
			int cnt = 0;
			try {
				//삭제하고자 하는 파일의 파일명을 가져온다.
				String filename = "";
				pdsDTO oldDto = read(pdsno);
				if(oldDto!=null){
					filename = oldDto.getFilename();
				} 
				
				//1. DB연결: DBOpen.java와 연결한다.
				Connection con=DBOpen.getConnetion();
				StringBuilder sql = new StringBuilder();
				
				//2. Delete SQL문 작성
				sql.append(" DELETE FROM tb_pds ");
				sql.append(" WHERE passwd=? ");
				sql.append(" AND pdsno=? ");
				
				//3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());				
				pstmt.setString(1, passwd); // ?순서와 ?에 들어갈 자료형 주의	
				pstmt.setInt(2, pdsno); // ?순서와 ?에 들어갈 자료형 주의	
				
				//4. 실행된 행갯수 저장
				cnt = pstmt.executeUpdate();
				
				//5. 첨부된 파일도 삭제.
				if(cnt == 1) {
					Utility.deleteFile(saveDir, filename);
				} 
				
			} catch (Exception e) {
				System.out.println("글삭제실패!" +e);
			}
			return cnt;
		}

		//6) Data Update Form
		public pdsDTO updateform(int pdsno, String passwd){
		    
			pdsDTO dto = null;
			try {
				//1. DB연결: DBOpen.java와 연결한다.
				Connection con=DBOpen.getConnetion();
				StringBuilder sql = new StringBuilder();
			      sql.append(" SELECT subject,content,wname,passwd,filename ");
			      sql.append(" FROM tb_pds ");
			      sql.append(" WHERE pdsno=? AND passwd=? ");
			    //3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pdsno); // ?순서와 ?에 들어갈 자료형 주의
				pstmt.setString(2, passwd); // ?순서와 ?에 들어갈 자료형 주의
					
				//4. 결과를 rs에 저장
				ResultSet rs = pstmt.executeQuery();
		      if(rs.next()){
		        dto=new pdsDTO();
		        dto.setSubject(rs.getString("subject"));
		        dto.setContent(rs.getString("content"));
		        dto.setWname(rs.getString("wname"));
		        dto.setPasswd(rs.getString("passwd")); 
		        dto.setFilename(rs.getString("filename")); 
		      } 

		    }catch(Exception e){
		      System.out.println(e);
		    }
		    return dto;     
		  }//updateform() end
		
		//7) Data Update
		public int update (pdsDTO dto) {
			int cnt = 0;
			try {
				//1. DB연결: DBOpen.java와 연결한다.
				Connection con=DBOpen.getConnetion();
				StringBuilder sql = new StringBuilder();
				
				//2. Update SQL문 작성
				sql.append(" UPDATE tb_pds ");
				sql.append(" SET wname=?, subject=?, content=?, passwd=?, filename=?, filesize=? ");
				sql.append(" WHERE pdsno =? ");
				
				//3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				
				//4. dto로 데이터 받아오기
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());				
				pstmt.setString(5, dto.getFilename());
				pstmt.setLong(6, dto.getFilesize());
				pstmt.setInt(7, dto.getPdsno());
				
				
				//5. 실행횟수를 cnt에 담기
				cnt = pstmt.executeUpdate();	
				
			} catch(Exception e) {
				System.out.println("게시물 수정실패!: "+e);
			}
			return cnt;
		}


}
