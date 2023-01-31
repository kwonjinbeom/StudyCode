package com.mvc.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.mvc.common.util.JDBCTemplate.*;

import com.mvc.board.vo.BoardVO;

public class BoardDAO {
	private static BoardDAO instance =null;
	
	public static BoardDAO getInstance() {
		if(instance==null) {
			instance= new BoardDAO();
		}
		return instance;
	}
	
	private BoardDAO() {}
	
	/***********************************************************
	 * boardList() 메서드: 게시판 목록 조회(검색 처리 제외)
	 * @return ArrayList<BoardVO> 리턴.
	 ***********************************************************/
	public ArrayList<BoardVO> boardList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{ 
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("SELECT  num, author, title,  ");
			query.append("to_char(writeday, 'YYYY/MM/DD') writeday, ");
			query.append("readcnt, repRoot, repStep, repIndent FROM board ");
			query.append(" order by repRoot desc, repStep asc");
			
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			
			while( rs.next()){
				BoardVO data = new BoardVO();
				data.setNum(rs.getInt("num"));
				data.setAuthor(rs.getString("author"));
				data.setTitle(rs.getString("title"));
				data.setWriteday(rs.getString("writeday"));
				data.setReadcnt(rs.getInt("readcnt"));
				data.setRepRoot(rs.getInt("repRoot"));
				data.setRepStep(rs.getInt("repStep"));
				data.setRepIndent(rs.getInt("repIndent"));
				
				list.add( data );
			}//end while
		}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			close(conn);
		}
		return list;
	}//end select

	/***********************************************************
	 * boardInsert() 메서드: 게시물 등록
	 * @return boolean 리턴.
	 ***********************************************************/
	public boolean boardInsert(BoardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try{
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("INSERT INTO board( num, author, title, content, reproot, repstep, repindent, passwd ) ");
			query.append("VALUES( board_seq.nextval , ?, ? , ? , board_seq.currval, 0 , 0 , ? )");

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, vo.getAuthor());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPasswd());
			int value = pstmt.executeUpdate();
			
			if(value==1) result = true;
		}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(conn);
		}
		return result;
	}
	
	/***********************************************************
	 * readCount() 메서드: 조회수 증가 처리 메서드.
	 * @param 게시물 번호. 
	 ***********************************************************/
	public void readCount(String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("UPDATE board SET readcnt = readcnt + 1 ");
			query.append("WHERE num=?");
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate( );
		}catch( Exception e){ 
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(conn);
		}
	}
	
	/***********************************************************
	 * boardDetail() 메서드: 상세 페이지 처리 메서드.
	 * @param 게시물 번호. 
	 * @return BoardVO 리턴
	 ***********************************************************/
	public BoardVO boardDetail(String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO data = new BoardVO();
		 
		try{
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("SELECT num, author, title,  content,  ");
			query.append("TO_CHAR(writeday,'YYYY-MM-DD HH24:MI:SS') writeday, ");
			query.append("readcnt, repRoot, repIndent, ");
			query.append("repStep FROM board WHERE num = ?");
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				data.setNum(rs.getInt("num"));
				data.setTitle(rs.getString("title"));
				data.setAuthor(rs.getString("author"));
				data.setContent(rs.getString("content"));
				data.setWriteday(rs.getString("writeday"));
				data.setReadcnt(rs.getInt("readcnt"));
				data.setRepRoot(rs.getInt("repRoot"));
				data.setRepStep(rs.getInt("repStep"));
				data.setRepIndent(rs.getInt("repIndent"));
			}//end if
		}catch( Exception e){ 
				e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			close(conn);
		}
		return data; 
	}
	
	/***********************************************************
	 * boardUpdate() 메서드: 게시물 수정 처리 메서드.
	 * @param BoardVO
	 * @return boolean.
	 ***********************************************************/
	public boolean boardUpdate(BoardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		try{
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("UPDATE board SET title = ?, content = ? "); // 제목과 내용은 변경된 내용이, 기존값 그대로
			if(vo.getPasswd()!="") query.append(", passwd = ? ");     // 비밀번호는 변경할 수도 하지 않을 수도 있음.
			query.append("WHERE num = ?");                            // 수정의 기준은 글번호
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString (1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			
			if(vo.getPasswd()!="") {
				pstmt.setString(3, vo.getPasswd());
				pstmt.setInt(4, vo.getNum());
			}else {
				pstmt.setInt(3, vo.getNum());
			}
			
			int count = pstmt.executeUpdate();
			if(count == 1) success = true;
		}catch( Exception e){ 
			e.printStackTrace();
			
		}finally{
			close(pstmt);
			close(conn);
		}
		return success;
	}//end update
	
	/***********************************************************
	 * boardDelete() 메서드: 게시물 삭제 처리 메서드.
	 * @param 게시물 번호, 비밀번호. 
	 ***********************************************************/
	public boolean boardDelete(String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		try{
			conn = getConnection();
			StringBuffer query = new StringBuffer();
			query.append("DELETE FROM board WHERE num = ?");
					
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, Integer.parseInt(num));	
			pstmt.executeUpdate( );
		}catch( Exception e) { 
				e.printStackTrace();
		}finally{
			close(pstmt);
			close(conn);
		}
		return success;
	}//end delete
}