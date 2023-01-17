package com.subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.common.JDBCTemplate.*;
public class SubjectDAO {
	
	public ArrayList<SubjectVO> getSubjectTotal(SubjectVO vo){
		StringBuffer sql = new StringBuffer();
		sql.append("select no, s_num, s_name from subject ");
		if(vo != null) {
			sql.append("where s_name like ?");
		}
		sql.append("order by no");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SubjectVO svo = null;
		ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			if(vo!=null) {
				pstmt.setString(1, "%" + vo.getS_name() + "%");
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				svo = new SubjectVO();
				svo.setNo(rs.getInt("no"));
				svo.setS_num(rs.getString("s_num"));
				svo.setS_name(rs.getString("s_name"));
				
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
	
	public String getSubjectNum() {
		StringBuffer sql = new StringBuffer();
		sql.append("select nvl(lpad(max(to_number(LTRIM(s_num, '0'))) + 1, 2, '0'),'01')");
		sql.append("as subjectNum from subject");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String subjectNumber= "";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				subjectNumber = rs.getString("subjectNum");
			}
		}catch (SQLException se) {
			System.out.println("쿼리 getSubjectNum error = [ " + se + "]");
			se.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(con);
			close(pstmt);
		}
		return subjectNumber;
	}
	
	public boolean subjectInsert(SubjectVO svo) {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into subject(no, s_num, s_name) ");
		sql.append("values(subject_seq.nextval, ?, ?)");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, svo.getS_num());
			pstmt.setString(2, svo.getS_name());
			
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
