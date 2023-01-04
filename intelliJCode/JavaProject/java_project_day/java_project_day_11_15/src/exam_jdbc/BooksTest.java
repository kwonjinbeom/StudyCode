package exam_jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class BooksTest {
    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        int book_id, price;
        String title, publisher, year;
        Scanner input = new Scanner(System.in);

        try {
            con = ConnectDatabase.makeConnection("javauser", "java1234");
            stmt = con.createStatement(); //Statement 객체를 생성한다.

//            System.out.println("검색할 책 제목을 입력해 주세요.");//
//            title = input.nextLine();//

            StringBuffer sql = new StringBuffer();
            sql.append("SELECT book_id, title, publisher, year, price ");//끝에 공백이 있어야 FROM절과 띄어쓰기가 된다.
            sql.append("FROM books ");
//            sql.append("WHERE title = '" + title + "'");//
//            sql.append("WHERE title LIKE '%" + title + "%'");//

            rs = stmt.executeQuery(sql.toString()); //SQL문이 SELECT 일 경우 executeQuery를 사용한다.

            System.out.println("**** EMPLOYEES 테이블 데이터 출력 ****\n");
            System.out.printf("%6s\t%10s\t%25s\t%8s\t%3s\n", "BOOK_ID", "TITLE", "PUBLISHER","YEAR", "PRICE");

            while (rs.next()) {
                book_id = rs.getInt("book_id");
                title = rs.getString("title");
                publisher = rs.getString("publisher");
                year = rs.getString("year");
                price = rs.getInt("price");
                System.out.printf("%-7d %-25s\t %-10s \t%-6s\t %d\n", book_id, title, publisher, year, price);
            }
        }catch (SQLException s){
            System.out.println("[쿼리문 ERROR] \n" + s.getMessage());
        }finally {
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(con != null) con.close();
            }catch (SQLException sqle){
                System.out.println("CLOSE ERROR");
            }
        }
    }
}
