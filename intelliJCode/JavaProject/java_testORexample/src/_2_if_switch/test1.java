package _2_if_switch;

import java.util.Scanner;

public class test1 {
    public static void main(String[] args) {
        int sum;

        Scanner input = new Scanner(System.in);
        System.out.println("첫 번째 숫자 입력: ");
        int num1 = input.nextInt();

        System.out.println("두 번째 숫자 입력: ");
        int num2 = input.nextInt();

        System.out.println("연산자 입력: ");
        String Operator = input.next();



        if (Operator.charAt(0) == '+'){
            sum = num1 + num2;
        }else if(Operator.charAt(0) == '-') {
            sum = num1 - num2;
        }else if(Operator.charAt(0) == '*') {
            sum = num1 * num2;
        }else if(Operator.charAt(0) == '/') {
            if(num2 != 0 ){
                sum = num1 / num2;
            }else{
                System.out.println("분모가 0 입니다.");
            }
        }else {
            System.out.println("문자를 잘못입력하셨습니다.");
        }






        input.close();
    }
}
