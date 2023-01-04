package exam_ex;

public class EmployeeTest {
    public static void main(String[] args) {
        Employee e = new Employee("홍길동", "서울", "010-1111-1234",10);
        Manager m = new Manager("김철수","경상도",
                "010-8756-6464",50,"농사꾼",1000);


/*        e.setEmpData("홍길동", "서울", "010-1111-1234",10);
        m.setMgrData("김철수","경상도",
                "010-8756-6464",50,"농사꾼",1000);*/


        System.out.println(e.toString());
        System.out.println(m.toString());

    }
}
