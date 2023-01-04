package use_of_programming_languages;

public class Page_54_3 {
    private String name;
    private int age;
    private char gender;

    public Page_54_3(){}
    public Page_54_3(String name, int age, char gender){
        this.name = name;
        this.age = age;
        this.gender = gender;
    }
    public void display(){
        System.out.println(name+ ","+ age + "세," + gender + "자");
    }
}
