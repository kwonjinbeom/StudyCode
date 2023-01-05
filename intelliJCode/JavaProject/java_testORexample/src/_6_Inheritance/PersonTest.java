package _6_Inheritance;

class Person {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    Person(String name, int age){
        this.name = name;
        this.age = age;
    }
    public String show(){
        return "[이름 : " + name + ", 나이 : "+ age;
    }
}

class Student extends Person{
    private int grade;

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
    Student(String name, int age, int grade){
        super(name, age);
        this.grade = grade;
    }
    public String show(){
        return super.show()+", 학번 : " + grade ;
    }
}

class ForeignStudent extends Student{
    private String nationality;

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    ForeignStudent(String name, int age, int grade, String nationality){
        super(name, age, grade);
        this.nationality = nationality;
    }
    public String show(){
        return super.show()+", 국적 : " + nationality ;
    }
}

public class PersonTest {
    public static void main(String[] args) {
        Person p = new Person("홍길동", 56);
        Student s = new Student("한늘봄",41,99010001);
        ForeignStudent f = new ForeignStudent("Olivia",39,97060004,"U.S.A");

        System.out.println("사람"+p.show()+"]");
        System.out.println("학생"+s.show()+"]");
        System.out.println("외국학생"+f.show()+"]");
    }
}
