package week_9;
//        2. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다(1번 클래스 재 사용 가능).
//        작성한 클래스의 객체 배열을 생성하여, 객체 배열안에 있는 객체들의 멤버들의 값을 출력한다.
//        (즉, 객체 값 리스트를 출력한다.)
public class w9_3 {
    public static void main(String[] args) {
        W9_3_class[] intro = new W9_3_class[3];
        W9_3_class w9_3_class = new W9_3_class();
        intro[0] = new W9_3_class("권진범",25,'남',"music");
        intro[1] = new W9_3_class("김연아",26,'여',"movie");
        intro[2] = new W9_3_class("김철수",27,'남',"soccer");

        System.out.println("a.==============");
        w9_3_class.printSize(intro); //a. 객체 배열의 크기 출력
        System.out.println("b.==============");
        w9_3_class.findKimNumber(intro); //b. 김으로 시작 갯수
        System.out.println("c.==============");
        w9_3_class.findKim(intro); //c. 김으로 시작 이름
        System.out.println("d.==============");
        w9_3_class.findK(intro); //d. c와 d를 함께 출력하라하셨는데 b와 c 겠죠 교수님?
        System.out.println("e.==============");
        w9_3_class.findgender(intro);//e. 남자, 여자의 수 출력
        System.out.println("f,==============");
        w9_3_class.printAll(intro,"남자");// 남자만 출력
        System.out.println("g.==============");
        w9_3_class.printAll(intro,"여자");// 여자만 출력



        }
    }


