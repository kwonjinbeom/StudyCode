package week_9;

//1. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다.
//        작성한 클래스의 객체를 생성하여, 객체의 멤버들의 값을 출력한다.

public class w9_1 {
    public static void main(String[] args) {
        W9_1_class w9_1_class = new W9_1_class("권진범",25,'남',"music");


        System.out.println("나의 이름은 " + w9_1_class.name);
        System.out.println("나이는 " + w9_1_class.age + "살");
        System.out.println("성별은 " + w9_1_class.gender);
        System.out.println("취미는 " + w9_1_class.hobby + "입니다.");

    }
}
