package use_of_programming_languages;

import inherit.test.page_69_1_Parent;
import inherit.test.page_69_2_Child;

public class page_70_1_test {
    public static void main(String[] args) {
        page_69_2_Child c = new page_69_2_Child();
        c.display();
        c.out();
        System.out.println();

        page_69_1_Parent p = new page_69_1_Parent();
        p.display();
//        p.out();
    }
}
