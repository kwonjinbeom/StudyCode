package week_5;

import java.util.Scanner;

//6.	사용자로부터 단을 입력 받아 그 단에 해당되는 구구단을 다음과
// 같은 형태로 출력하는 프로그램을 do-while문을 사용하여 작성하시오.
//    { 사용자 입력 : 12
//            ** 12단 **
//        8 * 12 = 96
//        6 * 12 = 72
//        4 * 12 = 48
//        2 * 12 = 24 }
public class w5_6 {
    public static void main(String[] args) {
        int count = 2;
        int num = 0;

        Scanner input = new Scanner(System.in);
        System.out.println("사용자 입력 : ");
        num = input.nextInt();
        System.out.println("** " + num + "단 **");

        do{
            System.out.printf("%d * %d = %d\n",count ,num, count*num);
            count = count + 2;}
            while(count < 9);

        }
    }

