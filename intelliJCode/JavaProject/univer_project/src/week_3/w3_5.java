package week_3;

//    5.     한 사람당 8000원인 영화관에서 10명 이상일 경우 10%, 20명 이상일 경우
//    20%를 할인해 주고 있다. 사람 수를 입력 받아 지불해야 하는 총 비용을 출력하는 프로그램을 작성하시오.
//
//    { 실행 결과 }
//    사람 수 : 00명
//    총 비용(00%할인 적용) : 0000000원

import java.util.Scanner;

public class w3_5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int price = 8000;

        System.out.println("사람 수 입력");
        int consumer = input.nextInt();

        if ( (consumer >= 10) && (consumer < 20) ){
            System.out.println("사람 수 : " + consumer + "명");
            System.out.println("총 비용(10%) 할인 적용 : " + (int)((consumer * price) - ((consumer * price) * (0.1))) + "원");
        }
        else if ( consumer >= 20 ){
            System.out.println("사람 수 : " + consumer + "명");
            System.out.println("총 비용(20%) 할인 적용 : " + (int)((consumer * price) - ((consumer * price) * (0.2))) + "원");
        }
        else{
            System.out.println("사람 수 : " + consumer + "명");
            System.out.println("총 비용(0%) 할인 적용 : " + (consumer * price) + "원");
        }

        input.close();
    }
}
