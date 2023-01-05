package week_4;

import java.util.Scanner;
//    5.     마트에서 구입한 물건 값과 구입 시간을 입력 받아 실제 지불한 금액을
//    출력하는 프로그램을 작성하시어. 마트는 시간대별로 할인율을 다르게 적용한다.
//          [ 오전 12시 이전 : 구입 금액의 5% 할인
//          오전 12시 이후(12시 포함) : 구입 금액의 2.5% 할인 ]
//    { 실행 결과 }
//    구입 시간 : 10시
//    총 구입 금액 : 100000
//    실제 지불 금액 : 95000
public class w4_5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);


        System.out.println("물건 값 입력");
        int price = input.nextInt();

        System.out.println("구입 시간 입력");
        int time = input.nextInt();

        if ( time < 12 && time > 0){
            System.out.println("구입 시간 : " + time + "시");
            System.out.printf("총 구입 금액 : %d원\n" , price);
            System.out.printf("실제 지불 금액 : %.0f원" , ( price - (price * (5.0/100)) ));
        }
        else if (time >=12 && time <= 24){
            System.out.println("구입 시간 : " + time + "시");
            System.out.printf("총 구입 금액 : %d원\n" , price);
            System.out.printf("실제 지불 금액 : %.0f원" , ( price - (price * (2.5/100)) ));
        }

        input.close();
    }
}
