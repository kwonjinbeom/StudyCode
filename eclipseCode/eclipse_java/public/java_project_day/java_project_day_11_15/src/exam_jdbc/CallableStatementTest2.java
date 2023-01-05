package exam_jdbc;

import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class CallableStatementTest2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        String title, publisher, year;
        int choice, price, book_id;

        Connection con = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try{
            System.out.println("책 제목: ");
            title = scan.nextLine();
            System.out.println("책 출판사: ");
            publisher = scan.nextLine();
            System.out.println("책 출간년도: ");
            year = scan.next();
            System.out.println("책 가격: ");
            price = scan.nextInt();

            con = ConnectDatabase.makeConnection("javauser", "java1234");
            cstmt = con.prepareCall("{call books_select(?)}");
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);
            cstmt.executeQuery();

            rs = (ResultSet)cstmt.getObject(1);

            System.out.println("\n**** BOOK 테이블 검색 데이터 ****");
            System.out.println("책제목\t\t 책가격");
            while(rs.next()){
                System.out.printf("%-28s\t %s\n", rs.getString("title"), rs.getInt("price"));
            }
        }catch (SQLException s){
            System.out.println("오라클 서버 연동 후 쿼리 실행에 문제가 발생하였습니다.");
        }catch (Exception e){
            System.out.println("ERROR("+e.getMessage()+")");
        }finally {
            try {
                if(cstmt != null) cstmt.close();
                if(con != null) con.close();
            }catch (Exception e){
                System.out.println("연결 해제 오류.");
                e.printStackTrace();
            }
        }
    }
}
