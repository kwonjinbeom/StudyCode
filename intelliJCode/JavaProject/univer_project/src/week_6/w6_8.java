package week_6;

import java.util.Scanner;

public class w6_8 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int i;
        boolean key= true;
        System.out.println("원하는 값: ");
        int num = scan.nextInt();
        for (i = 2; i < num; i++) {
            for (int j = 2; j < i; j++) {
                if (i % j == 0) {
                    key = false;
                }
            }
            if (key == false){
                key = true;
                continue;
            }
            System.out.println(i);
        }
    }
}
