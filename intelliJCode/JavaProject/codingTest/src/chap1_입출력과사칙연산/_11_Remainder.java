package chap1_입출력과사칙연산;

import java.util.Scanner;

public class _11_Remainder {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int A = input.nextInt();
        int B = input.nextInt();
        int C = input.nextInt();

        System.out.println( (A+B)%C );
        System.out.println( ((A%C)+(B%C)) %C);
        System.out.println((A*B)%C);
        System.out.println(((A%C)*(B%C))%C);
    }
}
