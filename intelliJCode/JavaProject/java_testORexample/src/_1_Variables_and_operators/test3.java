package _1_Variables_and_operators;

import java.util.Scanner;
//수량, 단가를 입력받아 금액(수량*단가)을 계산한 후,
// 25%를 할인하여, 원래 금액, 할인액, 지불금액을 출력하는 프로그램을 작성하시오.
public class test3 {
    public static void main(String[] args) {
        int ori_price;
        double discount_, discount_price;
        Scanner input = new Scanner(System.in);
        System.out.println("수량 입력");
        int num = input.nextInt();
        System.out.println("단가 입력");
        int price = input.nextInt();

        ori_price = num * price;

        discount_ = ((ori_price) * (25f/100f));

        discount_price = (num * price)-(discount_);
        System.out.printf("원래 금액: %d원 할인액: %.0f원 지불 금액: %.0f원",ori_price,discount_,discount_price);
        input.close();
    }

}
