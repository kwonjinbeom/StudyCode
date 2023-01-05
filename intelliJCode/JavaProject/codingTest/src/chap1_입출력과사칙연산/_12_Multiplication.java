package chap1_입출력과사칙연산;

import java.util.Scanner;

public class _12_Multiplication {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a1 = input.nextInt();
        int a2 = input.nextInt();
        int a2_3 = a2/100;
        int a2_2 = (a2-(a2_3*100))/10;
        int a2_1 = a2 - a2_2*10 - a2_3*100;
        int a3, a4 ,a5 ,a6;
        System.out.println(a3 = a1 * a2_1 );
        System.out.println(a4 = a1 * a2_2 );
        System.out.println(a5 = a1 * a2_3 );
        System.out.println(a6 = a1 * a2 );
        //다른 사람 정답
//        System.out.println(a * (b % 10));
//        System.out.println(a * (b%100 / 10));
//        System.out.println(a * (b / 100));
//        System.out.println(a * (a % b));


    }
}
