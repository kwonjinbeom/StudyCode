package firstExam;

import java.util.Scanner;

public class flow_test {
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
