package exam_class_baisc;
//직원 정보를 저장할 Employee 클래스를 생성하여 보자.
//직원은 이름(name), 전화 번호(phoneNumber), 급여 (salary)을 필드로 가진다. - 접근제어자: public
//직원 정보를 실행 클래스에서 임의의 값으로 설정하여 준다.
//그후 화면에 전체 필드의 내용이 출력되도록 작성한다.
//
//[실행결과]
//직원정보[ 사원명: 홍길동, 전화번호 = 010 -2345-3476, 급여 = 1000000 ]
//직원정보[ 사원명: 김철수, 전화번호 = 010 -3423-5242, 급여 = 7000000 ]
public class EmployeeClass {
    public String name;
    public String phoneNumber;
    public int salary;

    public void employeeData(String eName, String pNumber, int sal) {
        name = eName;
        phoneNumber = pNumber;
        salary = sal;
    }

    public void printEmployeeInfor(){
        System.out.println("직원정보[ 사원명: " + name + ", 전화번호 = " + phoneNumber
        + ", 급여 = " + salary);
    }


}
