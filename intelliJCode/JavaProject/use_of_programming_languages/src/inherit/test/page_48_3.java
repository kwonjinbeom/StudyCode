package inherit.test;

import use_of_programming_languages.page_48_1; //
import use_of_programming_languages.page_48_2;

public class page_48_3 {
    public static void main(String[] args) {
        page_48_1 page_48_1_1 = new page_48_1();
        page_48_2 page_48_2_1 = new page_48_2();

//        page_48_1_1.num = 10; //얘보면 다른 패키지에 있는 48_1은 protected여서 못 쓰고 48_2는 public이여서 사용가능.
        page_48_2_1.insert();
        page_48_2_1.out();
    }

}
