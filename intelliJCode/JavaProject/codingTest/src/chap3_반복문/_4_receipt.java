package chap3_반복문;

import java.util.Scanner;

public class _4_receipt {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int sumPrice = scan.nextInt();
        int nPrice = scan.nextInt();
        int sum = 0;
        for (int i = 0; i < nPrice; i++) {
            int price = scan.nextInt();
            int num = scan.nextInt();
            sum += price*num;
        }
        if(sumPrice==sum){
            System.out.println("Yes");
        }else{
            System.out.println("No");
        }
    }
}
