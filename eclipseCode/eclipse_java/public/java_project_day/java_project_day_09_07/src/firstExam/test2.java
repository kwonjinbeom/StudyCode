package firstExam;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
        int kor, eng, math, sum;
        double avg;

        Scanner sc = new Scanner(System.in);

        System.out.print("국어점수를 입력해 주세요 : " );
        kor = sc.nextInt();
        System.out.print("영어점수를 입력해 주세요 : " );
        eng = sc.nextInt();
        System.out.print("수학점수를 입력해 주세요 : " );
        math = sc.nextInt();

        sum = kor + eng + math;
        avg = sum/(double)3;

        System.out.printf("총점은 %d, 평균은 %.1f", sum, avg);
    }
}
