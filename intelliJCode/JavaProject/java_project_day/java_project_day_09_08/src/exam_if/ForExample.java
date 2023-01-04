package exam_if;

import java.util.Scanner;

public class ForExample {
    public static void main(String[] args) {
        // [실습 1]
        for (int i = 1; i <= 5; i++){
            System.out.print(i + ". ");
            System.out.println("Hello World!");
            System.out.println("I love Coding");
        }

        System.out.println();

        // [실습 2]
        int sum = 0;
        for (int i = 1; i <= 10; i++){
            sum += i;
        }
        System.out.printf("1부터 10까지의 정수의 합 = %d\n", sum);
        System.out.println();

        // [실습 3]
        int start, end;
        Scanner input = new Scanner(System.in);
        System.out.println("두개의 수를 입력해주세요 : ");
        start = input.nextInt();
        end = input.nextInt();

        for (int i = start; i <= end; i++){
            System.out.println(i + " ");
        }

        input.close();
        System.out.println("\n");

        //[실습 4]
        sum = 0;
        for (int i = 1; i <= 10; i++){
            if (i % 3 == 0){
                sum += i;
            }
        }
        System.out.println("3의 배수의 합: " + sum);
        System.out.println();
    }
}
