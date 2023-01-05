package week_5;

import java.util.Scanner;

//7.	사용자로부터 가장 좋아하는 월을 입력 받아
// 그 월에 해당되는 계절을 출력하는 프로그램을 메뉴 형태로 do-while 문을 사용하여 작성하시오.
//    { =======================
//        가장 좋아하는 월은? (종료 : 0 )
//=======================
//****** 5월 ******
//        5월은 봄에 해당됩니다 }
public class w5_7 {
    public static void main(String[] args) {

        boolean jb = true;
        Scanner input = new Scanner(System.in);

        do{
            System.out.println("가장 좋아하는 월은? (종료 : 0 )");
            int month = input.nextInt();
            System.out.println("====================");
            System.out.println("*********"+month+"월**********");

            if((month >= 3) & (month <= 5)){
                System.out.println(month + "월은 봄에 해당됩니다.");
            }else if((month >= 6) & (month <= 8)){
                System.out.println(month + "월은 여름에 해당됩니다.");
            }else if((month >= 9) & (month <= 11)) {
                System.out.println(month + "월은 가을에 해당됩니다.");
            }else if(((month > 10) & (month <= 12)) ^ ((month <= 2)&(month >=1))) {
                System.out.println(month + "월은 겨울에 해당됩니다.");
            }else if(month == 0){
                System.out.println("종료되었습니다.");
                break;
            }else{
                System.out.println("1~12까지의 숫자를 입력해야합니다.");
            }

        }while(jb);

    }
}
