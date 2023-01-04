package week_4;

import java.util.Scanner;
//    3.     성별이 여자이면서 토익 성적이 700점 이상인 경우 또는
//    성별이 남자이면서 토익 성적이 800점 이상인 경우에만 “항공 승무원 지원 자격 가능자입니다”를
//    출력하는 프로그램을 작성하시오.

public class w4_3 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("성별 입력");
        String gender = input.next();

        System.out.println("성적 입력");
        int grade = input.nextInt();

        if ( (gender.equals("남자")) & ( grade >= 800 )){

            System.out.println("항공 승무원 지원 자격 가능자입니다.");
        } else if ((gender.equals("여자") & ( grade >= 700 ))) {
            System.out.println("항공 승무원 지원 자격 가능자입니다.");
        } else{
            System.out.println(gender);
            System.out.println("항공 승무원 지원 자격 가능자가 아닙니다.");
        }

        input.close();
    }
}
