package _5_class;

public class TaxTest {
    public static void main(String[] args) {
        final int peopleNum = 3;
        Tax[] tax = {
                new Tax("A111", 780000),
                new Tax("B222", 450000),
                new Tax("C333", 570000)
        };


        for (int i = 0; i < peopleNum; i++) {
            tax[i].su();
            tax[i].se();
            tax[i].bong();
            tax[i].grad();
        }

        System.out.println("봉급계산서");
        System.out.println("===============================");
        System.out.println("사번   기본급    수당   세금   본봉   등급");
        System.out.println("===============================");

        for (int i = 0; i < peopleNum; i++) {
            tax[i].print();
        }

    }
}
