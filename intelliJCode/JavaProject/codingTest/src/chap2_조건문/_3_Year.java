package chap2_조건문;

import java.util.Scanner;

public class _3_Year {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int year = input.nextInt();
        if( (year%4==0) && ((year%400==0) || !(year%100==0)) ){System.out.println(1);}
        else{ System.out.println(0);}
    }
}
