package chap1_입출력과사칙연산;

import java.util.Scanner;

public class _10_Chess {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int king_num = 1;
        int queen_num = 1;
        int look_num = 2;
        int viShop_num = 2;
        int night_num = 2;
        int phone_num = 8;
        int king = input.nextInt();
        int queen = input.nextInt();
        int look = input.nextInt();
        int viShop = input.nextInt();
        int night = input.nextInt();
        int phone = input.nextInt();
        System.out.print((king_num-king)+" "+(queen_num-queen)+" "+(look_num-look)+" "+(viShop_num-viShop)+" "+(night_num-night)+" "+(phone_num-phone) );

    }
}
