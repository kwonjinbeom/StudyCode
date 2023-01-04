package week_6;

import java.util.Scanner;

public class w6_1 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int sum = 0;
        System.out.print("값 입력: ");
        int num = scan.nextInt();
        System.out.println("{("+num+"입력)");
        for (int i = 1; i <= num; i++) {
            sum += i;
            if(i%10==0){
                System.out.println("1 - " + i + "까지의 합 : " + sum);
            }
        }
        System.out.println("1 - " + num + "까지의 합 : " + sum + " }");
    }
}
