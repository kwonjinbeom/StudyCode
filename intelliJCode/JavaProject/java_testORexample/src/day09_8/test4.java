package day09_8;

import java.util.Scanner;
//100부터 999까지의 숫자(3자리수)를 입력 받아 각 자리의 수를 합한 합계를 출력하는 프로그램을 작성하시오.
//[예시]
//입력값: 123
//출력값: 6
public class test4 {
    public static void main(String[] args) {
        //indexing 안한 버전
//        int n_100, n_10, n_1, sum;
//        Scanner input = new Scanner(System.in);
//        System.out.println("100부터 999 사이의 수를 입력해주세요.");
//        int num = input.nextInt();
//
//        n_100 = num / 100;
//        n_10 = (num - (n_100 * 100)) / 10;
//        n_1 = (num - (n_100 * 100) - (n_10 * 10));
//        sum = n_100 + n_10 + n_1;
//
//        System.out.printf("입력값: %d 출력값: %d",num,sum);
//        input.close();

        //indexing 버전

//        int sum;
//
//        Scanner input = new Scanner(System.in);
//        System.out.println("100부터 999 사이의 수를 입력해주세요.");
//        String num = input.next();
//
//        char n_100 = num.charAt(0);
//        char n_10 = num.charAt(1);
//        char n_1 = num.charAt(2);
//
//        int i_100 = (int)(n_100 - '0');
//        int i_10 = (int)(n_10 - '0');
//        int i_1 = (int)(n_1 - '0');
//
//        sum = i_100 + i_10 + i_1;
//
//        System.out.printf("입력값: %s 출력값: %d",num,sum);
//        input.close();

    }
}
