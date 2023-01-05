package _5_class;

public class SmartPhoneText {
    public static void main(String[] args) {
        final int phoneNum = 3;

        SmartPhone[] p = {
                new SmartPhone("삼성","갤럭시노트9",1094500,0),
                new SmartPhone("애플","아이폰XS",1364000,10),
                new SmartPhone("삼성","갤럭시S8",935000,35)
        };

        for (int i = 0; i < phoneNum; i++) {
            p[i].calculateDiscount();
        }

        System.out.println("==========제품목록=============");
        for (int i = 0; i < phoneNum; i++) {
            p[i].print(p[i].calculateDiscount());
        }
        System.out.println("--------------------------------");
    }
}
