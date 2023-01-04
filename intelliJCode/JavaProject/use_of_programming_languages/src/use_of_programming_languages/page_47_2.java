package use_of_programming_languages;

public class page_47_2 {
    public static void main(String[] args) {
        page_47_1 psamp = new page_47_1();

//        psamp.num = 10;

        psamp.setNum(10);
        System.out.println(psamp.getNum());
    }
}
// 47_1 클래스에서 private랑 public 클래스에서 변수를 선언했을 때 47_2 클래스에서
// 변수 접근이 되는 지 확인. num은 private여서 안되고, public에서 getNum은 인식이 된다.