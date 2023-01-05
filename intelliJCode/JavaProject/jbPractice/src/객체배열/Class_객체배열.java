package 객체배열;
//1. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다.
//        작성한 클래스의 객체를 생성하여, 객체의 멤버들의 값을 출력한다.
public class Class_객체배열 {
    public String name ;
    public int age;
    public char gender;
    public String hobby;
    public Class_객체배열(){} //기본 생성자
    //매개변수 있는 생성자
    public Class_객체배열(String name, int age, char gender, String hobby){
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.hobby = hobby;
    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    public int getAge(){
        return age;
    }
    public void setName(int age){
        this.age = age;
    }
    public char getGender(){
        return gender;
    }
    public void setGender(char gender){
        this.gender = gender;
    }
    public String getHobby(){
        return hobby;
    }
    public void setHobby(String hobby){
        this.hobby = hobby;
    }


}
