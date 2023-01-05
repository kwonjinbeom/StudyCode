package week_4;

import java.util.Scanner;

//    7.     첫 번째로 숫자를, 두 번째로 연산자(+, -)를, 세 번째로 숫자를 입력 받아 두 번째로
//    지정된 연산을 수행하고 그 결과가 0보다 크면 “수식의 결과는 양수입니다”,
//    0이면 “수식의 결과가 0입니다”, 0보다 작으면 “수식의 결과가 음수입니다”를
//    출력하는 프로그램을 작성하시오.
public class w4_7 {
    public static void main(String[] args) {
        int sum;

        Scanner input = new Scanner(System.in);
        System.out.println("숫자 입력");
        int num1 = input.nextInt();

        System.out.println("연산자 입력");
        String Operator = input.next();

        System.out.println("숫자 입력");
        int num2 = input.nextInt();

        if (Operator.charAt(0) == '+'){
            sum = num1 + num2;
            if(sum > 0) {
                System.out.println("수식의 결과는 양수입니다");
                System.out.println("결과 값: " + sum);
            }else if (sum == 0) {
                    System.out.println("수식의 결과가 0입니다");
                    System.out.println("결과 값: " + sum);

                } else{
                    System.out.println("수식의 결과는 음수입니다");
                    System.out.println("결과 값: " + sum);
            }
            }
        else {
            sum = num1 - num2;
            if(sum > 0) {
                System.out.println("수식의 결과는 양수입니다");
                System.out.println("결과 값: " + sum);

            }else if (sum == 0) {
                System.out.println("수식의 결과가 0입니다");
                System.out.println("결과 값: " + sum);
            } else{
                System.out.println("수식의 결과는 음수입니다");
                System.out.println("결과 값: " + sum);
            }
        }


        input.close();
            }
        }
