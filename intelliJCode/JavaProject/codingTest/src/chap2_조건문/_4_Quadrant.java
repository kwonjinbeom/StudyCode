package chap2_조건문;

import java.util.Scanner;

public class _4_Quadrant {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int H = input.nextInt();
        int M = input.nextInt();
        int M_value = M - 45;
        M = M - 45;
        if (M_value < 0) {
            H = H - 1;
            M = 60 + M_value;

        }
        if(H < 0){
            H = 23;
        }
        System.out.println(H + " " + M);
    }
}
