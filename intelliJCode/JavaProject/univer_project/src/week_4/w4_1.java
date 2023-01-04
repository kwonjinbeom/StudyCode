package week_4;

import java.util.Scanner;

//    1.     나이와 성적을 입력 받아 나이가 30세 미만이고,
//    성적이 3.5 이상이면 “추천 대상입니다”를 출력하고 그렇지 않으면 “추천 대상이 아닙니다”를
//    출력하는 프로그램을 작성하시오.
public class w4_1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("나이 입력");
        int age = input.nextInt();

        System.out.println("성적 입력");
        float grade = input.nextFloat();

        if ( (age < 30) & ( grade >= 3.5 )){
            System.out.println("추천 대상입니다.");
        }
        else{
            System.out.println("추천 대상이 아닙니다.");
        }

        input.close();
    }
}
