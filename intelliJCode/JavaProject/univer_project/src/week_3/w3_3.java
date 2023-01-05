package week_3;

import java.util.Scanner;

//    3.     유권자 수와 투표자 수를 입력 받아 투표율이 50% 이상인 경우
//    “유효 투표입니다”를 출력하는 프로그램을 작성하시오.
public class w3_3 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("유권자 수 입력");
        float voter_ = input.nextInt();
        System.out.println("투표자 수 입력");
        float voter = input.nextInt();

        if ( (voter/voter_) * 100 > 50){
            System.out.printf("투표율 %.2f%%\n", ((voter/voter_) * 100) );
            System.out.println("유효 투표입니다.");
        }
        else{
            System.out.printf("투표율 %.2f%%\n", ((voter/voter_) * 100) );
            System.out.println("유효 투표가 아닙니다.");
        }

        input.close();
    }
}
