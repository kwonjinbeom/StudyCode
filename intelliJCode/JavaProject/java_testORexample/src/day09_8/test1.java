package day09_8;

import java.util.Scanner;
//국어, 영어, 수학 점수를 입력받아, 총점과 평균(소수 첫번째 자리)을 구해 출력하는 프로그램을 작성하시오.
public class test1 {
    public static void main(String[] args) {
        float sum, average;
        Scanner input = new Scanner(System.in);
        System.out.println("국어점수 입력");
        int korean = input.nextInt();
        System.out.println("영어점수 입력");
        int english = input.nextInt();
        System.out.println("수학점수 입력");
        int math = input.nextInt();

        sum = korean + english + math;
        average = sum/3;
        System.out.printf("총점은 %.0f, 평균은 %.1f ",sum,average);
        input.close();
    }
}
