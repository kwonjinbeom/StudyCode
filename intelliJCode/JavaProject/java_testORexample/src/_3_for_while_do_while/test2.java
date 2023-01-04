package _3_for_while_do_while;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
        float count = 0;
        int sum = 0;
        int num = 0;


        Scanner input = new Scanner(System.in);

        while (true) {
            System.out.println( ((int)count+1) + "번째 정수 입력(종료는 0~100사이가 아닌 값 입력): ");
            num = input.nextInt();
            if ((0 <= num) & (100 >= num)) {
                sum = sum + num;
                count++;
            } else {
                System.out.println("합: " + sum);
                System.out.printf("평균: %.2f ", ( (double)sum/count ) );
                break;
            }
        }




    }
}
