package exam_object_stream;

import java.io.*;
import java.util.Scanner;

class Person implements Serializable{
    private static final long serialVersionUID = 1L;

    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
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
}


public class ObjectInputOutputStreamExample01 {
    static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) {
        String file = "person.dat";
        output(file);
        input(file);

    }
    private static void output(String file){
        try(FileOutputStream fos = new FileOutputStream(file);
            ObjectOutputStream oos = new ObjectOutputStream(fos)){

            System.out.print("이름: ");
            String name = scan.nextLine();
            System.out.println("나이: ");
            int age = scan.nextInt();
            scan.nextLine();


            oos.writeObject(new Person(name,age));

            System.out.print("이름: ");
            name = scan.nextLine();
            System.out.println("나이: ");
            age = scan.nextInt();
            scan.nextLine();


            oos.writeObject(new Person(name,age));
        }catch (IOException e){
            System.out.println(e);
        }
    }
    private static void input(String file){
        try(
                FileInputStream fis = new FileInputStream(file);
            ObjectInputStream oos = new ObjectInputStream(fis)
        ){
            while(true) {
                Person p = (Person) oos.readObject();
                System.out.println(p.toString());
            }
        }catch (ClassNotFoundException e){
            System.out.println("클래스를 찾을 수 없습니다.");
        }catch (IOException io){}
    }
}
