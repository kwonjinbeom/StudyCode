package week_9;
//        2. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다(1번 클래스 재 사용 가능).
//        작성한 클래스의 객체 배열을 생성하여, 객체 배열안에 있는 객체들의 멤버들의 값을 출력한다.
//        (즉, 객체 값 리스트를 출력한다.)
public class w9_2 {
    public static void main(String[] args) {
        W9_1_class[] intro = new W9_1_class[3];
        intro[0] = new W9_1_class("권진범",25,'남',"music");
        intro[1] = new W9_1_class("김연아",26,'여',"movie");
        intro[2] = new W9_1_class("김철수",27,'남',"soccer");
        for (int i = 0; i < intro.length; i++) {
            System.out.println("나의 이름은 " +intro[i].getName());
            System.out.println("나이는 " +intro[i].getAge());
            System.out.println("성별은 " + intro[i].getGender());
            System.out.println("취미는 " +intro[i].getHobby());
            System.out.println("===============================");
        }
    }
}
