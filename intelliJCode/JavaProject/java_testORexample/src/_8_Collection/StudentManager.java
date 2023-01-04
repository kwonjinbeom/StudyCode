package _8_Collection;

import java.util.*;

class Student{
    private String name;
    private String department;
    private String id;
    private String grade;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Student(String name, String department, String id, String grade) {
        this.name = name;
        this.department = department;
        this.id = id;
        this.grade = grade;
    }
}
public class StudentManager {
    static final int studentNum = 4;

    static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) {
        List<Student> studentList = new ArrayList<>();
        read(studentList);
        printAll(studentList);
        processQuery(studentList);
    }
    static void read(List studentList){
        for (int i = 0; i < studentNum; i++) {
            System.out.print("이름: ");
            String name = scan.next();
            System.out.print("학과: ");
            String department = scan.next();
            System.out.print("학번: ");
            String id = scan.next();
            System.out.print("학점평균: ");
            String grade = scan.next();
            studentList.add(new Student(name,department,id,grade));
        }
    }
    static void printAll(List studentList){
        for (int i = 0; i < studentNum; i++) {
            Student student = (Student) studentList.get(i);
            System.out.println("\n이름: " + student.getName());
            System.out.println("학과: " + student.getDepartment());
            System.out.println("학번: " + student.getId());
            System.out.println("학점평균: " + student.getGrade());
        }
    }
    static void processQuery(List studentList) {
        while (true) {
            boolean search = true;
            System.out.print("\n찾고 싶은 학생의 이름을 입력해주세요.: ");
            String name = scan.next();
            if(name.equals("종료")){
                break;
            }
            for (int i = 0; i < studentNum; i++) {
                Student student = (Student) studentList.get(i);
                if(student.getName().equals(name)) {
                    System.out.println("\n이름: " + student.getName());
                    System.out.println("학과: " + student.getDepartment());
                    System.out.println("학번: " + student.getId());
                    System.out.println("학점평균: " + student.getGrade());
                    search = false;
                }
            }
            if(search){
                System.out.println("이름을 잘못 입력하셨습니다.");
            }
        }
    }
}
