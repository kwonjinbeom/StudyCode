package exam_interface;

import java.util.Arrays;
import java.util.Objects;

@SuppressWarnings("rawtypes")
class Student implements Comparable{
    private String name;
    private double gpa;

    public Student(String name, double gpa){
        this.name = name;
        this.gpa = gpa;
    }

    public String getName() {
        return name;
    }

    public double getGpa() {
        return gpa;
    }
    @Override
    public String toString(){
        return "이름=" + name + " 평점=" + gpa;
    }
    public int compareTo(Object obj){
        Student other = (Student) obj;
        if(this.gpa < other.gpa)
            return -1;
        else if (this.gpa > other.gpa)
            return 1;
        else
            return 0;
//        //이름 기준
//        return this.name.compareTo(other.name);
    }
}

public class StudentSort {
    public static void main(String[] args) {
        int[] numbers = {60, 88, 10, 45, 90};
        Arrays.sort(numbers);

        for(int num: numbers){
            System.out.println(num + " ");
        }
        System.out.println("\n");
        Student[] students = new Student[3];
        students[0] = new Student("홍길동", 3.39);
        students[1] = new Student("이한솔", 4.21);
        students[2] = new Student("김희진", 2.19);
        Arrays.sort(students);
        for (Student s : students)
            System.out.println(s.toString());
    }
}
//숫자 객체 차이
