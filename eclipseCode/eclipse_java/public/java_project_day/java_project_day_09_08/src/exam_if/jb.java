package exam_if;

import java.util.Scanner;

public class jb {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // [예제2] 사용자로 하여금 점수를 입력받아 학점을 출력하는 프로그램을 작성해 주세요.
        // 작성 완료 후 점수가 0~ 100사이로 입력하지 않았다면
        // "점수는 0과 100 사이로 입력해 주셔야 합니다." 라고 출력되도록 제어한다.

        int jumsu = 0;
        System.out.println("점수를 0~100 사이로 입력해 주세요.");
        jumsu = input.nextInt();

        char hakjum = '\0';
        if((jumsu < 0) | (jumsu > 100)){
            System.out.println("점수를 0과 100사이로 입력해 주셔야 합니다.");
        }else {
            if ((jumsu >= 90)) {
                hakjum = 'A';
            } if (jumsu >= 80) {
                System.out.println("@");
                hakjum = 'B';
            } if (jumsu >= 70) {
                System.out.println("@@");
                hakjum = 'C';
            } if (jumsu >= 60) {
                System.out.println("@@@");
                hakjum = 'D';
            } else {
                hakjum = 'F';
            }

            System.out.printf("점수 = %d 학점 = %c", jumsu, hakjum);
        }

    }
}



