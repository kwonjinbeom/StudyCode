package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.common.JDBCTemplate.*;
public class BoardDao {
	
	public ArrayList<Board> getBoardTotal(Board vo){
		StringBuffer sql = new StringBuffer();
		sql.append("select boardnum, boardwriter, boardtitle, boardcontent, boarddate from board ");
		sql.append("order by boardnum");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board svo = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				svo = new Board();
				svo.setBoardNum(rs.getInt("boardnum"));
				svo.setBoardWriter(rs.getString("boardwriter"));
				svo.setBoardTitle(rs.getString("boardtitle"));
				svo.setBoardContent(rs.getString("boardcontent"));
				svo.setBoardDate(rs.getString("boarddate"));
				
				list.add(svo);
			}
		}catch(SQLException se) {
			System.out.println("조회에 문제가 있어 잠시 후에 다시 진행해 주세요.");
			se.printStackTrace();
		}catch (Exception e) {
			System.out.println("error = [ " + e +" ]");
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return list;
	}
	
	public String getBoardNum() {
		StringBuffer sql = new StringBuffer();
		sql.append("select nvl(lpad(max(to_number(LTRIM(boardnum, '0'))) + 1, 2, '0'),'01')");
		sql.append("as autoBoardNum from board");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String boardNumber= "";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardNumber = rs.getString("autoBoardNum");
			}
		}catch (SQLException se) {
			se.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(con);
			close(pstmt);
		}
		return boardNumber;
	}
	
	public boolean BoardInsert(Board svo) {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into board(boardnum, boardwriter, boardtitle, boardcontent) ");
		sql.append("values(?, ?, ?, ?)");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, svo.getBoardNum());
			pstmt.setString(2, svo.getBoardWriter());
			pstmt.setString(3, svo.getBoardTitle());
			pstmt.setString(4, svo.getBoardContent());
			
			int i = pstmt.executeUpdate();
			if(i==1) {
				success = true;
				commit(con);
			}
		}catch (SQLException se) {
			se.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
			close(pstmt);
		}
		return success;
	}
}
