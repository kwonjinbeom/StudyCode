package week_3;

import java.util.Scanner;

//    1.     국어와 영어 점수를 입력 받아 두 점수의 합이 120점 이상이면 합격을,
//    그렇지 않으면 불합격을 출력하는 프로그램을 작성하시오.
public class w3_1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("국어점수 입력");
        int korean = input.nextInt();
        System.out.println("영어점수 입력");
        int english = input.nextInt();

        if ( (korean+english) > 120){
            System.out.println("합격");
        }
        else{
            System.out.println("불합격");
        }

        input.close();
    }

}
