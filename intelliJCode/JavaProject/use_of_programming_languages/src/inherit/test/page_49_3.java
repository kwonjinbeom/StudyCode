package inherit.test;
import use_of_programming_languages.page_49_1; //다른 패키지에 속한 클래스는 import 해야 사용 가능

public class page_49_3 {
    public static void main(String[] args) {
        page_49_1 p49_1 = new page_49_1();
        page_49_2 p49_2 = new page_49_2();

        //p49_1.num1 = 100; // 다른 패키지의 클래스에서는 접근 불가능
        p49_2.num2 = 100; // 같은 패키지의 클래스에서는 접근 가능
    }
}
