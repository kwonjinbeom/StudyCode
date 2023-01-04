package _2_if_switch;

import java.util.Scanner;

public class test3 {
    public static void main(String[] args) {
        char num_str_1, num_str_10;

        Scanner input = new Scanner(System.in);
        System.out.println("1~99까지의 정수 입력: ");
        int num = input.nextInt();

        String num_string = String.valueOf(num);
        num_str_1 = num_string.charAt(0);
        num_str_10 = num_string.charAt(1);
        int num_1 = num_str_1 - '0';
        int num_10 = num_str_10 - '0';

        if(1 <= num & num <= 99){
            if( ((num_1 % 3) == 0) & ((num_10 % 3) == 0) ){
                System.out.println(num);
                System.out.println("박수 짝짝");
            }else if( ((num_1 % 3) != 0) & ((num_10 % 3) == 0) ){
                System.out.println(num);
                System.out.println("박수 짝");
            }else if( ((num_1 % 3) == 0) & ((num_10 % 3) != 0) ){
                System.out.println(num);
                System.out.println("박수 짝");
            }else{
                System.out.println(num);
            }
        }else{
            System.out.println("값의 범위를 초과하였습니다.");
        }

    }
}
