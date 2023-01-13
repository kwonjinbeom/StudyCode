package com.subject;
import javax.security.auth.Subject;
import java.sql.*;
import java.util.ArrayList;

//        DAO(Data Access Object) 클래스가 데이터 처리의 궁극적인 단계이다.
//
//        CRUD 프로그램 구현
//        기본적인 데이터 처리 기능인 입력(Create, insert), 조회(Read(또는 Retrieve), Select),
//        수정(Update),삭제(Delete) 기능을 구현한 데이터베이스 프로그램.
public class SubjectDAO {
    //데이터베이스 연결 관련 상수 선언
    private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
    private static final String USER = "javauser";
    private static final String PASSWD = "java1234";

    // 클래스 자신의 타입으로 정적 필드 선언
    private static SubjectDAO instance = null;

    //외부에서 호출할 수 있는 정적 메소드인 getInstance() 선언하여 인스턴스를 반환.
    public static SubjectDAO getInstance(){
        if(instance == null){
            instance = new SubjectDAO();
        }
        return instance;
    }

    // 외부에서 new 연산자로 생성자를 호출할 수 없도록 막기 위해 접근 제한자(private)설정
    private SubjectDAO(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }
    private Connection getConnection() throws SQLException{
        Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
        return con;
    }

    /****************************************************************
     * getSubjectTotal() 메서드 : 학과 테이블에서 모든 레코드를 반환 메서드
     * @return ArrayList<SubjectVO> 자료형 리턴.
     *************************************************************/
    public ArrayList<SubjectVO> getSubjectTotal(SubjectVO vo){
        StringBuffer sql = new StringBuffer();
        sql.append("select no, s_num, s_name from subject ");
        if(vo != null){
            sql.append("where s_name like ?");
        }
        sql.append("order by no");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SubjectVO svo = null;
        ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();

        try{
            con = getConnection();
            pstmt = con.prepareStatement(sql.toString());
            if(vo != null){
                pstmt.setString(1, "%" + vo.getS_name() + "%");
            }
            rs = pstmt.executeQuery();

            //ResultSet의 결과에서 모든 행을 각각의 SubjectVO 객체에 저장
            while(rs.next()){
                //한 행의 학과 정보를 저장할 VO 객체 생성
                svo = new SubjectVO();
                //한 행의 학과 정보를 VO 객체에 저장
                svo.setNo(rs.getInt("no"));
                svo.setS_num(rs.getString("s_num"));
                svo.setS_name(rs.getString("s_name"));

                //ArrayList 객체에 원소로 추가
                list.add(svo);
            }
        }catch (SQLException se){
            System.out.println("조회에 문제가 있어 잠시 후에 다시 진행해 주세요.");
            se.printStackTrace();
        }catch (Exception e){
            System.out.println("error = [ "+e+"]");
        }finally {
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException e){
                System.out.println("디비 연동 해제 error = [ "+e+"]");
            }
        }
        return list;
    }
    /****************************************************************
     * getSubjectNum() 메서드 : 학과번호 자동 구하기.
     * @return String 자료형 리턴.
     *************************************************************/
    public String getSubjectNum(){
    //값을 주지 않았을 때에도 자동으로 값이 들어가야 한다.
    //그러기 위해서는 sql developer 의 값을 가져오고 다음 값을 알아낼 수 있고 그 값에서 +1을 준 후에
    // sql developer 에 다시 전달할 수 있어야 한다.

    //0을 빼고 숫자로 만들어야 한다. 그래야 5에다가 +1을 할 수 있다
    //6을 제거시켰으니까 가져올 때 다시 0을 가져올 수 있다.
        StringBuffer sb = new StringBuffer();
        sb.append("select nvl(lpad(max(to_number(LTRIM(s_num,'0')))+1,2,'0'),'01') ");
        sb.append("as subjectNum from subject");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String subjectNumber = "";
        try{
            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();
            if(rs.next()){
                subjectNumber = rs.getString("subjectNum");
            }
        }catch (SQLException se){
            System.out.println("쿼리 getSubjectNum error = [ "+se+" ]");
            se.printStackTrace();
        }catch (Exception e){
            System.out.println("error = [ " +e+" ]");
        }finally {
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException se){
                System.out.println("디비 연동 해제 error = [ " +se+ " ]");
            }
        }
        return subjectNumber;
    }
    /****************************************************************
     * subjectInsert() 메서드: 학과 테이블에 데이터 입력.
     //* @param svo            (SubjectVO 클래스 //입출력 help)
     * @return boolean 자료형 리턴. //정상처리 key
     *************************************************************/
    public boolean subjectInsert(SubjectVO svo){
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO subject(no, s_num, s_name) ");
        sb.append("VALUES(subject_seq.NEXTVAL, ?, ?)");

        Connection con = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try{
            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1, svo.getS_num());
            pstmt.setString(2, svo.getS_name());

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
                success = true;
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
    /****************************************************************
     * subjectUpdate() 메서드: 학과 테이블에 데이터 수정. 학과번호는 수정할 수 없다.
     //* @param svo SubjectVO 클래스
     * @return boolean 자료형 리턴.
     *************************************************************/
    public boolean subjectUpdate(SubjectVO svo){
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE subject ");
        sb.append("SET s_name = ? ");
        sb.append("WHERE s_num = ? ");

        Connection con = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try{

            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1, svo.getS_name());
            pstmt.setString(2, svo.getS_num());

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
                success = true;
            }
        }catch (SQLException e){
            System.out.println("수정에 문제가 있어 잠시 후에 다시 진행해 주세요.");
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
    /****************************************************************
     * studentDataCheck() 메서드: 학과에 소속된 학생이 있는지 확인
     * @return String?? 자료형 리턴.
     *************************************************************/
    public int studentDataCheck(SubjectVO svo){
        StringBuffer sql = new StringBuffer();
        sql.append("select su.s_num s_num, count(sd_num) AS nullcheck ");
        sql.append("FROM subject su LEFT OUTER JOIN student st ");
        sql.append("ON su.s_num = st.s_num ");
        sql.append("WHERE su.s_num = ? ");
        sql.append("GROUP BY su.s_num ");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int nullCheck = 0;
        try{
            con = getConnection();
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, svo.getS_num());
            rs = pstmt.executeQuery();
            if(rs.next()){
                nullCheck = rs.getInt("nullcheck");

            }
        }catch (SQLException se){
            System.out.println("검색에 문제가 있어 잠시 후에 다시 진행해 주세요.");
            se.printStackTrace();
        }catch (Exception e){
            System.out.println("error = [ "+e+"]");
        }finally {
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException e){
                System.out.println("디비 연동 해제 error = [ "+e+"]");
            }
        }
        return nullCheck;

    }
    /****************************************************************
     * subjectDelete() 메서드: 학과 테이블에 데이터 수정. 학과번호는 수정할 수 없다.
     //* @param svo SubjectVO 클래스
     * @return boolean 자료형 리턴.
     *************************************************************/
    public boolean subjectDelete(SubjectVO svo){
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE FROM subject ");
        sb.append("WHERE s_num = ?");

        Connection con = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try{

            con = getConnection();
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1, svo.getS_num());

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
                success = true;
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
//    public ArrayList<SubjectVO> getSubject(SubjectVO svo){
//        StringBuffer sql = new StringBuffer();
//        sql.append("select no, s_num, s_name from subject ");
//        sql.append("where s_name = ? order by no");
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();
//
//        try{
//            con = getConnection();
//            pstmt = con.prepareStatement(sql.toString());
//            pstmt.setString(1, svo.getS_name());
//            rs = pstmt.executeQuery();
//
//            //ResultSet의 결과에서 모든 행을 각각의 SubjectVO 객체에 저장
//            while(rs.next()){
//                //한 행의 학과 정보를 저장할 VO 객체 생성
//                svo = new SubjectVO();
//                //한 행의 학과 정보를 VO 객체에 저장
//                svo.setNo(rs.getInt("no"));
//                svo.setS_num(rs.getString("s_num"));
//                svo.setS_name(rs.getString("s_name"));
//
//                //ArrayList 객체에 원소로 추가
//                list.add(svo);
//            }
//        }catch (SQLException se){
//            System.out.println("검색에 문제가 있어 잠시 후에 다시 진행해 주세요.");
//            se.printStackTrace();
//        }catch (Exception e){
//            System.out.println("error = [ "+e+"]");
//        }finally {
//            try{
//                if(rs != null) rs.close();
//                if(pstmt != null) pstmt.close();
//                if(con != null) con.close();
//            }catch (SQLException e){
//                System.out.println("디비 연동 해제 error = [ "+e+"]");
//            }
//        }
//        return list;
//    }




//    public boolean sequenceRemake(){
//        StringBuffer sb = new StringBuffer();
//
//        //시퀀스 동기화
//        sb.append("DROP SEQUENCE subject_seq");
//        sb.append("CREATE SEQUENCE subject_seq ");
//        sb.append("START WITH ? ");
//        sb.append("INCREMENT BY 1 ");
//        sb.append("MINVALUE 1 ");
//        sb.append("MAXVALUE 100000 ");
//        sb.append("NOCYCLE ");
//        sb.append("CACHE 2");
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        boolean success = false;
//
//        try{
//
//            con = getConnection();
//            pstmt = con.prepareStatement(sb.toString());
//            pstmt.setInt(1,Integer.parseInt(getSubjectNum())-1);
//
//            int insertCount = pstmt.executeUpdate();
//            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
//            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
//            //웬만하면 prepareStatement 를 사용함.
//            if (insertCount == 1) {//입력이 정상적으로 완료되면 반환값1
//                success = true;
//            }
//        }catch (SQLException e){
//            System.out.println("동기화에 문제가 있어 잠시 후에 다시 진행해 주세요.");
//        }catch (Exception e){
//            System.out.println("error = [ " +e+" ]");
//        } finally{
//            try{
//                if(pstmt != null) pstmt.close();
//                if(con != null) con.close();
//            }catch (SQLException e){
//                System.out.println("디비 연동 해제 error = [ " +e+ " ]");
//            }
//        }
//        return success;
//    }
}
