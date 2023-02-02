package com.sign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.mvc.common.util.JDBCTemplate.*;

import com.mvc.board.vo.BoardVO;
import com.sign.vo.SignVO;

public class SignDAO {
	private static SignDAO instance =null;
	
	public static SignDAO getInstance() {
		if(instance==null) {
			instance= new SignDAO();
		}
		return instance;
	}
	
	private SignDAO() {}
	
	/***********************************************************
	 * boardList() 메서드: 게시판 목록 조회(검색 처리 제외)
	 * @return ArrayList<BoardVO> 리턴.
	 ***********************************************************/
	public ArrayList<SignVO> signList(){
		ArrayList<SignVO> list = new ArrayList<SignVO>();
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
				SignVO data = new SignVO();
				data.setNum(rs.getString("num"));
				data.setId(rs.getString("id"));
				data.setPassword(rs.getString("password"));
				data.setName(rs.getString("name"));
				data.setEmail(rs.getString("email"));
				data.setPhoneNumber(rs.getString("phonenumber"));
				data.setDate("data");
				data.setUpDate("update");
				
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


}