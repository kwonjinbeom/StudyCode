package exam_jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class BooksInsertTest {
    public static void main(String[] args) {
        addBook("이것이 우분투 리눅스다", "한빛미디어","2020",32000);
    }
    private static void addBook(String title, String publisher, String year, int price){
        Connection con = ConnectDatabase.makeConnection("javauser","java1234");
        Statement stmt = null;
        PreparedStatement pstmt = null; //null값 안주고 정의만 해도 이미 null값이다. 근데 정확하게 더 쓴거 뿐
        try{
//            stmt = con.createStatement();
//
//            StringBuffer sb = new StringBuffer();
//            sb.append("INSERT INTO books (book_id, title, publisher, ");
//            sb.append("year, price) VALUES (books_seq.nextval, ");
//            sb.append("'" + title + "','" + publisher + "','");
//            sb.append(year + "'," + price + ")");
//
//            System.out.println("쿼리문 확인: " + sb);
//
//            int insertCount = stmt.executeUpdate(sb.toString());//쿼리문 실행하여 적용된 행의 반환
            //PreparedStatement 사용방법
            StringBuffer sb = new StringBuffer();
            sb.append("INSERT INTO books (book_id, title, publisher, year, price) ");
            sb.append("VALUES (books_seq.nextval,?,?,?,?)"); //?를 바인딩이라고 함.

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1, title);
            pstmt.setString(2, publisher);
            pstmt.setString(3, year);
            pstmt.setInt(4, price);

            int insertCount = pstmt.executeUpdate();
            //위 createStatement 와 달리 prepareStatement는 print 쿼리문확인 sb와 같은 StringBuffer를
            //조회할 수 없다 왜냐하면 바인딩 때문에 완벽한 쿼리문이 아니기 때문이다.
            //웬만하면 prepareStatement 를 사용함.
            if (insertCount == 1)//입력이 정상적으로 완료되면 반환값1
                System.out.println("레코드 추가 성공");
            else
                System.out.println("레코드 추가 실패");
        }catch (SQLException e){
            System.out.println(e.getMessage());
            System.exit(0);
        }finally{
            try{
//                if(stmt != null) stmt.close();
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (Exception en){
                en.printStackTrace();
            }
        }
    }
}
