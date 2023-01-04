package week_5;

import java.util.Scanner;

//    4.	100부터 1까지의 수 중에서 홀수의 합을 구하여
//    출력하는 프로그램을 do-while문을 사용하여 작성하시오.
public class w5_4 {
    public static void main(String[] args) {
        int sum = 0;
        int num = 1;
        do{
            if (num%2 == 1){
                sum = sum + num;
            }
            num ++;
        }while(num <= 100);
        System.out.println("1부터 100까지 홀수의 합: "+sum);
    }
}
