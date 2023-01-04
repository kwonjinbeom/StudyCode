package chap2_조건문;

import java.util.Scanner;

public class _5_Watch {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int H = input.nextInt();
        int M = input.nextInt();

        int C = input.nextInt();
        int C_H = C / 60;
        int C_M = C % 60;
        H = H + C_H;
        M = M + C_M;
        if(M > 59){
            H ++;
            M = M - 60;
        }
        if (H > 23) {
            H = H - 24;
        }

        System.out.println(H + " " + M);
    }
}
