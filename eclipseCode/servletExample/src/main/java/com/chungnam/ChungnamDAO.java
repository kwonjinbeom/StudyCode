package com.chungnam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/* DAO(Data Access Object) 클래스가 데이터 처리의 궁극적인 단계이다. 
 * 
 * CRUD 프로그램 구현
 * 기본적인 데이터 처리 기능인 입력(Create, insert), 조회(Read(또는 Retrieve), Select), 수정(Update), 삭제(Delete) 기능을 구현한 데이터베이스 프로그램.
 * */

public class ChungnamDAO {
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
	private static final String USER = "javauser";
	private static final String PASSWD = "java1234";
	// 클래스 자신의 타입으로 정적 필드 선언
	private static ChungnamDAO instance = null;
	public ArrayList<Integer> arr = new ArrayList<Integer>();
	// 외부에서 호출할 수 있는 정적 메소드인 getInstance() 선언하여 인스턴스를 반환.
    public static ChungnamDAO getInstance() {
    	if(instance == null) {
    		instance = new ChungnamDAO();
    	}
        return instance;
    }
    // 외부에서 new 연산자로 생성자를 호출할 수 없도록 막기 위해 접근 제한자(private)로 명시. private 생성자(){}선언.
	private ChungnamDAO(){
		try{ 
			Class.forName("oracle.jdbc.OracleDriver"); 
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
		}
    }
	
    private Connection getConnection() throws SQLException{
    	Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		return con;
    }

	/***********************************************************
	 * getChungnamList() 메서드: 충남 데이터 조회
	 * @return ArrayList<ChungnamVO> 리턴.
	 ***********************************************************/
	public ArrayList<ChungnamVO> getChungnamList() {	
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		ArrayList<ChungnamVO> list = new ArrayList<ChungnamVO>();
		ChungnamVO vo = null;
		
        StringBuffer sql = new StringBuffer();
        sql.append("select mng_no, local_nm, type, nm, nm_sub, description, list_img from chungnam");
        sql.append(" order by mng_no desc");
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {		
				//한 행의 정보를 저장할 VO 객체 생성.  
				vo = new ChungnamVO();
				vo.setMng_no(rs.getInt("mng_no"));
				vo.setLocal_nm(rs.getString("local_nm"));
				vo.setType(rs.getString("type"));
				vo.setNm(rs.getString("nm"));
				vo.setNm_sub(rs.getString("nm_sub"));
				vo.setDescription(rs.getString("description"));
				vo.setList_img(rs.getString("list_img"));
				
				list.add(vo);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/***********************************************************
	* chungnamInsert() 메서드: chungnam 테이블의 레코드 입력 메서드
	* @param ChungnamVO. 
	* @return int 자료형 리턴.
	***********************************************************/
	public int chungnamInsert(ArrayList<Integer> Al, String searchValue) {	
		int findValue = 0;
		if(searchValue != null) {
			for(int i = 0; i < Al.size(); i++) {
		        if (Al.get(i)== Integer.parseInt(searchValue)) {
		        	
		        	findValue = Al.indexOf(Al.get(i));
		        }
			}
		}

		return findValue;
		
	}
	
	/***********************************************************
	* chungnamDelete() 메서드: chungnam 테이블의 레코드 삭제 메서드
	* @param ChungnamVO. 
	* @return int 자료형 리턴.
	***********************************************************/
	public int chungnamDelete(ChungnamVO vo) {	
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("delete from chungnam ");
		sql.append("where mng_no = ?");
		
		try {
			con=getConnection();
			pstmt = con.prepareStatement(sql.toString());
		
			pstmt.setInt(1, vo.getMng_no());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return 0;
	}
}