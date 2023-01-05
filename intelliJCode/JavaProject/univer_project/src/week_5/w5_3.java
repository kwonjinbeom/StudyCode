package week_5;

import java.util.Scanner;

//3.	두 개의 숫자를 입력 받아 두 숫자 사이의 홀수 값을 모두 더하여 출력하는 프로그램을 작성하시오.
public class w5_3 {
    public static void main(String[] args) {
        int sum = 0;
        Scanner input = new Scanner(System.in);
        System.out.println("첫 번째 숫자를 입력하세요: ");
        int num1 = input.nextInt();
        System.out.println("두 번째 숫자를 입력하세요: ");
        int num2 = input.nextInt();
        for (int i = num1 + 1; i < num2; i++) {
            if(i % 2 == 1){
                sum = sum + i;
            }
        }
        System.out.println("두 숫자 사이의 홀수 합은: " + sum);
    }
}
