package _3_for_while_do_while;

import java.util.Scanner;

public class test1 {
    public static void main(String[] args) {
        int sum = 0;
        int num = 0;
        Scanner input = new Scanner(System.in);


        while(num != -1){
            System.out.println("정수 입력: ");
            num = input.nextInt();
            sum = sum + num;
        }
        System.out.println("합: " + sum);
    }
}
