package week_9;
//1. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다.
//        작성한 클래스의 객체를 생성하여, 객체의 멤버들의 값을 출력한다.
public class W9_3_class {
    public String name ;
    public int age;
    public char gender;
    public String hobby;
    public W9_3_class(){}
    public W9_3_class(String name, int age, char gender, String hobby){
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

    //객체 배열의 크기 출력
    public void printSize(W9_3_class[] a){
        System.out.println("객체 배열의 크기는: "+ a.length);
    }
    //객체 배열 중 김으로 시작하는 사람의 갯수 출력
    public void findKimNumber(W9_3_class[] a){
        int count = 0;
        for (int i = 0; i < a.length; i++) {
            if(a[i].getName().contains("김")){
                count ++;
            }
        }
        System.out.println("이름이 김으로 시작하는 사람의 수는: "+count+"명 입니다.");
    }

    public void findKim(W9_3_class[] a){
        for (int i = 0; i < a.length; i++) {
            if(a[i].getName().contains("김")){
                System.out.println("이름이 김으로 시작하는 사람은: "+a[i].getName());
            }
        }
    }
    public void findK(W9_3_class[] a){
        int count = 0;
        for (int i = 0; i < a.length; i++) {
            if(a[i].getName().contains("김")){
                System.out.println("이름이 김으로 시작하는 사람은: "+a[i].getName());
                count++;
            }
        }
        System.out.println("이 있고, 총 "+count+"명 입니다.");
    }
    public void findgender(W9_3_class[] a){
        int count_m = 0;
        int count_g = 0;
        for (int i = 0; i < a.length; i++) {
            if(a[i].getGender() == '남'){
                count_m ++;
            }else if(a[i].getGender() == '여'){
                count_g ++;
            }else{
                System.out.println("error");
            }
        }
        System.out.println("남자의 수: "+count_m+" 여자의 수: "+count_g);
    }
    public void printAll(W9_3_class[] a, String b){

        for (int i = 0; i < a.length; i++) {
            if (b == "남자") {
                if (a[i].getGender() == '남') {
                    System.out.println(a[i].name);
                    System.out.println(a[i].age);
                    System.out.println(a[i].gender);
                    System.out.println(a[i].hobby);
                    System.out.println();
                }
            }
            if (b == "여자") {
                if (a[i].getGender() == '여') {
                    System.out.println(a[i].name);
                    System.out.println(a[i].age);
                    System.out.println(a[i].gender);
                    System.out.println(a[i].hobby);
                    System.out.println();
                }
            }
        }
    }

}
