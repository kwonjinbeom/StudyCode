package exam_generic_wildcard;

import java.sql.Wrapper;
import java.util.Arrays;

//일반인
class Person{
    private String name;

    public Person(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }
    public String toString(){return name;}
}

//직장인
class Worker extends Person{
    public Worker(String name){
        super(name);
    }
}

//학생
class Student extends Person{
    public Student(String name){
        super(name);
    }
}

//고등학교
class HighStudent extends Student{
    public HighStudent(String name){
        super(name);
    }
}

class Course<T>{
    private String name;
    private T[] students;

    @SuppressWarnings("unchecked")
    public Course(String name, int size){
        this.name = name;
        students = (T[])(new Object[size]);
        //students = new T[size];
    }

    public String getName(){return name;}
    public T[] getStudents(){return students;}
    public void add(T t){
        for (int i = 0; i < students.length; i++) {
            if(students[i] == null){
                students[i] = t;
                break;
            }

        }
    }
}
public class WildCardExample {
    public static void registerCourse(Course<?> course){
        System.out.println(course.getName() + " 수강생: "
        + Arrays.toString(course.getStudents()));
    }
    public static void registerCourseStudent(Course<? extends Student> course){
        // extends Student는 Student와 Student의 하위 클래스 HighStudent만 올 수 있다.
        System.out.println(course.getName() + " 수강생: "
        + Arrays.toString(course.getStudents()));
    }
    public static void registerCourseWorker(Course<? super Worker> course){
        // super Worker는 Worker 본인이거나 Worker의 부모만 올 수 있다.
        System.out.println(course.getName() + " 수강생: "
        + Arrays.toString(course.getStudents()));
    }
    public static void main(String[] args) {
        // 일반인 과정
        Course<Person> personCourse = new Course<Person>("일반인과정",4);
        personCourse.add(new Person("일반인"));
        personCourse.add(new Worker("직장인"));
        personCourse.add(new Student("학생"));
        personCourse.add(new HighStudent("고등학생"));

        //직장인 과정
        Course<Worker> workerCourse = new Course<Worker>("직장인과정",1);
        workerCourse.add(new Worker("직장인"));

        //학생 과정
        Course<Student> studentCourse = new Course<Student>("학생과정",2);
        studentCourse.add(new Student("학생"));
        studentCourse.add(new HighStudent("고등학생"));

        //고등학교 과정
        Course<HighStudent> highStudentCourse = new Course<HighStudent>("고등학생과정",1);
        highStudentCourse.add(new HighStudent("고등학생"));

        registerCourse(personCourse);
        registerCourse(workerCourse);
        registerCourse(studentCourse);
        registerCourse(highStudentCourse);
        System.out.println();

//        registerCourseStudent(personCourse);
//        registerCourseStudent(workerCourse);
        //extends student 이기 때문에 student와 hightstudent
        registerCourseStudent(studentCourse);
        registerCourseStudent(highStudentCourse);
        System.out.println();

        registerCourseWorker(personCourse);
        registerCourseWorker(workerCourse);
        // super worker와 부모클래스 person만 가능
//        registerCourseWorker(studentCourse);
//        registerCourseWorker(highStudentCourse);


    }
}
