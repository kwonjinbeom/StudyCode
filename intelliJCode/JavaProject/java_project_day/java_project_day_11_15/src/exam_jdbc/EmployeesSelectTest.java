package exam_jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmployeesSelectTest {
    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        int employee_id, salary;
        String first_name, department_name, hire_date;

        try {
            con = ConnectDatabase.makeConnection("hr", "hr1234");
            stmt = con.createStatement(); //Statement 객체를 생성한다.

            StringBuffer sql = new StringBuffer();
            sql.append("SELECT employee_id, first_name, salary, TO_CHAR(hire_date,'YYYY\".\"MM\".\"DD') hire_date ,department_name ");
//            sql.append("SELECT employee_id, first_name, salary, department_name ");
            //입사일을 조회하는데 년월일사이에 구분자를 .으로 해서
            sql.append("FROM employees e INNER JOIN departments d");
            sql.append(" ON e.department_id = d.department_id");
            rs = stmt.executeQuery(sql.toString()); //SQL문이 SELECT 일 경우 executeQuery를 사용한다.

            System.out.println("**** EMPLOYEES 테이블 데이터 출력 ****\n");
            System.out.printf("%s\t%s\t%6s\t%7s\t%7s\n", "사원번호", "사원이름", "급여","날짜", "부서명");

            while (rs.next()) {
                employee_id = rs.getInt("employee_id");
                first_name = rs.getString("first_name");
                salary = rs.getInt("salary");
                hire_date = rs.getString("hire_date");
                department_name = rs.getString("department_name");
                System.out.printf("%-7d %-11s %6d %-6s %s\n", employee_id, first_name, salary, hire_date, department_name);
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
