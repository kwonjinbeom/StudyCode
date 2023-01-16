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
	 * getChungList() 메서드: 충남 데이터 조회
	 * @return ArrayList<ChungVO> 리턴.
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
	* ChungInsert() 메서드: Chung 테이블의 레코드 입력 메서드
	* @param ChungVO. 
	* @return int 자료형 리턴.
	***********************************************************/
	public int ChungnamInsert(ChungnamVO vo) {	
		StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO chungnam(mng_no, local_nm, type, nm, nm_sub,addr,lat,lng, description, list_img) ");
        sb.append("VALUES(?,?,?,?,?,?,?,?,?,?)");

        Connection con = null;
        PreparedStatement pstmt = null;
        int success = 0;

        try{
            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1, vo.getMng_no());
            System.out.println("DAO : " + vo.getMng_no());
            pstmt.setString(2, vo.getLocal_nm());
            pstmt.setString(3, vo.getType());
            pstmt.setString(4, vo.getNm());
            pstmt.setString(5, vo.getNm_sub());
            pstmt.setString(6, vo.getAddr());
            pstmt.setDouble(7, vo.getLat());
            pstmt.setDouble(8, vo.getLng());
            pstmt.setString(9, vo.getDescription());
            pstmt.setString(10, vo.getList_img());

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
                success = insertCount;
            }
        }catch (SQLException e){
            System.out.println("입력에 문제가 있어 잠시 후에 다시 진행해 주세요.");
        }catch (Exception e){
            System.out.println("error = [ " +e+" ]");
        } finally{
            try{
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException e){
                System.out.println("디비 연동 해제 error = [ " +e+ " ]");
            }
        }
        return success;
		
	}
	
	/***********************************************************
	* ChungDelete() 메서드: Chung 테이블의 레코드 삭제 메서드
	* @param ChungVO. 
	* @return int 자료형 리턴.
	***********************************************************/
	public int ChungnamDelete(ChungnamVO vo) {	
		StringBuffer sb = new StringBuffer();
        sb.append("DELETE FROM chungnam ");
        sb.append("WHERE mng_no=?");

        Connection con = null;
        PreparedStatement pstmt = null;
        int success = 0;

        try{
            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1, vo.getMng_no());

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
                success = insertCount;
            }
        }catch (SQLException e){
            System.out.println("삭제에 문제가 있어 잠시 후에 다시 진행해 주세요.");
        }catch (Exception e){
            System.out.println("error = [ " +e+" ]");
        } finally{
            try{
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException e){
                System.out.println("디비 연동 해제 error = [ " +e+ " ]");
            }
        }
        return success;
	}
}