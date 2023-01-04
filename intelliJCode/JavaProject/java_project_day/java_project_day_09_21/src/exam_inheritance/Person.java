package exam_inheritance;

class Person {
    private String name;
    private int age;

    public Person(){}
    public Person(String name,int age){
        this.name = name;
        this.age = age;
    }


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

    public String toString(){
        return name + " " + age;
    }
}
class Employee extends Person{
    private String dept;
    public Employee(){}


    public Employee(String name,int age, String dept){
        super(name, age);
//        this.name = name;
//        this.age = age;
        this.dept = dept;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
    public String toString(){
        return super.toString() + ":" + getDept();
    }
}
class Professor extends Person{
    private String subject;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String toString(){
        return super.toString() + ":" + getSubject();
    }
}
class Student extends Person{
    private String major;

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    public String toString(){
        return super.toString() + ":" + getMajor();
    }
}