package net.notice;
import java.sql.*;
import java.util.*;
import DBPKG.DBOpen;

public class NoticeDAO {
	
	//1) Data Insert
	public int insert(NoticeDTO dto) {
		int cnt = 0;
		try {
			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Insert SQL문 작성
			sql.append(" INSERT INTO board ( writer, email, subject, content, passwd, reg_date, ref, ip) "); 
			sql.append(" VALUES( ");
			sql.append(" ?, ? ,? ,? ,? ,now() ,(select ifnull(max(num),0)+1 from board as TBBD ) , ?) ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. Value값 불러오기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPasswd());
			pstmt.setString(6, dto.getIp());
						
			//5. 실행
			cnt = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("행추가일때: "+e);
		}
		return cnt;
	}

	//2) Data List
	public ArrayList<NoticeDTO> list() {
		ArrayList<NoticeDTO> list = null; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT num, writer, subject, readcount, reg_date, re_level, re_step, ip");
			sql.append(" FROM board ");
			sql.append(" ORDER BY ref DESC, re_step ASC ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			
			//5. rs의 내용을 next로 읽기
			if(rs.next()){
				
				//6. list에 ArrayList<SungjukDTO>로 차곡차곡 저장
				list = new ArrayList<NoticeDTO>(); //전체 저장하기				
				do {
					NoticeDTO dto = new NoticeDTO(); //한 줄씩 저장하기
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setReg_date(rs.getString("reg_date"));
					dto.setRe_level(rs.getInt("re_level"));
					dto.setRe_step(rs.getInt("re_step"));
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

	//3) Data Read
	public NoticeDTO read(int num) {
		NoticeDTO dto = null;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT num, writer, email, subject, content, readcount, reg_date, ip ");
			sql.append(" FROM board AS TBBD ");
			sql.append(" WHERE num=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num); // ?순서와 ?에 들어갈 자료형 주의
			
			//4. 결과를 rs에 저장
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				do {
					dto = new NoticeDTO(); //한 줄씩 저장하기
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setEmail(rs.getString("email"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setReg_date(rs.getString("reg_date"));
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
	public int delete(NoticeDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Delete SQL문 작성
			sql.append(" DELETE FROM board ");
			sql.append(" WHERE passwd=? ");
			sql.append(" AND num=? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd()); // ?순서와 ?에 들어갈 자료형 주의	
			pstmt.setInt(2, dto.getNum()); // ?순서와 ?에 들어갈 자료형 주의	
			
			//4. 실행된 행갯수 저장
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("글삭제실패!" +e);
		}
		return cnt;
	}
	
	//5) Data Update
	public int update (NoticeDTO dto) {
		int cnt = 0;
		try {
			//1. DB연결: DBOpen.java와 연결한다.
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Update SQL문 작성
			sql.append(" UPDATE board AS TBBD ");
			sql.append(" SET writer=?, subject=?, content=?, passwd=? ");
			sql.append(" WHERE num =? ");
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. dto로 데이터 받아오기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getNum());
			
			//5. 실행횟수를 cnt에 담기
			cnt = pstmt.executeUpdate();	
			
		} catch(Exception e) {
			System.out.println("게시물 수정실패!: "+e);
		}
		return cnt;
	}
	
	//6) Data incrementCnt
	public int incrementCnt (int num) {
			int cnt = 0;
			try {
				//1. DB연결: DBOpen.java와 연결한다.
				Connection con=DBOpen.getConnetion();
				StringBuilder sql = new StringBuilder();
				
				//2. Update SQL문 작성
				sql.append(" UPDATE board ");
				sql.append(" SET readcount= readcount+1 ");
				sql.append(" WHERE num =? ");
				
				//3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				
				//4. dto로 데이터 받아오기				
				pstmt.setInt(1, num);
				
				//5. 실행횟수를 cnt에 담기
				cnt = pstmt.executeUpdate();	
				
			} catch(Exception e) {
				System.out.println("게시물 수정실패!: "+e);
			}
			return cnt;
		}

	//7 _ Reply 
	public int reply (NoticeDTO dto) {
		int cnt = 0;
		try {			
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//1. 부모글 정보 가져오기 (select)
			// 그룹번호, 들여쓰기, 글순서
			int ref = 0; 
			int re_level = 0;
			int re_step = 0;
			sql.append(" SELECT ref, re_level, re_step ");
			sql.append(" FROM board ");
			sql.append(" WHERE num=? ");
						
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNum()); // ?순서와 ?에 들어갈 자료형 주의
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				ref = rs.getInt("ref");
				re_level = rs.getInt("re_level");
				re_step = rs.getInt("re_step");
			}// if end		
			
			
			//2. 글순서 재조정하기 (update)
			sql.delete(0, sql.length()); //sql문 초기화
			
			sql.append(" UPDATE board ");
			sql.append(" SET re_step = re_step + 1 ");
			sql.append(" WHERE ref=? AND re_step>? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.executeUpdate();
			
			//3. 답변글 추가하기 (insert)
			sql.delete(0, sql.length()); //sql문 초기화
			
			sql.append(" INSERT INTO board (num, writer, subject, content, passwd, ip, ref, re_level, re_step, reg_date ) ");
			sql.append(" VALUES ( (select ifnull(max(num),0)+1 from board as TBBD )  ");
			sql.append(" ,?,?,?,?,?,?,?,?,now()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, ref);     //부모글 그룹번호
			pstmt.setInt(7, re_level+1);  //부모글 들여쓰기+1
			pstmt.setInt(8, re_step+1);  //부모글 글순서+1
						
			cnt=pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("덧글 달기실패!: "+e);
		}
		return cnt;
	}
	
	//8 Total Record
	public int count (String col, String word) {
		int cnt = 0; 
		
		try {			
			//1. DB연결
			Connection con=DBOpen.getConnetion();
			StringBuilder sql = new StringBuilder();
			
			//2. Select SQL문 작성
			sql.append(" SELECT COUNT( * ) AS cnt ");
			sql.append(" FROM board ");
			if(word.trim().length() >= 1) { //검색어가 있다면?
				String search = "";
				if(col.equals("writer")){
					search += " WHERE writer like '%" + word + "%' ";
				} else if (col.equals("subject")) {
					search += " WHERE subject like '%" + word + "%' ";
				} else if (col.equals("content")) {
					search += " WHERE content like '%" + word + "%' ";
				} else if (col.equals("subject_content")){
					search +=" WHERE subject like '%" + word + "%' OR content like '%" + word + "%' ";
				}
				sql.append(search);
			}			
			
			//3. SQL문 변환
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			//4. 결과를 rs에 저장, ResultSet은 결과를 저장하는 하나의 집합
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt("cnt");	
			}// if end		
			
			
		} catch (Exception e) {
			System.out.println("검색 실패!" + e );
		}
		return cnt;
	}
		
}
