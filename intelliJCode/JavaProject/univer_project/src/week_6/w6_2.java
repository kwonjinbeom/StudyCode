package week_6;

import java.util.Scanner;

public class w6_2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        final int objectNum = 3;
        int total = 0;
        int i;
        double average;
        System.out.println("{");
        for (i = 0; i > -1;  i++) {
            for (int j = 0; j < objectNum; j++) {
                System.out.print((j + 1) + "과목 성적: ");
                int objectScore = scan.nextInt();
                total += objectScore;
            }
            if(total == 0){
                break;
            }
            average = total/objectNum;
            System.out.printf("%d번째 학생 : 총점 %d, 평균 %.0f점\n",i+1,total,average);
            total = 0;
            average = 0;
        }
        System.out.println("총" + i + "명을 성적 처리하였습니다.}");
    }
}
