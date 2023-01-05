package exam_jdbc;

import java.sql.*;
import java.util.Scanner;

public class BooksPreparedStatementTest {
    public static Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        String title, publisher, year;
        int choice, price, book_id;

        while (true) {
            showMenu();
            choice = scan.nextInt();
            scan.nextLine();

            switch (choice) {
                case 1:
                    System.out.println("책 제목: ");
                    title = scan.nextLine();
                    System.out.println("책 출판사: ");
                    publisher = scan.nextLine();
                    System.out.println("책 출간년도: ");
                    year = scan.next();
                    System.out.println("책 가격: ");
                    price = scan.nextInt();
                    addBook(title, publisher, year, price);
                    break;
                case 2:
                    System.out.println("삭제할 책 번호를 입력하세요.");
                    book_id = scan.nextInt();
                    deleteBook(book_id);
                    break;
                case 3:
                    System.out.println("검색할 책 제목을 입력해 주세요.");
                    title = scan.nextLine();
                    searchBook(title);
                    break;
                case 4:
                    System.out.println("프로그램을 종료합니다.");
                    return;
            }
        }
    }


    public static void showMenu(){
        System.out.println("선택하세요...");
        System.out.println("1. 데이터 입력");
        System.out.println("2. 데이터 삭제");
        System.out.println("3. 데이터 검색 / 전체 입력 시 모든 데이터 조회");
        System.out.println("4. 프로그램 종료");
        System.out.print("선택: ");
    }
    private static void addBook(String title, String publisher, String year, int price){
        Connection con = ConnectDatabase.makeConnection("javauser","java1234");
//        Statement stmt = null;
        PreparedStatement pstmt = null; //null값 안주고 정의만 해도 이미 null값이다. 근데 정확하게 더 쓴거 뿐
        try{
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
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (Exception en){
                en.printStackTrace();
            }
        }
    }

    private static void deleteBook(int book_id){
        ResultSet rs = null;
        int price;
        String publisher, year;
        PreparedStatement pstmt = null;

        try {
            Connection con = ConnectDatabase.makeConnection("javauser","java1234");


            StringBuffer sb = new StringBuffer();
            sb.append("DELETE FROM books ");
//            sb.append("WHERE BOOK_ID = "+ book_id +" ");
            sb.append("WHERE BOOK_ID = ?");
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1, book_id);
            int deleteCount = pstmt.executeUpdate();
            if (deleteCount == 1)//입력이 정상적으로 완료되면 반환값1
                System.out.println("레코드 삭제 성공");
            else
                System.out.println("레코드 삭제 대상이 존재하지 않음");

        }catch (SQLException s){
            System.out.println("[쿼리문 ERROR] \n" + s.getMessage());
        }finally {
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
            }catch (SQLException sqle){
                System.out.println("CLOSE ERROR");
            }
        }
    }

    private static void searchBook(String title){
        Connection con = null;
//        Statement stmt = null;
        ResultSet rs = null;
        int book_id, price;
        String publisher, year;
        PreparedStatement pstmt = null;

        try {
            con = ConnectDatabase.makeConnection("javauser", "java1234");
//            stmt = con.createStatement(); //Statement 객체를 생성한다.
//            preparedState는 객체를 생성할 필요가 없나?


            StringBuffer sql = new StringBuffer();
            if (title.equals("전체")){
                sql.append("SELECT book_id, title, publisher, year, price ");//끝에 공백이 있어야 FROM절과 띄어쓰기가 된다.
                sql.append("FROM books ");
                sql.append("ORDER BY BOOK_ID");
            }
            else {
                sql.append("SELECT book_id, title, publisher, year, price ");//끝에 공백이 있어야 FROM절과 띄어쓰기가 된다.
                sql.append("FROM books ");
                sql.append("WHERE title LIKE '%" + title + "%' ");//
                sql.append("ORDER BY BOOK_ID");
            }
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery(sql.toString()); //SQL문이 SELECT 일 경우 executeQuery를 사용한다.
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
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch (SQLException sqle){
                System.out.println("CLOSE ERROR");
            }
        }
    }





}
