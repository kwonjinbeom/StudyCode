package week_3;

import java.util.Scanner;

//    9.     2개의 값을 입력 받아 값을 큰 순서대로
//    출력하는 프로그램을 작성하시오.
//    { 실행 결과 }
//    입력 값 : 14  23
//    출력 값 : 23  14
public class w3_9 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("첫 번째 숫자 입력");
        int num_1 = input.nextInt();

        System.out.println("두 번째 숫자 입력");
        int num_2 = input.nextInt();

        if ( num_1 > num_2){
            System.out.println("입력 값 : " + num_1 +"  "+ num_2);
            System.out.println("출력 값 : " + num_1 +"  "+ num_2);
        }
        else{
            System.out.println("입력 값 : " + num_1 +"  "+ num_2);
            System.out.println("출력 값 : " + num_2 +"  "+ num_1);
        }

        input.close();
    }
}
