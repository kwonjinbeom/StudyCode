package d09_14;

import java.util.Scanner;

public class test4 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int[] seat = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int[] reserve = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        int seat_number;

        do {
            System.out.println("----------------------");
            for (int i = 0; i < seat.length; i++) {
                System.out.print(seat[i] + " ");
                if (i == seat.length - 1) {
                    System.out.println();
                }
            }
            System.out.println("----------------------");
            for (int i = 0; i < seat.length; i++) {
                System.out.print(reserve[i] + " ");
                if (i == reserve.length - 1) {
                    System.out.println();
                }
            }
            System.out.println("----------------------");
            System.out.println("원하시는 좌석번호를 입력하세요(종료는 -1): ");
            seat_number = input.nextInt();

            //좌석 예약처리
            if(seat_number > 10 ^ seat_number == 0 ^ seat_number < -1){
                System.out.println("좌석 번호 선택이 잘못되었습니다.");
            }else if(seat_number == -1){
                System.out.println("프로그램을 종료합니다.");
            }
            else{
                if(reserve[seat_number - 1] == 1){
                    System.out.println("이미 예약된 자리입니다.");
                    continue;
                }
                reserve[seat_number - 1] = 1;
                System.out.println("예약되었습니다.");
            }
        }
        while (seat_number != -1);


    }
}
