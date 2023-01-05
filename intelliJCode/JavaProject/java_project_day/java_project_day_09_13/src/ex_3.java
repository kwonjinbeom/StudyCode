import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ex_3 {
    public static void main(String[] args) {
        float sum = 0;
        double average;
        int[] point = new int[5];

        Scanner input = new Scanner(System.in);
        for (int i = 0; i < 5; i++) {
            while(true) {
                System.out.println((i + 1) + "번째 심사위원의 점수: ");
                point[i] = input.nextInt();
                if ((0 > point[i]) ^ (100 < point[i])) {
                    System.out.println("점수는 0~100 사이로 입력해 주세요.");
                } else {
                    break;
                }
            }
        }
        int max = point[0];
        int min = point[0];
        //-----------------------------------------------------
        System.out.println("총 입력된 점수");
        for (int j = 0; j < point.length; j++) {

            if (j == (point.length - 1)) {
                System.out.println(point[j] + " (점)");
            } else {
                System.out.print(point[j] + ", ");
            }
        }
        //-----------------------------------------------------
        System.out.println("제거 대상 점수");
        int max_z = 0;
        int min_z = 0;
        List<Integer> list_point = new ArrayList<>();
        for (int i = 0; i < point.length; i++) {
            list_point.add(point[i]);
        }

        for (int z = 0; z < point.length; z++) {

            if (max < point[z]) {
                max = point[z];
                max_z = z;
            }
        }
        list_point.remove(max_z);
        for (int z = 0; z < point.length; z++) {

            if (min > point[z]) {
                min = point[z];
                min_z = z;

            }
        }
        list_point.remove(min_z);
        System.out.println("최고 점수: " + max + "점");
        System.out.println("최소 점수: " + min + "점");

        //-----------------------------------------------------
        System.out.println("최종 입력 점수");


        int[] point_ = new int[list_point.size()];
        for (int i = 0; i < list_point.size(); i++) {
            point_[i] = list_point.get(i).intValue();
        }

        for (int i = 0; i < point_.length; i++) {
            System.out.print(point_[i] + " ");
            sum = sum + point_[i];
        }
        System.out.print("(점)");
        System.out.println();
        average = sum / point_.length;

        System.out.printf("총점: %.0f점\n", sum);
        System.out.printf("평균: %.2f점\n", average);
    }
}

