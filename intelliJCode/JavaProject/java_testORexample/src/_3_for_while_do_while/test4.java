package _3_for_while_do_while;

import java.util.Scanner;

public class test4 {
    public static void main(String[] args) {

        int sum;
        float n_sum;

        Scanner input = new Scanner(System.in);

        while(true) {
            System.out.println("연산자를 1~4으로, 종료는 5를 선택해주세요\n1.+\n2.-\n3.*\n4./\n" +
                    "5.종료\n선택>>");
            int choose = input.nextInt();
            if (choose == 5) {
                System.out.println("프로그램을 종료합니다.");
                break;
            }
                System.out.println("사칙연산을 할 두 수를 입력하세요:");
                int num1 = input.nextInt();
                int num2 = input.nextInt();
                float n_num1 = num1;
                float n_num2 = num2;

                if (choose == 1) {
                    System.out.println(num1 + "+" + num2 + "=" + (sum = num1 + num2));
                } else if (choose == 2) {
                    System.out.println(num1 + "-" + num2 + "=" + (sum = num1 - num2));
                } else if (choose == 3) {
                    System.out.println(num1 + "*" + num2 + "=" + (sum = num1 * num2));
                } else if (choose == 4) {
                    if (num2 != 0) {
                        System.out.printf("%d / %d = %.1f\n", num1, num2, n_sum = (n_num1 / n_num2));
                    } else {
                        System.out.println("분모가 0 입니다.");
                    }
                } else {
                    System.out.println("1~5 사이의 숫자를 입력해주세요.");
                }
            }
        }
    }

