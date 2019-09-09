package net.bbs;
import java.sql.*;
import java.util.*;
import DBPKG.DBOpen;

public class BbsDAO {
	
	//1) Data Insert
	public int insert(BbsDTO dto) {
		int cnt = 0;
		try {
			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Insert SQL문 작성
			sql.append(" INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, regdt, grpno, ip) "); 
			sql.append(" VALUES((select nvl(max(bbsno),0)+1 from tb_bbs) ");
			sql.append(",?,?,?,?,SYSDATE,(select nvl(max(bbsno),0)+1 from tb_bbs), ?) ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. Value값 불러오기
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
						
			//5. 실행
			cnt = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("행추가일때: "+e);
		}
		return cnt;
	}

	//2) Data List
	public ArrayList<BbsDTO> list() {
		ArrayList<BbsDTO> list = null; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent, ansnum, ip");
			sql.append(" FROM tb_bbs ");
			sql.append(" ORDER BY grpno DESC, ansnum ASC ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				
				//6. list에 ArrayList<SungjukDTO>로 차곡차곡 저장
				list = new ArrayList<BbsDTO>(); //전체 저장하기				
				do {
					BbsDTO dto = new BbsDTO(); //한 줄씩 저장하기
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					dto.setAnsnum(rs.getInt("ansnum"));
					dto.setIp(rs.getString("ip"));
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

	//2) - 2 Search List
	public ArrayList<BbsDTO> list(String col, String word) {
		ArrayList<BbsDTO> list = null; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent, ansnum, ip");
			sql.append(" FROM tb_bbs ");
			if(word.trim().length() >= 1) { //검색어가 있다면?
				String search = "";
				if(col.equals("wname")){
					search += " WHERE wname like '%" + word + "%' ";
				} else if (col.equals("subject")) {
					search += " WHERE subject like '%" + word + "%' ";
				} else if (col.equals("content")) {
					search += " WHERE content like '%" + word + "%' ";
				} else if (col.equals("subject_content")){
					search +=" WHERE subject like '%" + word + "%' OR content like '%" + word + "%' ";
				}
				sql.append(search);
			}
			sql.append(" ORDER BY grpno DESC, ansnum ASC ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				
				//6. list에 ArrayList<SungjukDTO>로 차곡차곡 저장
				list = new ArrayList<BbsDTO>(); //전체 저장하기				
				do {
					BbsDTO dto = new BbsDTO(); //한 줄씩 저장하기
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					dto.setAnsnum(rs.getInt("ansnum"));
					dto.setIp(rs.getString("ip"));
					list.add(dto);
				} while (rs.next()); 				
			} else{
				list = null; 				
			}// if end
			
			
		} catch (Exception e) {
			System.out.println("검색 실패!" + e );
		}
		return list;
	}
	
	//2) - 3 Search List
	
	//3) Data Read
	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno); // ?순서와 ?에 들어갈 자료형 주의
			
			//4. 결과를 rs에 저장
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				do {
					dto = new BbsDTO(); //한 줄씩 저장하기
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIp(rs.getString("ip"));
				} while (rs.next()); 
				
			} else{
				dto = null;	
			}// if end					
			
		}catch (Exception e){
			System.out.println("상세보기실패:" +e);
		}
		return dto;
	} 
	
	//4) Data Delete
	public int delete(BbsDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Delete SQL문 작성
			sql.append(" DELETE FROM tb_bbs ");
			sql.append(" WHERE passwd=? ");
			sql.append(" AND bbsno=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd()); // ?순서와 ?에 들어갈 자료형 주의	
			pstmt.setInt(2, dto.getBbsno()); // ?순서와 ?에 들어갈 자료형 주의	
			
			//4. 실행된 행갯수 저장
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("글삭제실패!" +e);
		}
		return cnt;
	}
	
	//5) Data Update
	public int update (BbsDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Update SQL문 작성
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET wname=?, subject=?, content=?, passwd=? ");
			sql.append(" WHERE bbsno =? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. dto로 데이터 받아오기
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getBbsno());
			
			//5. 실행횟수를 cnt에 담기
			cnt = pstmt.executeUpdate();	
			
		} catch(Exception e) {
			System.out.println("게시물 수정실패!: "+e);
		}
		return cnt;
	}
	
	//6) Data incrementCnt
	public int incrementCnt (int bbsno) {
			int cnt = 0;
			try {
				//1. DB연결: DBOpen.java와 연결한다.
				Connection con=DBOpen.getConnetion();
				StringBuilder sql = new StringBuilder();
				
				//2. Update SQL문 작성
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET readcnt= readcnt+1 ");
				sql.append(" WHERE bbsno =? ");
				
				//3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				
				//4. dto로 데이터 받아오기				
				pstmt.setInt(1, bbsno);
				
				//5. 실행횟수를 cnt에 담기
				cnt = pstmt.executeUpdate();	
				
			} catch(Exception e) {
				System.out.println("게시물 수정실패!: "+e);
			}
			return cnt;
		}

	//7 _ Reply 
	public int reply (BbsDTO dto) {
		int cnt = 0;
		try {			
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//1. 부모글 정보 가져오기 (select)
			// 그룹번호, 들여쓰기, 글순서
			int grpno = 0; 
			int indent = 0;
			int ansnum = 0;
			sql.append(" SELECT grpno, indent, ansnum ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
						
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno()); // ?순서와 ?에 들어갈 자료형 주의
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				grpno = rs.getInt("grpno");
				indent = rs.getInt("indent");
				ansnum = rs.getInt("ansnum");
			}// if end		
			
			
			//2. 글순서 재조정하기 (update)
			sql.delete(0, sql.length()); //sql문 초기화
			
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET ansnum = ansnum + 1 ");
			sql.append(" WHERE grpno=? AND ansnum>? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
			
			//3. 답변글 추가하기 (insert)
			sql.delete(0, sql.length()); //sql문 초기화
			
			sql.append(" INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum ) ");
			sql.append(" VALUES ( (select nvl(max(bbsno),0)+1 from tb_bbs)  ");
			sql.append(" ,?,?,?,?,?,?,?,? ) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);     //부모글 그룹번호
			pstmt.setInt(7, indent+1);  //부모글 들여쓰기+1
			pstmt.setInt(8, ansnum+1);  //부모글 글순서+1
						
			cnt=pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("덧글 달기실패!: "+e);
		}
		return cnt;
	}
	

	
	
	
}
